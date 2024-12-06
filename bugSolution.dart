```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        final data = jsonData['data'];
        print('Data: $data');
      } on FormatException catch (e) {
        print('Error: Invalid JSON format - $e');
      } catch (e) {
        print('Error: Unexpected error during JSON processing - $e');
      }
    } else {
      print('API Request Failed. Status Code: ${response.statusCode}.  Response Body: ${response.body}');
      // Consider throwing a custom exception here with more context
      // throw ApiException(response.statusCode, response.body);
    }
  } on http.ClientException catch (e) {
    print('Error: Network error - $e');
  } on FormatException catch (e) {
    print('Error: Invalid JSON format - $e');
  } catch (e) {
    print('Error: An unexpected error occurred: $e');
  }
}
```