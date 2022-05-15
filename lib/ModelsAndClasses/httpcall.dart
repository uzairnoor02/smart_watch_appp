import 'package:http/http.dart' as http;

Future<dynamic> myhttpcall(uri) async {
  var headers = {
    'Authorization':
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMzhCS1IiLCJzdWIiOiI5WFlUU0wiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJyc29jIHJhY3QgcnNldCBybG9jIHJ3ZWkgcmhyIHJudXQgcnBybyByc2xlIiwiZXhwIjoxNjUyNzAyMTI5LCJpYXQiOjE2NTI2MTU3Mjl9.zeKADesySKoKcEtkOX_Ef55nBJB9cy1DlYt1cr4499Q",
    'Cookie':
        'fct=cfcc5b4ea1dd41cda946f0decd4d7f9c; JSESSIONID=8AB2FE903D69C660A11A5E53381942E6.fitbit1'
  };
  var request = http.Request('GET', Uri.parse(uri));
  request.headers.addAll(headers);
  http.StreamedResponse streamedResponse = await request.send();

  var response = await http.Response.fromStream(streamedResponse);
  if (response.statusCode == 200) {
    print(" in http.dart");
    var a = response.body;
    print(response.body);
  } else {
    print(response.reasonPhrase);
  }
  return response.body;
}
