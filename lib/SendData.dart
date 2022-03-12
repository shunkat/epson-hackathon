import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SendData());
}

class SendData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Add Sample',
      home: FirestoreSave(),
    );
  }
}

class FirestoreSave extends StatefulWidget {
  @override
  _MyFirestorePageState createState() => _MyFirestorePageState();
}

class _MyFirestorePageState extends State<FirestoreSave> {
  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addFirestoreUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
        'full_name': "fullName",
        'company': "company",
        'age': "age"
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
                'Body'
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addFirestoreUser,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}