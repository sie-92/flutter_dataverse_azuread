import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:dataverse/data/account.dart';
import 'package:dataverse/domain/repository.dart';
//import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:flutter_aad_oauth/flutter_aad_oauth.dart';
import 'package:flutter_aad_oauth/model/config.dart';

//import 'package:msal_flutter/msal_flutter.dart';

final String url = "https://org59d74e63.crm4.dynamics.com";

final String version = "9.2";

final String webapiurl = url + "/api/data/v" + version + "/";
final accountsUrl = webapiurl + "accounts?\$select=accountnumber,statecode,emailaddress1,name,address1_country,address1_stateorprovince,address1_composite,websiteurl";

var authorizationEndpoint = Uri.parse(
    "https://login.microsoftonline.com/343f1998-02b9-416b-a60f-1b3bc14717c4/oauth2/token?resource=" +
        url);
final username = 'ie.sakraoui@SIE92.onmicrosoft.com';
final password = 'imed4633@@';

final clientId = 'e4f8c303-0de4-48eb-81e6-a58c9b10a287';
final azureTenantId = "343f1998-02b9-416b-a60f-1b3bc14717c4";
final secret = '';
final redirectUrl = "https://callbackurl";
final scope = "api://e4f8c303-0de4-48eb-81e6-a58c9b10a287/scope";
String? accessToken = "";
final currentUri = Uri.base;
final redirectUri = Uri(
  host: currentUri.host,
  scheme: currentUri.scheme,
  port: currentUri.port,
  path: '/authRedirect.html',
);

late Config config;
late FlutterAadOauth oauth = FlutterAadOauth(config);

class Repository {

static final Repository _singleton = Repository._internal();

  factory Repository() {
    return _singleton;
  }
  Repository._internal();

  
  Future<String> login(context) async {
  config = new Config(
      azureTenantId: azureTenantId,
      clientId: clientId,
      clientSecret: "k2v8Q~-jEwO.L-n.Ou0qNGrMN5hmrVYcONEzJai5",
      scope: "https://org59d74e63.crm4.dynamics.com/.default",
      resource: "https://org59d74e63.crm4.dynamics.com",
      redirectUri: redirectUri.toString(),
      responseType: 'token');

  oauth = FlutterAadOauth(config);
  oauth.setContext(context);
  checkIsLogged();
  try {
    await oauth.login();
    accessToken = await oauth.getAccessToken();
    return (accessToken.toString());
  } catch (e) {
    return "";
  }
}

Future<bool> checkIsLogged() async {
  if (await oauth.tokenIsValid()) {
    accessToken = await oauth.getAccessToken();
    //print('Access token: $accessToken');
    return true;
  } else
    return false;
}

List<Account> parseAccount(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  
  var accounts = list.map((e) => Account.fromJson(e)).toList();
  return accounts;
}

Future</*String */List<Account> > fetchAccounts() async {
  Map<String, String> headers = {
    HttpHeaders.acceptHeader: "*/*",
    HttpHeaders.hostHeader: "http://localhost/",
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: "Bearer $accessToken",
  };
  final http.Response response =
      await http.get(Uri.parse(accountsUrl), headers: headers);

  if (response.statusCode == 200) {
    
    return compute(parseAccount, json.encode(json.decode(response.body)["value"]));
  } else {
    //print(response.body);
    throw Exception(response.statusCode);
  }
}
  
}


