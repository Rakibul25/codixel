import 'package:codixel/controllers/api/fetchUser.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    FetchUser fetchUser = FetchUser();
    Future<void> fetchRandomUser() async {
      try {
        User user = await fetchUser.fetcdata();
        print(user.id);
      } catch (e) {
        print('Error fetching user: $e');
        // Handle the error as needed, such as displaying an error message
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'No data',
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchRandomUser();
        },
        child: const Icon(Icons.change_circle),
      ), // ,
    );
  }
}
