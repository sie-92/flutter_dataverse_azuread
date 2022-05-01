// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dataverse/data/account.dart';
import 'package:dataverse/presentation/screens/home_page.dart';
import 'package:dataverse/presentation/widgets/accounts_grid_view_widget.dart';
import 'package:dataverse/presentation/widgets/accounts_list_view_widget.dart';
import 'package:dataverse/presentation/widgets/grid_btn_widget.dart';
import 'package:dataverse/presentation/widgets/list_btn_widget.dart';
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
    await tester.pumpWidget(MaterialApp(
      home: Material(child: GridBtnWidget(notifyParent: () {})),
    ));

    final btnGrid = find.byKey(ValueKey("btn_grid"), skipOffstage: false);

    expect(btnGrid, findsOneWidget);
  });

  testWidgets('test_list_btn', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Material(child: ListBtnWidget(notifyParent: () {})),
    ));

    final btnList = find.byKey(ValueKey("btn_list"), skipOffstage: false);

    expect(btnList, findsOneWidget);
  });

  testWidgets('test_list', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Material(
      child: AccountsListViewWidget(accounts: [], accountsDisplay: []),
    )));

    final list = find.byKey(ValueKey("list"), skipOffstage: false);

    expect(list, findsOneWidget);
  });

    testWidgets('test_grid', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Material(
      child: AccountsGridViewWidget(accounts: [], accountsDisplay: []),
    )));

    final grid = find.byKey(ValueKey("grid"), skipOffstage: false);

    expect(grid, findsOneWidget);
  });
}
