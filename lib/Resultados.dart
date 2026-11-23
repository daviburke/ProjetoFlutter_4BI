import 'package:flutter/material.dart';
import 'package:projeto_4bi/DetalhesReceita.dart';
import 'package:projeto_4bi/Receita.dart';

class Resultados extends StatelessWidget {
  const Resultados({super.key, required this.termo});

  final String termo;

  @override
  Widget build(BuildContext context) {
    final encontradas = receitasProvisorias
        .where((r) => r.nome.toLowerCase().contains(termo.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Resultados para "$termo"',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            if (encontradas.isEmpty)
              const Text(
                  'Nenhuma receita encontrada. Volte e tente outro nome, por exemplo: bolo.')
            else
              Expanded(
                child: ListView.separated(
                  itemCount: encontradas.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final r = encontradas[i];
                    return Card(
                      color: Colors.teal.shade50,
                      child: ListTile(
                        leading: const Icon(Icons.restaurant),
                        title: Text(r.nome),
                        subtitle: Text(r.tempo),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetalhesReceita(receita: r)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Nova pesquisa'),
            ),
          ],
        ),
      ),
    );
  }
}
