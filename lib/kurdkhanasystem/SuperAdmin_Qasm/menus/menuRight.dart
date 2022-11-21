// ignore_for_file: prefer_const_constructors, duplicate_ignore, camel_case_types, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, unused_element, curly_braces_in_flow_control_structures, prefer_void_to_null, unnecessary_this, unused_local_variable, sized_box_for_whitespace, unnecessary_new, use_key_in_widget_constructors, no_logic_in_create_state, must_be_immutable


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../model/Signup_user_Model/modelSignup.dart';
import '../../../model/onHover.dart';
import '../Pages/Question_Answer.dart';
import '../SuperAdminQasm_Home.dart';
import '../chatgroup.dart';



class Menu_Right extends StatefulWidget {
 

  const Menu_Right({Key? key}) : super(key: key);

  @override
  _Menu_RightState createState() => _Menu_RightState();
}

class _Menu_RightState extends State<Menu_Right> {

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
            //menu right
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 250,
                    height: 639,
                    decoration: BoxDecoration(
                      color: Color(0xE1050505),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          //just text dont nedd edite
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 2,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xC2238E08),
                                ),
                              ),
                              Container(
                                width: 248,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEDEDED),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SelectionArea(
                                          child: Text(
                                       loggedInUser.role!,
                                        style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color(0xC2238E08),
                                              fontSize: 22,
                                            ),
                                      )),
                                      Icon(
                                        Icons.cloud_queue_rounded,
                                        color: Color(0xC2238E08),
                                        size: 35,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25,),
                          //image name Role
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SelectionArea(
                                          child: Text(
                                        loggedInUser.Name!,
                                        style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                      )),
                                      SelectionArea(
                                          child: Text(
                                        loggedInUser.Jor!,
                                        style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFFE8E9E9),
                                              fontSize: 16,
                                            ),
                                      )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
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
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                         
                          SizedBox(height: 25,),
                          Divider(thickness: 2,color: Colors.white,),
                         //menus
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                //home btn
                                onHover(
                                  builder:(isHovered){
                                    final color =isHovered ? Color.fromARGB(255, 10, 159, 218):Colors.black;
                                    return Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: color,
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) =>const QasmSuper_Home()),);
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 50,
                                            // decoration: BoxDecoration(
                                            //   color: Color(0xFF1D1C1C),
                                            // ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'سەرەتا',
                                                  style:
                                                      TextStyle(
                                                            fontFamily: 'Poppins',
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                          ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 25, 5),
                                            child: Icon(
                                              Icons.home,
                                              color: Color.fromARGB(255, 255, 255, 255),
                                              size: 28,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                     );
                               
                                  }
                                 ),
                                //question answer // Question_Answer
                                onHover(
                                  builder:(isHovered){
                                    final color =isHovered ? Color.fromARGB(255, 10, 159, 218):Colors.black;
                                  return Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: color,
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) =>const Question_Answer()),);
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 50,
                                            
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                 Text(
                                                  'پرسیار & وەلام',
                                                  style:
                                                      TextStyle(
                                                            fontFamily: 'Poppins',
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                          ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 25, 5),
                                            child: Icon(
                                              Icons.question_answer,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                  }),
                               //planing
                                onHover(
                                  builder:(isHovered){
                                    final color =isHovered ? Color.fromARGB(255, 10, 159, 218):Colors.black;
                                  return Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: color,
                                    ),
                                    child: InkWell(
                                      onTap: () async {},
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 50,
                                            
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                 Text(
                                                  'پلان',
                                                  style:
                                                      TextStyle(
                                                            fontFamily: 'Poppins',
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 25, 5),
                                            child: Icon(
                                              Icons.menu_book,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                  } ),
                               //barewabrdn
                                onHover(
                                  builder:(isHovered){
                                    final color =isHovered ? Color.fromARGB(255, 10, 159, 218):Colors.black;
                                  return Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: color,
                                    ),
                                    child: InkWell(
                                      onTap: () async {},
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 50,
                                            
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                
                                                 Text(
                                                  'بەڕێوەبردن',
                                                  style:
                                                      TextStyle(
                                                            fontFamily: 'Poppins',
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 25, 5),
                                            child: Icon(
                                              Icons.room_preferences_rounded,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                   }),
                                //tutorials
                               onHover(
                                  builder:(isHovered){
                                    final color =isHovered ? Color.fromARGB(255, 10, 159, 218):Colors.black;
                                  return Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: color,
                                    ),
                                    child: InkWell(
                                      onTap: () async {},
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 50,
                                            
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                
                                                    Text(
                                                  'فێرکاری',
                                                  style:
                                                      TextStyle(
                                                            fontFamily: 'Poppins',
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 25, 5),
                                            child: Icon(
                                              Icons.video_collection,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );}
                                ),
                                //user group
                                onHover(
                                  builder:(isHovered){
                                    final color =isHovered ? Color.fromARGB(255, 10, 159, 218):Colors.black;
                                  return Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: color,
                                    ),
                                    child: InkWell(
                                      onTap: () async {},
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 50,
                                            
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                
                                                     Text(
                                                  'ئەندامان',
                                                  style:
                                                      TextStyle(
                                                            fontFamily: 'Poppins',
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 25, 5),
                                            child: Icon(
                                              Icons.pets_sharp,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );}
                                ),
                               //about
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                  child: onHover(
                                  builder:(isHovered){
                                    final color =isHovered ? Color.fromARGB(255, 10, 159, 218):Colors.black;
                                    return Container(
                                      width: 250,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: color,
                                      ),
                                      child: InkWell(
                                        onTap: () async {},
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 50,
                                              
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  
                                                       Text(
                                                    'دەربارە',
                                                    style:
                                                        TextStyle(
                                                              fontFamily: 'Poppins',
                                                              color: Colors.white,
                                                              fontSize: 18,
                                                            ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            // ignore: prefer_const_constructors
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                      0, 0, 25, 5),
                                              child: Icon(
                                                Icons.accessibility,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                          ],
                                        ),
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
