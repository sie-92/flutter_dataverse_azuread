import 'package:flutter/material.dart';
import 'package:dataverse/data/account.dart';
import 'package:dataverse/presentation/screens/account_details_page.dart';
import 'package:dataverse/domain/repository.dart';

class AccountTile extends StatelessWidget {
  final Account account;
  final bool isGrid;

  AccountTile({required this.account,required this.isGrid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      
      child: Column(
        children: [
          isGrid? Card(
            
          child: 
            InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(context, MaterialPageRoute( builder: (context) => AccountDetailsPage(account: account)));
          },
          child: SizedBox(
            width: 300,
            height: 300,
            child : Column(children : [
              Hero(
              tag: account.accountid??"",
              child: CircleAvatar(
                radius: 60,
                backgroundImage: FadeInImage(image: NetworkImage(account.entityimageUrl!=null?(url+(account.entityimageUrl??"")):""), placeholder: AssetImage("asset/account.png")).image,
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              padding: new EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
              child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [Text(account.name??""), Text(account.address1Composite??""), Text(account.accountnumber??"")]),
            )
            ]),
            
            ),
            ),
            
          ):
          ListTile(
            leading: Hero(
              tag: account.accountid??"",
              child: CircleAvatar(
                                backgroundImage: FadeInImage(image: NetworkImage(account.entityimageUrl!=null?(url+(account.entityimageUrl??"")):""), placeholder: AssetImage("asset/account.png")).image,
              ),
            ),
            title: Text(account.name??""),
            subtitle: Text(account.address1Composite??""),
            trailing: Text(account.accountnumber??""),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountDetailsPage(account: account)));
            },
          ),
          
        ],
      ),
    );
  }
}
