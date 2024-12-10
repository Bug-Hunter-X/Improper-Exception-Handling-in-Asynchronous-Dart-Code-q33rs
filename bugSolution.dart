```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process jsonData
    } else {
      // Handle error responses appropriately
      throw Exception('Failed to load data: ${response.statusCode} - ${response.body}');
    }
  } on SocketException catch (e) {
    // Handle socket exceptions (network issues)
    print('Network error: $e');
    // Handle the network error (e.g. show a message to the user)
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('JSON decoding error: $e');
  } catch (e) {
    // Handle other exceptions
    print('Unexpected error: $e');
    //Consider rethrowing or custom error handling
  }
}
```