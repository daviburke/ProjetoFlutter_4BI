import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_4bi/Principal.dart';

void main() {
  testWidgets('Recusa vazio e espaços, aceita termo válido', (tester) async {
    await tester.pumpWidget(const Principal());

    await tester.tap(find.text('Pesquisar'));
    await tester.pump();
    expect(find.textContaining('Digite o nome de uma receita'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), '     ');
    await tester.tap(find.text('Pesquisar'));
    await tester.pump();
    expect(find.textContaining('Digite o nome de uma receita'), findsOneWidget);
    expect(find.textContaining('Você pesquisou'), findsNothing);

    await tester.enterText(find.byType(TextFormField), '  bolo   de  cenoura ');
    await tester.tap(find.text('Pesquisar'));
    await tester.pump();
    expect(find.text('Você pesquisou por: "bolo de cenoura"'), findsOneWidget);
    expect(find.textContaining('Digite o nome de uma receita'), findsNothing);
  });

  testWidgets('Navega Pesquisa > Resultados > Detalhes e volta', (tester) async {
    await tester.pumpWidget(const Principal());
    await tester.enterText(find.byType(TextFormField), 'bolo');
    await tester.tap(find.text('Pesquisar'));
    await tester.pump();
    await tester.tap(find.text('Ver resultados'));
    await tester.pumpAndSettle();
    expect(find.text('Bolo de cenoura'), findsOneWidget);
    await tester.tap(find.text('Bolo de cenoura'));
    await tester.pumpAndSettle();
    expect(find.text('Ingredientes'), findsOneWidget);
    await tester.tap(find.text('Nova pesquisa'));
    await tester.pumpAndSettle();
    expect(find.text('Nome da receita'), findsOneWidget);
  });

  testWidgets('Abre o Perfil pelo ícone', (tester) async {
    await tester.pumpWidget(const Principal());
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();
    expect(find.text('Perfil Profissional'), findsOneWidget);
  });
}
