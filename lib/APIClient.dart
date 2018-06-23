import 'package:http/http.dart' as http;
import 'dart:convert';

class APIClient {
  
  static execute(
    String url, 
    void onSuccess (Map<String, dynamic> json), 
    void onFailure (String message)) async {

    final response = await http.get(url);

    if (response.statusCode == 200) {

      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      
      onSuccess(jsonResponse);

    } else {

      onFailure("Something went wrong :(");
    }

  }

}