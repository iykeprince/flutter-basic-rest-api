import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_api_app/models/User.dart';
import 'package:json_api_app/profile.screen.dart';

import 'utils.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  //
  // List<User> _users = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getUsers(),
          builder: (context, AsyncSnapshot<List<User>> snapshot) {
            List<User>? users = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                User user = users![index];
                return ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProfileScreen(id: user.id);
                      },
                    ));
                  },
                  title: Text(user.username),
                  subtitle: Text(user.email),
                );
              },
              itemCount: users!.length,
            );
          },
        ),
      ),
    );
  }
}
