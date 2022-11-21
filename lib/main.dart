// ignore_for_file: library_private_types_in_public_api, camel_case_types, unused_local_variable, annotate_overrides, use_build_context_synchronously, avoid_print, unrelated_type_equality_checks, dead_code, unused_import, prefer_const_constructors

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



import 'kurdkhanasystem/SuperAdmin_Qasm/SuperAdminQasm_Home.dart';
import 'kurdkhanasystem/loginkurdkhana/Singnin_role.dart';

import 'kurdkhanasystem/loginkurdkhana/Login_kurdkhana.dart';
import 'kurdkhanasystem/loginkurdkhana/auth_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
       apiKey: 'AIzaSyAMYpyPxrM4Z84D_RSWwk-1n5kuyrTXKn4',
       appId: '1:107149338943:android:a25a87ac82d58772d6cb8a', 
       messagingSenderId: '',
       projectId: 'kuedxanasuperadmin'
        ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
 void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) =>const MainScreen()),);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: const 
      
       MainScreen()//SignIN_Screen(),
    );
  }
}
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            UserHelper.saveUser(snapshot.data!);
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(snapshot.data!.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                    return  Signin_Role();
               
              },
            );
          }
          return const LoginPageKurdkhanaSys();
        });
  }
}

