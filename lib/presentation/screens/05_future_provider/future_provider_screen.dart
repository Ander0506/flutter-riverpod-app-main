import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/provider.dart';


class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pokemonName = ref.watch( pokemonNameProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: pokemonName.when(
          data: (pokenomName) => Text(pokenomName),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator( strokeWidth: 2)
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn-1',
            child: const Icon( Icons.refresh ),
            onPressed: () { 
              ref.read( pokemonIdProvider.notifier ).nextPokemon();
            },
          ),
          const SizedBox( height: 10),
           FloatingActionButton(
            child: const Icon( Icons.minimize_outlined ),
            onPressed: () { 
              ref.read( pokemonIdProvider.notifier ).prevPokemon();
            },
          ),
        ],
      ),
    );
  }
}