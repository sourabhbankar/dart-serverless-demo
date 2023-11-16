import 'dart:convert';
import 'dart:io';
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

// IMPORT OMITTED FOR BREVITY
void main() async {
  Handler<AwsApiGatewayEvent> helloApiGateway = (context, event) async {
    final resp = {
      'message': 'Hello to',
      'host': '${event.headers}',
      'userAgent': '${event.headers}',
    };
    final response = AwsApiGatewayResponse(
      body: json.encode(resp),
      isBase64Encoded: false,
      statusCode: HttpStatus.ok,
      headers: {
        "Content-Type": "application/json",
      },
    );
    return response;
  };

  Runtime()
    ..registerHandler<AwsApiGatewayEvent>("main.hello", helloApiGateway)
    ..invoke();
}
