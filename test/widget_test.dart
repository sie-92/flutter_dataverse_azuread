// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dataverse/presentation/screens/home_page.dart';
import 'package:dataverse/presentation/widgets/accounts_grid_view_widget.dart';
import 'package:dataverse/presentation/widgets/grid_btn_widget.dart';
import 'package:dataverse/presentation/widgets/preloader_widget.dart';
import 'package:dataverse/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test_preloader', (WidgetTester tester) async {
    await tester.pumpWidget(PreloaderWidget());
    final loader = find.byKey(ValueKey("loader"));
    expect(loader, findsOneWidget);
  });

  testWidgets('test_search', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: SearchWidget(
          notifyParent: (str) {},
        ),
      ),
    ));

    final search = find.byKey(ValueKey("search_bar"));
    expect(search, findsOneWidget);
    await tester.enterText(search, "text");
    expect(find.text("text"), findsOneWidget);
  });

  testWidgets('test_grid_btn', (WidgetTester tester) async {
    /*await tester.pumpWidget(MaterialApp(
      home: Material(
          child: GridBtnWidget(notifyParent: () {HomePa})),
    ));*/

    await tester.pumpWidget(MaterialApp(
      home: Material(
          child: HomePage()),
    ));
    //await tester.pumpWidget(HomePage());
    await tester.pump();

    final btnGrid = find.byKey(ValueKey("btn_grid"), skipOffstage: false);

    expect(btnGrid, findsOneWidget);
    await tester.tap(btnGrid);

    await tester.pumpAndSettle();

    final grid = find.byType(AccountsGridViewWidget);
    expect(grid, findsOneWidget);

    //final list = find.byKey(ValueKey("list"));
    //expect(list, findsNothing);


  });
}
