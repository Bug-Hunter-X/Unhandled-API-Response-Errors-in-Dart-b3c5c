```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = jsonDecode(response.body);
      // Access data. Note that jsonData might not have the expected keys if the API response is unexpected
      final data = jsonData['data'];
      print('Data: $data');
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // Here is where the issue is more likely to occur.   It is not always apparent where the root cause is
    rethrow; // Re-throw to handle the error further up the call stack
  }
}
```