import 'package:flutter/material.dart';
import 'package:projeto_4bi/Perfil.dart';
import 'package:projeto_4bi/Resultados.dart';

class Pesquisa extends StatefulWidget {
  const Pesquisa({super.key});

  @override
  State<Pesquisa> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  String? _termoPesquisado;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _normalizar(String texto) =>
      texto.trim().replaceAll(RegExp(r'\s+'), ' ');

  String? _validar(String? valor) {
    if (_normalizar(valor ?? '').isEmpty) {
      return 'Digite o nome de uma receita, por exemplo: bolo de cenoura.';
    }
    return null;
  }

  void _pesquisar() {
    if (!_formKey.currentState!.validate()) {
      setState(() => _termoPesquisado = null);
      return;
    }
    final termo = _normalizar(_controller.text);
    setState(() {
      _termoPesquisado = termo;
      _controller.text = termo;
    });
  }

  void _limpar() {
    _controller.clear();
    setState(() => _termoPesquisado = null);
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisar Receitas'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            tooltip: 'Perfil',
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Perfil()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _controller,
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (_) => _pesquisar(),
                    validator: _validar,
                    decoration: InputDecoration(
                      labelText: 'Nome da receita',
                      hintText: 'Ex.: bolo de cenoura',
                      prefixIcon: const Icon(Icons.restaurant_menu),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        tooltip: 'Limpar',
                        icon: const Icon(Icons.clear),
                        onPressed: _limpar,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: _pesquisar,
                    icon: const Icon(Icons.search),
                    label: const Text('Pesquisar'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            if (_termoPesquisado != null)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.teal),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Você pesquisou por: "$_termoPesquisado"',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                        'Resultados provisórios: as receitas aparecerão aqui.'),
                    const SizedBox(height: 8),
                    const Text(
                        'Para pesquisar de novo, altere o texto e toque em Pesquisar.'),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Resultados(termo: _termoPesquisado!),
                        ),
                      ),
                      child: const Text('Ver resultados'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
