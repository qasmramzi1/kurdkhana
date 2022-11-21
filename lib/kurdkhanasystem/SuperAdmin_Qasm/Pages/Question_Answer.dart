// ignore_for_file: prefer_const_constructors, duplicate_ignore, camel_case_types, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, unused_element, curly_braces_in_flow_control_structures, prefer_void_to_null, unnecessary_this, unused_local_variable, sized_box_for_whitespace, unnecessary_new, use_key_in_widget_constructors, no_logic_in_create_state, must_be_immutable, use_build_context_synchronously


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../model/Signup_user_Model/modelSignup.dart';


import '../menus/Menu_Above.dart';
import '../menus/menuRight.dart';
import '../menus/menu_Questions.dart';



class Question_Answer extends StatefulWidget {
 

  const Question_Answer({Key? key}) : super(key: key);

  @override
  _Question_AnswerState createState() => _Question_AnswerState();
}

class _Question_AnswerState extends State<Question_Answer> {

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
                        //menu above
                              Container(
                                    width: 900,
                                    height: 50,
                                    child: Expanded(child: Menu_Above())),
                            //Nawaroki hamu awanay clickean laser dakret
                          // Generated code for this Row Widget...
                          SizedBox(height: 15,),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Generated code for this Column Widget...
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                 Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                      child: Container(
                                        width: 600,
                                        height: 570,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF8F8F8),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                          child: Column(
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
                                                        width: 500,
                                                        height: 160,
                                                        decoration: BoxDecoration(
                                                          color: Color.fromARGB(255, 226, 225, 225),
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                          child: Row(
                                                            mainAxisSize: MainAxisSize.max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                children: [
                                                                  Container(
                                                                    width: 250,
                                                                    height: 100,
                                                                    decoration: BoxDecoration(
                                                                    color: Color.fromARGB(255, 255, 255, 255),
                                                                  ),
                                                                    child: Row(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment.center,
                                                                      children: [
                                                                        Text(
                                                                          'Text Question',
                                                                          
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0, 5, 0, 0),
                                                                    child: Row(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional
                                                                              .fromSTEB(0, 0, 5, 0),
                                                                          child: Container(
                                                                            width: 75,
                                                                            height: 35,
                                                                            decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ),
                                                                            child: Row(
                                                                              mainAxisSize:
                                                                                  MainAxisSize.max,
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment
                                                                                      .center,
                                                                              children: [
                                                                                Text(
                                                                                  'Edite',
                                                                                
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional
                                                                              .fromSTEB(0, 0, 5, 0),
                                                                          child: Container(
                                                                            width: 75,
                                                                            height: 35,
                                                                            decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ),
                                                                            child: Row(
                                                                              mainAxisSize:
                                                                                  MainAxisSize.max,
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment
                                                                                      .center,
                                                                              children: [
                                                                                Text(
                                                                                  'Delete',
                                                                                
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width: 75,
                                                                          height: 35,
                                                                          decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ),
                                                                          child: Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                'وەلام',
                                                                              
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0, 0, 0, 3),
                                                                    child: Container(
                                                                      width: 120,
                                                                      height: 35,
                                                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ),
                                                                      child: Row(
                                                                        mainAxisSize: MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'File',
                                                                          
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0, 0, 0, 3),
                                                                    child: Container(
                                                                      width: 120,
                                                                      height: 35,
                                                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ),
                                                                      child: Row(
                                                                        mainAxisSize: MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Video',
                                                                            
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0, 0, 0, 3),
                                                                    child: Container(
                                                                      width: 120,
                                                                      height: 35,
                                                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ),
                                                                      child: Row(
                                                                        mainAxisSize: MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Voies',
                                                                            
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 120,
                                                                    height: 35,
                                                                    decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ),
                                                                    child: Row(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment.center,
                                                                      children: [
                                                                        Text(
                                                                          'image',
                                                                        
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 85,
                                                          height: 85,
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
                                                              'https://picsum.photos/seed/575/600',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                          child: Text(
                                                            'UI Design',
                                                          
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 250,
                                    height: 565,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF2A2828),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 230,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFAFAFA),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          'لینکی فایل',
                                                        
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                child: Container(
                                                  width: 230,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'ڕونکردنەوەی بابەت بەنوسین',
                                                      
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                      child: Container(
                                                        width: 60,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'لینکی وێنە',
                                                              
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                      child: Container(
                                                        width: 65,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'لینکی دەنگ',
                                                            
                                                                
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 60,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'لینکی ڤیدۆ',
                                                            
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                child: Container(
                                                  width: 70,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEB8E31),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'ناردن',
                                                        
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                         //menu question
                                        Expanded(child: menu_Questions())
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          ],
                    ),
                  //menu right
                    Expanded(child: Menu_Right())
            ],
          ),
        ),
      ),
    );
  }
}
