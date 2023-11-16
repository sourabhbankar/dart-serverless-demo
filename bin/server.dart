import 'dart:io';

const String serverName = 'myserver';
const int port = 8080;

Future<void> main() async {
// listen on any ip address on port 8080
  final server = await HttpServer.bind(InternetAddress.anyIPv4, port);

// handle requests
  await for (HttpRequest request in server) {
    // set the response headers
    request.response
      ..headers.set('Server', serverName)
      ..headers.set('Content-Type', 'text/plain')
      ..write('Hello, World!');
// close the response
    await request.response.close();
  }
}
