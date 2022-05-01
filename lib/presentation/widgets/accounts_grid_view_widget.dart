import 'package:flutter/material.dart';
import 'package:dataverse/data/account.dart';
import 'package:dataverse/presentation/components/account_tile.dart';

class AccountsGridViewWidget extends StatelessWidget {
  List<Account> accounts = <Account>[];
  List<Account> accountsDisplay = <Account>[];

  AccountsGridViewWidget({Key? key, required this.accounts,required this.accountsDisplay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
                            key: Key("grid"),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return AccountTile(
                                  account: this.accountsDisplay[index],
                                  isGrid: true);
                            },
                            itemCount: accountsDisplay.length,
                          );
  }
}