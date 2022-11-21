// ignore_for_file: camel_case_types, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_typing_uninitialized_variables, unnecessary_this, dead_code, unused_element, file_names, unused_import, non_constant_identifier_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



import '../SuperAdmin_Qasm/SuperAdminQasm_Home.dart';
import '../../model/Signup_user_Model/modelSignup.dart';


class Signin_Role extends StatefulWidget {
  @override
  _Signin_RoleState createState() => _Signin_RoleState();
}

class _Signin_RoleState extends State<Signin_Role> {
  _Signin_RoleState();
  @override
  Widget build(BuildContext context) {
    return const contro();
  }
}

class contro extends StatefulWidget {
  const contro();

  @override
  _controState createState() => _controState();
}

class _controState extends State<contro> {
  _controState();

  ///////////////////////
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var role;
  var Jor;
  var emaill;
  var id;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      const CircularProgressIndicator();
      setState(() {
        emaill = loggedInUser.email.toString();
        role = loggedInUser.role.toString();
        id = loggedInUser.uid.toString();
        Jor = loggedInUser.Jor.toString();
      });
    });
  }

  routing() {
   
    /////////////////////////
    /////////////////////////
    if (role == 'SuperAdmin' && Jor == 'SuperAdmin') {
      return const QasmSuper_Home();
    }
    /////////////////////////
    /////////////////////////
   
    
  }

  @override
  Widget build(BuildContext context) {
    const CircularProgressIndicator();
    return routing();
  }
}
