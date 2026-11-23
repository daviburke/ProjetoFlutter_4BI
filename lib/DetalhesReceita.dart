import 'package:flutter/material.dart';
import 'package:projeto_4bi/Receita.dart';

class DetalhesReceita extends StatelessWidget {
  const DetalhesReceita({super.key, required this.receita});

  final Receita receita;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receita.nome),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(receita.descricao ?? 'Descrição indisponível',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Row(children: [
              const Icon(Icons.timer_outlined),
              const SizedBox(width: 8),
              Text('Tempo de preparo: ${receita.tempo}'),
            ]),
            const SizedBox(height: 20),
            const Text('Ingredientes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            for (final i in receita.ingredientes) Text('• $i'),
            const SizedBox(height: 24),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Voltar aos resultados'),
                ),
                const SizedBox(width: 12),
                FilledButton(
                  // Volta direto para a primeira tela (Pesquisa).
                  onPressed: () =>
                      Navigator.popUntil(context, (rota) => rota.isFirst),
                  child: const Text('Nova pesquisa'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
