import 'package:http/http.dart' as http;

class HttpService
{
  var baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/";

   Future<http.Response> getRequest(endpoint) async
  {
    http.Response response;

    final url =Uri.parse("$baseUrl$endpoint");

     response = await http.get(url);

    return response;

  }
}























