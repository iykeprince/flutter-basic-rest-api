import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/User.dart';

Future<List<User>> getUsers() async {
  final response = await http.get(Uri.parse('https://fakestoreapi.com/users'));

  List<User> users = [];

  if (response.statusCode == 200) {
    final result = jsonDecode(response.body).cast<Map<String, dynamic>>();
    users = result.map<User>((e) => User.fromJson(e)).toList();
    return users;
  } else {
    throw Exception('A network error has occured');
  }
}

Future<User> getUserById(int id) async {
  User user;
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/users/$id'));
  if (response.statusCode == 200) {
    user = User.fromJson(jsonDecode(response.body));
    return user;
  } else {
    throw Exception('A network error has occured');
  }
}
