import 'dart:io';

import 'package:dataverse/domain/repository.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

final String url = "https://org59d74e63.crm4.dynamics.com";

final String version = "9.2";

final String webapiurl = url + "/api/data/v" + version + "/";

final authorizationEndpoint = Uri.parse(
    "https://login.microsoftonline.com/common/oauth2/authorize?resource=" +
        url);

final username = 'ie.sakraoui@SIE92.onmicrosoft.com';
final password = 'imed4633@@';

final identifier = 'e4f8c303-0de4-48eb-81e6-a58c9b10a287';
final secret = '';

void main() async {
  var client = await oauth2.resourceOwnerPasswordGrant(
      authorizationEndpoint, username, password,
      identifier: identifier, secret: secret);

  var result = await client.read(Uri.parse(webapiurl));
  print(result);
  File('~/.myapp/credentials.json').writeAsString(client.credentials.toJson());
}
