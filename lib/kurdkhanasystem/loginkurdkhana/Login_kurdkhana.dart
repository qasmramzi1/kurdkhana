// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, unnecessary_new, unused_field, prefer_final_fields, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../main.dart';


class LoginPageKurdkhanaSys extends StatefulWidget {
  const LoginPageKurdkhanaSys({Key? key}) : super(key: key);

  @override
  _LoginPageKurdkhanaSysState createState() => _LoginPageKurdkhanaSysState();
}

class _LoginPageKurdkhanaSysState extends State<LoginPageKurdkhanaSys> {

 final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  late String errorMessage;
 
    bool _isObscure = true;
  bool _isObscure2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 233, 231, 231),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25, 25, 25, 25),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 500,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 241, 241),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                           //logo
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      width: 120,
                                      height: 120,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'blob:https://mega.nz/652528ce-476c-4f0d-9852-0fb87076e9ef',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //text
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SelectionArea(
                                      child: Text(
                                    'Kurd khana Group System Login',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                  )),
                                ],
                              ),
                            ),
                           //login
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    child: Form(
                            key: _formKey,
                            child: Column(children: [
                                 //just text
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                     
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            115, 0, 0, 0),
                                        child: SelectionArea(
                                            child: Text(
                                          'Email',
                                          style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                              ),
                                        )),
                                      ),
                                    ],
                                  ),
                                 //field email
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Container(
                                      width: 275,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                          color: Color(0xFFD7D3D3),
                                        ),
                                      ),
                                      child: 
                                            Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            2, 2, 2, 2),
                                    child: TextFormField(
                                      controller: emailController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        

                                        labelStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 70, 68, 68),
                                            fontSize: 16,
                                            fontFamily: "verdana_regular",
                                            fontWeight: FontWeight.bold),
                                        hintStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 70, 68, 68),
                                            fontSize: 16,
                                            fontFamily: "verdana_regular",
                                            fontWeight: FontWeight.bold),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        filled: true,
                                        //fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(20, 24, 20, 24),
                                      ),
                                      validator: (value) {
                                        if (value!.length == 0) {
                                          return "Email cannot be empty";
                                        }
                                        if (!RegExp(
                                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                            .hasMatch(value)) {
                                          return ("Please enter a valid email");
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (value) {
                                        emailController.text = value!;
                                      },
                                      keyboardType: TextInputType.emailAddress,

                                      // style: FlutterFlowTheme.of(context).bodyText1,
                                    ),
                                  ),
                                          
                                    ),
                                  ),
                                 //just text
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  115, 0, 0, 0),
                                          child: SelectionArea(
                                              child: Text(
                                            'Password',
                                            style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16,
                                                ),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                 //field pass
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Container(
                                      width: 275,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                          color: Color(0xFFD7D3D3),
                                        ),
                                      ),
                                      child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            2, 2, 2, 2),
                                    child: TextFormField(
                                      controller: passwordController,
                                  obscureText: _isObscure,
                                      decoration: InputDecoration(
                                        labelStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 70, 68, 68),
                                            fontSize: 16,
                                            fontFamily: "verdana_regular",
                                            fontWeight: FontWeight.bold),
                                        hintStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 70, 68, 68),
                                            fontSize: 22,
                                            fontFamily: "verdana_regular",
                                            fontWeight: FontWeight.bold),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        filled: true,
                                        suffixIcon: IconButton(
                                            icon: Icon(_isObscure
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                            onPressed: () {
                                              setState(() {
                                                _isObscure = !_isObscure;
                                              });
                                            }),
                                        //fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(20, 24, 20, 24),
                                      
                                        //fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                      ),
                                      validator: (value) {
                                        RegExp regex = new RegExp(r'^.{6,}$');
                                        if (value!.isEmpty) {
                                          return "Password cannot be empty";
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("please enter valid password min. 6 character");
                                        } else {
                                          return null;
                                        }
                                      },
                                     
                                      //keyboardType: TextInputType.emailAddress,
                                      // style: FlutterFlowTheme.of(context).bodyText1,
                                    ),
                                  ),
                                    ),
                                  ),
                                 //btn login
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 25, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  110, 0, 0, 0),
                                          child: Container(
                                            width: 150,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: Color(0xFFD7D3D3),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(7, 7, 7, 7),
                                              child: InkWell(
                                                onTap: () async {
                                        setState(() {
                                          visible = true;
                                        });
                                        signIn(emailController.text,
                                            passwordController.text);
                                      },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(
                                                      Icons.login_outlined,
                                                      color: Colors.black,
                                                      size: 35,
                                                    ),
                                                   Text(
                                                      'Login',
                                                      style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                          ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                 ])) )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
void signIn(String email, String password) async {
 if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) =>MainScreen()),) //Signin_Role())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage);
        print(error.code);
      }
    }
 }
}

