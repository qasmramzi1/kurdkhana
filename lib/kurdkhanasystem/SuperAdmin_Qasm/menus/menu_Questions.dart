// ignore_for_file: prefer_const_constructors, duplicate_ignore, camel_case_types, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, unused_element, curly_braces_in_flow_control_structures, prefer_void_to_null, unnecessary_this, unused_local_variable, sized_box_for_whitespace, unnecessary_new, use_key_in_widget_constructors, no_logic_in_create_state, must_be_immutable, use_build_context_synchronously


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../model/Signup_user_Model/modelSignup.dart';

import '../../../model/onHover.dart';
import '../menus/Menu_Above.dart';
import '../menus/menuRight.dart';



class menu_Questions extends StatefulWidget {
 

  const menu_Questions({Key? key}) : super(key: key);

  @override
  _menu_QuestionsState createState() => _menu_QuestionsState();
}

class _menu_QuestionsState extends State<menu_Questions> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
   User? user = FirebaseAuth.instance.currentUser;
 UserModel loggedInUser = UserModel();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    initUser();
  }

  void initUser() {}
///////////////////////
  DateTime selectedDate = DateTime.now();
  //final berlinWallFell = DateTime.utc(1989, 11, 9);
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019, 1),
        lastDate: DateTime(2111));
    if (picked != null)
      setState(() {
        selectedDate = picked;
      });
  }



  final fs = FirebaseFirestore.instance;
  final TextEditingController message = new TextEditingController();
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFCFCFCF),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
             
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 230,
                                    height: 279,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF2A2828),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                      ),
                                    ),
                                   
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SizedBox(height: 25,),
                                         //menu question
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                               //questions
                                                InkWell(
                                                  onTap: () async {},
                                                  child: onHover(
                                                    
                                                        builder:(isHovered){
                                                        final color =isHovered ? Color.fromARGB(255, 145, 218, 10):Colors.black;
                                                  return Container(
                                                      width: 240,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: color,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          
                                                            Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                0, 0, 0, 0),
                                                            child: Container(width: 75,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  Text(
                                                                    'پرسیارەکان',
                                                                    style: TextStyle(
                                                                          fontFamily: 'Poppins',
                                                                          color: Colors.white,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.quickreply,
                                                            color: Colors.white,
                                                            size: 24,
                                                          ),
                                                        ],
                                                      ),
                                                    );}
                                                  ),
                                                ),
                                               //not answer
                                                InkWell(
                                                  onTap: () async {},
                                                  child: onHover(
                                                    
                                                        builder:(isHovered){
                                    final color =isHovered ? Color.fromARGB(255, 145, 218, 10):Colors.black;
                                    return Container(
                                                      width: 240,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: color,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                0, 0, 0, 0),
                                                            child: Container(width: 75,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  Text(
                                                                    'وەلام نەدراوە',
                                                                    style: TextStyle(
                                                                          fontFamily: 'Poppins',
                                                                          color: Colors.white,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          
                                                          Icon(
                                                            Icons.error_outlined,
                                                            color: Colors.white,
                                                            size: 24,
                                                          ),
                                                        ],
                                                      ),
                                                    );}
                                                  ),
                                                ),
                                               //answer
                                                InkWell(
                                                  onTap: () async {},
                                                  child: onHover(
                                                    
                                                        builder:(isHovered){
                                    final color =isHovered ? Color.fromARGB(255, 145, 218, 10):Colors.black;
                                    return Container(
                                                      width: 240,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: color,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                0, 0, 18, 0),
                                                            child: Container(width: 75,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  Text(
                                                                    'وەلام دراوە  ',
                                                                    style: TextStyle(
                                                                          fontFamily: 'Poppins',
                                                                          color: Colors.white,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 25,),
                                                          Icon(
                                                            Icons.question_answer_outlined,
                                                            color: Colors.white,
                                                            size: 24,
                                                          ),
                                                        ],
                                                      ),
                                                    );}
                                                  ),
                                                ),
                                                 //me
                                                InkWell(
                                                  onTap: () async {},
                                                  child: onHover(
                                                    
                                                        builder:(isHovered){
                                    final color =isHovered ? Color.fromARGB(255, 145, 218, 10):Colors.black;
                                    return Container(
                                                      width: 240,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: color,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                0, 0, 0, 0),
                                                            child: Container(width: 75,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  Text(
                                                                    'مـــــن',
                                                                    style: TextStyle(
                                                                          fontFamily: 'Poppins',
                                                                          color: Colors.white,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 14,),
                                                           Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(35, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 30,
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
                                                        loggedInUser.image!,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                                          
                                                        ],
                                                      ),
                                                    );}
                                                  ),
                                                ),
                                               
                                                ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    
                                  ),
                                ],
                              ),
                            ],
                          ),

                          ],
                    ),
                  
            ],
          ),
        ),
      ),
    );
  }
}
