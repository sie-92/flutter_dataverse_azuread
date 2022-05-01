import 'package:dataverse/presentation/widgets/grid_btn_widget.dart';
import 'package:dataverse/presentation/widgets/list_btn_widget.dart';
import 'package:dataverse/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:dataverse/data/account.dart';
import 'package:dataverse/domain/repository.dart';
import 'package:dataverse/presentation/widgets/preloader_widget.dart';
import 'package:dataverse/presentation/components/account_tile.dart';
import 'package:dataverse/presentation/widgets/accounts_grid_view_widget.dart';
import 'package:dataverse/presentation/widgets/accounts_list_view_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Account> _accounts = <Account>[];
  List<Account> _accountsDisplay = <Account>[];

  List<String> codes = ["All", "0", "1"];
  List<String> states = [
    'All',
    'AL',
    'AK',
    'AZ',
    'AR',
    'CA',
    'CO',
    'CT',
    'DE',
    'FL',
    'GA',
    'HI',
    'ID',
    'IL',
    'IN',
    'IA',
    'KS',
    'KY',
    'LA',
    'ME',
    'MD',
    'MA',
    'MI',
    'MN',
    'MS',
    'MO',
    'MT',
    'NE',
    'NV',
    'NH',
    'NJ',
    'NM',
    'NY',
    'NC',
    'ND',
    'OH',
    'OK',
    'OR',
    'PA',
    'RI',
    'SC',
    'SD',
    'TN',
    'TX',
    'UT',
    'VT',
    'VA',
    'WA',
    'WV',
    'WI',
    'WY'
  ];
  String selectedCode = "All";
  String selectedState = "All";
  String selectedProvince = "";

  bool _isLoading = true;
  bool _isLogedIn = false;
  bool _isGrid = false;
  String _text = "";

  @override
  void initState() {
    super.initState();

    if (!_isLogedIn) {
      Repository().login(context).then((value) {
        _isLogedIn = true;
        _isLoading = true;
        setState(() {
          _text = "Token : " + value;
          //print(value);
        });

        Repository().fetchAccounts().then((value) async {
          setState(() {
            _accounts.addAll(value);
            _accountsDisplay = _accounts;
            //print(_accountsDisplay.length);
          });
          await Future.delayed(const Duration(milliseconds: 3500), () {
            setState(() {
              _isLoading = false;
            });
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accounts List'),
      ),
      body: SafeArea(
        child: _isLoading
            ? Container(child: PreloaderWidget())
            : Column(children: [
                SizedBox(
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 6,
                        child:
                            SearchWidget(notifyParent: search), //_searchBar(),
                      ),
                      Expanded(
                        flex: 1,
                        child: DropdownButton<String>(
                          key: Key("drop_state"),
                          hint: Text('Filter'),
                          icon: new Icon(Icons.filter_list_alt),
                          value: selectedState,
                          items: states.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (state) {
                            selectedState = state ?? "";
                            state = (state == 'All') ? "" : state;
                            state = state?.toLowerCase() ?? "";
                            setState(() {
                              _isLoading = true;
                              _accountsDisplay = _accounts.where((u) {
                                var aState = (u.address1Stateorprovince ?? "")
                                    .toLowerCase();
                                return aState.contains(state ?? "");
                              }).toList();
                              _isLoading = false;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DropdownButton<String>(
                          key: Key("drop_code"),
                          hint: Text('Filter'),
                          icon: new Icon(Icons.filter_list_alt),
                          value: selectedCode,
                          items: codes.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (code) {
                            selectedCode = code ?? "";
                            code = (code == 'All') ? "" : code;
                            code = code?.toLowerCase() ?? "";
                            setState(() {
                              _isLoading = true;
                              _accountsDisplay = _accounts.where((u) {
                                var aCode =
                                    (u.statecode.toString()).toLowerCase();
                                return aCode.contains(code ?? "");
                              }).toList();
                              _isLoading = false;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ListBtnWidget(notifyParent: setList),
                      ),
                      Expanded(
                        flex: 1,
                        child: GridBtnWidget(key : Key("btn_grid"),notifyParent: setGrid),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: _isGrid
                        ? AccountsGridViewWidget(
                            accounts: _accounts,
                            accountsDisplay: _accountsDisplay)
                        : AccountsListViewWidget(
                            accounts: _accounts,
                            accountsDisplay: _accountsDisplay)),
              ]),
      ),
    );
  }

  search(searchText) {
    searchText = searchText.toLowerCase();
    setState(() {
      _isLoading = true;
      _accountsDisplay = _accounts.where((u) {
        //print(searchText);
        var fName = (u.name ?? "").toLowerCase();
        var fNumber = (u.accountnumber ?? "").toLowerCase();
        return fName.contains(searchText) || fNumber.contains(searchText);
      }).toList();
      _isLoading = false;
    });
  }

  setGrid() {
    setState(() {
      _isGrid = true;
    });
  }

  setList() {
    setState(() {
      _isGrid = false;
    });
  }
}
