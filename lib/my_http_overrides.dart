import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  HttpClient creatHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  }
}
