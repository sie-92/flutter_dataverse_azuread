import 'package:flutter/material.dart';
import 'package:dataverse/data/account.dart';
import 'package:dataverse/presentation/components/account_tile.dart';

class AccountsListViewWidget extends StatelessWidget {
  List<Account> accounts = <Account>[];
  List<Account> accountsDisplay = <Account>[];

  AccountsListViewWidget({Key? key, required this.accounts,required this.accountsDisplay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                            key: Key("list"),
                            itemBuilder: (context, index) {
                              return AccountTile(
                                  account: this.accountsDisplay[index],
                                  isGrid: false);
                            },
                            itemCount: accountsDisplay.length,
                          );
  }
}