import 'dart:async';
import 'dart:io';
import 'package:http/io_client.dart';


const String _url = "https://jsonplaceholder.typicode.com/";

solveCertError() {
  final ioc = new HttpClient();
  ioc.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
  final http = new IOClient(ioc);

  return http;
}

var http = solveCertError();



Future<dynamic> getData({apiUrl}) async {
  var fullUrl = _url + apiUrl;
  var uri=Uri.parse(fullUrl);
  return await http.get(uri, headers: await _authHeader());
}



_authHeader() => {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};




