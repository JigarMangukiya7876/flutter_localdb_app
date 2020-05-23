import 'package:flutterinterviewdemo/Model/UserData.dart';
import 'package:flutterinterviewdemo/utils.dart';
import 'package:http/http.dart' as http;

Future<List<UserData>> fetchUsers() async {
  final response =
      await http.get('https://www.iroidsolutions.com/interview/test.json');

  if (response.statusCode == 200) {
    // Saving user data into local
    PrefUtils().saveUsers(parseUsers(response.body));
    return parseUsers(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
