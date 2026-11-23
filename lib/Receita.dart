class Receita {
  const Receita(this.nome, this.descricao, this.tempo, this.ingredientes);

  final String nome;
  final String? descricao;
  final String tempo;
  final List<String> ingredientes;
}

const receitasProvisorias = <Receita>[
  Receita('Bolo de cenoura', 'Bolo fofinho com cobertura de chocolate.',
      '50 min', ['3 cenouras', '3 ovos', '1 xícara de óleo', '2 xícaras de farinha']),
  Receita('Bolo de chocolate', 'Clássico para o café da tarde.', '45 min',
      ['3 ovos', '1 xícara de chocolate em pó', '2 xícaras de farinha']),
  Receita('Lasanha', 'Camadas de massa, molho e queijo.', '1 h 20 min',
      ['Massa de lasanha', 'Molho de tomate', 'Queijo', 'Presunto']),
  Receita('Panqueca', null, '30 min', ['2 ovos', '1 xícara de leite', '1 xícara de farinha']),
  Receita('Brigadeiro', 'Doce de festa fácil de fazer.', '20 min',
      ['1 lata de leite condensado', '3 colheres de chocolate em pó', '1 colher de manteiga']),
];
