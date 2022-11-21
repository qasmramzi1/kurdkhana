// ignore_for_file: prefer_const_constructors, duplicate_ignore, camel_case_types, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, unused_element, curly_braces_in_flow_control_structures, prefer_void_to_null, unnecessary_this, unused_local_variable, sized_box_for_whitespace, unnecessary_new, use_key_in_widget_constructors, no_logic_in_create_state, must_be_immutable, use_build_context_synchronously


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../model/Signup_user_Model/modelSignup.dart';
import '../../model/onHover.dart';
import 'chatgroup.dart';
import 'menus/Menu_Above.dart';
import 'menus/menuRight.dart';


class QasmSuper_Home extends StatefulWidget {
 

  const QasmSuper_Home({Key? key}) : super(key: key);

  @override
  _QasmSuper_HomeState createState() => _QasmSuper_HomeState();
}

class _QasmSuper_HomeState extends State<QasmSuper_Home> {

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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              
                                // Generated code for this Column Widget...
                        child:  Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                             //profile
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                                child: Container(
                                  width: 850,
                                  height: 96,
                                  
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              //btn logout
                                              InkWell(
                                                onTap: () async {
                                                  logout();
                                                },
                                                child: Container(
                                                  width: 150,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xD01E7908),
                                                    borderRadius: BorderRadius.circular(7),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Text(
                                                          'چونەدەرەوە',
                                                          style: TextStyle(
                                                                fontFamily: 'Poppins',
                                                                color: Colors.white,
                                                              ),
                                                        ),
                                                        Icon(
                                                          Icons.power_settings_new_sharp,
                                                          color: Colors.white,
                                                          size: 24,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //profile
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    loggedInUser.Name!,
                                                   
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                                                    child: Text(
                                                      loggedInUser.Jor!,
                                                      
                                                    ),
                                                  ),
                                                  Text(
                                                     loggedInUser.about!,
                                                    
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 75,
                                                    height: 75,
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
                                                        'https://picsum.photos/seed/136/600',
                                                        fit: BoxFit.cover,
                                                      ),
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
                              
                              //welcome
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(15, 7, 15, 0),
                                child: Container(
                                  width: 850,
                                  height: 450,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 15, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                                child: Text(
                                                  loggedInUser.about!,
                                                  style:
                                                      TextStyle(
                                                            fontFamily: 'Poppins',
                                                            color: Color(0xFFFF3030),
                                                            fontSize: 16,
                                                          ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                                child: Text(
                                                  'تۆکاردەکەییت لەبەشی',
                                                  style:
                                                      TextStyle(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 16,
                                                          ),
                                                ),
                                              ),
                                              Text(
                                                loggedInUser.role!,
                                                style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFFFF3030),
                                                      fontSize: 16,
                                                    ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                                child: Text(
                                                  'تۆ ئێستا لەژورەوەییت وەکو',
                                                  style:
                                                      TextStyle(
                                                            fontFamily: 'Poppins',
                                                            color: Color(0xFF0F0F10),
                                                            fontSize: 16,
                                                          ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(3, 0, 3, 0),
                                                child: Text(
                                                  loggedInUser.Name!,
                                                  style:
                                                      TextStyle(
                                                            fontFamily: 'Poppins',
                                                            color: Color(0xFFFF3030),
                                                            fontSize: 16,
                                                          ),
                                                ),
                                              ),
                                              Text(
                                                'بەڕێز',
                                                style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 16,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 15, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'هاوکارانت ئەمانەن:',
                                                style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF0D0D0E),
                                                      fontSize: 16,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 700,
                                          height: 75,
                                          decoration: BoxDecoration(
                                            
                                          ),
                                          child: StreamBuilder<QuerySnapshot>(
                            stream: (name != 'FollowUP' && name != 'FollowUP')
                                ? //
                                FirebaseFirestore.instance
                                    .collection('users') //
                                    .where('query',isEqualTo: "${loggedInUser.query}") //
                                    
                                    .snapshots()
                                            : //
                                            FirebaseFirestore.instance
                                                .collection("HomePost") //
                                                .snapshots(), //
                                        builder: (context, snapshot) {
                                          return (snapshot.connectionState ==
                                                  ConnectionState.waiting)
                                              ? Center(child: CircularProgressIndicator())
                                              : ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: snapshot.data!.docs.length,
                                                  itemBuilder: (context, index) {
                                                    DocumentSnapshot data =snapshot.data!.docs[index];
                                              return Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                      child: Container(
                                                        width: 175,
                                                        height: 55,
                                                        decoration: BoxDecoration(
                                                          color: Color(0xFFEBE9E9),
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
                                                              Text(
                                                                data['Name'],
                                                                style: TextStyle(
                                                                      fontFamily: 'Poppins',
                                                                      fontSize: 13,
                                                                    ),
                                                              ),
                                                              Container(
                                                                width: 50,
                                                                height: 50,
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
                                                                   data['image'],
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });}
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                                          child: Container(
                                            width: 825,
                                            height: 250,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFD7D7D7),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                   //sarparshtyar
                                                   Container(
                                                      width: 800,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromARGB(255, 255, 255, 255),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  decoration: BoxDecoration(
                                                                    
                                                                    shape: BoxShape.circle,
                                                                  ),
                                                                  child: StreamBuilder<QuerySnapshot>(
                                                                              stream: (name != 'FollowUP' && name != 'FollowUP')
                                                                                  ? //
                                                                                  FirebaseFirestore.instance
                                                                                      .collection('users') //
                                                                                      .where('role',isEqualTo: "SuperAdmin") //
                                                                                      
                                                                                      .snapshots()
                                                                                              : //
                                                                                              FirebaseFirestore.instance
                                                                                                  .collection("HomePost") //
                                                                                                  .snapshots(), //
                                                                                          builder: (context, snapshot) {
                                                                                            return (snapshot.connectionState ==
                                                    ConnectionState.waiting)
                                                                                                ? Center(child: CircularProgressIndicator())
                                                                                                : ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                     
                                                    itemCount: snapshot.data!.docs.length,
                                                    itemBuilder: (context, index) {
                                                      DocumentSnapshot data =snapshot.data!.docs[index];
                                                                      return Container(
                                                                        width: 120,
                                                                        height: 120,
                                                                        clipBehavior: Clip.antiAlias,
                                                                        decoration: BoxDecoration(
                                                                          shape: BoxShape.circle,
                                                                        ),
                                                                        child: Image.network(
                                                                          data['image'],
                                                                          fit: BoxFit.cover,
                                                                        ),
                                                                      );
                                                                    });}
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'سەرپەرشتیار :',
                                                                  
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                                      10, 0, 10, 0),
                                                                  child: Icon(
                                                                    Icons.supervised_user_circle_rounded,
                                                                    color: Colors.black,
                                                                    size: 24,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        
                                                    ),
                                                  SizedBox(height: 5,),
                                                  //programer
                                                   Container(
                                                      width: 800,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromARGB(255, 255, 255, 255),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  decoration: BoxDecoration(
                                                                    
                                                                    shape: BoxShape.circle,
                                                                  ),
                                                                  child: StreamBuilder<QuerySnapshot>(
                                                                              stream: (name != 'FollowUP' && name != 'FollowUP')
                                                                                  ? //
                                                                                  FirebaseFirestore.instance
                                                                                      .collection('users') //
                                                                                      .where('role',isEqualTo: "programer") //
                                                                                      
                                                                                      .snapshots()
                                                                                              : //
                                                                                              FirebaseFirestore.instance
                                                                                                  .collection("HomePost") //
                                                                                                  .snapshots(), //
                                                                                          builder: (context, snapshot) {
                                                                                            return (snapshot.connectionState ==
                                                    ConnectionState.waiting)
                                                                                                ? Center(child: CircularProgressIndicator())
                                                                                                : ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                     
                                                    itemCount: snapshot.data!.docs.length,
                                                    itemBuilder: (context, index) {
                                                      DocumentSnapshot data =snapshot.data!.docs[index];
                                                                      return Container(
                                                                        width: 120,
                                                                        height: 120,
                                                                        clipBehavior: Clip.antiAlias,
                                                                        decoration: BoxDecoration(
                                                                          shape: BoxShape.circle,
                                                                        ),
                                                                        child: Image.network(
                                                                          data['image'],
                                                                          fit: BoxFit.cover,
                                                                        ),
                                                                      );
                                                                    });}
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'پرۆگرامەران:',
                                                                  
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                                      10, 0, 10, 0),
                                                                  child: Icon(
                                                                    Icons.code_outlined,
                                                                    color: Colors.black,
                                                                    size: 24,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        
                                                    ),
                                                SizedBox(height: 5,),
                                                 //desiner
                                                   Container(
                                                      width: 800,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromARGB(255, 255, 255, 255),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  decoration: BoxDecoration(
                                                                    
                                                                    shape: BoxShape.circle,
                                                                  ),
                                                                  child: StreamBuilder<QuerySnapshot>(
                                                                              stream: (name != 'FollowUP' && name != 'FollowUP')
                                                                                  ? //
                                                                                  FirebaseFirestore.instance
                                                                                      .collection('users') //
                                                                                      .where('role',isEqualTo: "UI Designer") //
                                                                                      
                                                                                      .snapshots()
                                                                                              : //
                                                                                              FirebaseFirestore.instance
                                                                                                  .collection("HomePost") //
                                                                                                  .snapshots(), //
                                                                                          builder: (context, snapshot) {
                                                                                            return (snapshot.connectionState ==
                                                    ConnectionState.waiting)
                                                                                                ? Center(child: CircularProgressIndicator())
                                                                                                : ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                     
                                                    itemCount: snapshot.data!.docs.length,
                                                    itemBuilder: (context, index) {
                                                      DocumentSnapshot data =snapshot.data!.docs[index];
                                                                      return Container(
                                                                        width: 120,
                                                                        height: 120,
                                                                        clipBehavior: Clip.antiAlias,
                                                                        decoration: BoxDecoration(
                                                                          shape: BoxShape.circle,
                                                                        ),
                                                                        child: Image.network(
                                                                          data['image'],
                                                                          fit: BoxFit.cover,
                                                                        ),
                                                                      );
                                                                    });}
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'دیزاینەران:',
                                                                  
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                                      10, 0, 10, 0),
                                                                  child: Icon(
                                                                    Icons.draw_outlined,
                                                                    color: Colors.black,
                                                                    size: 24,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        
                                                    ),
                                                 SizedBox(height: 5,),
                                                //seler
                                                   Container(
                                                      width: 800,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromARGB(255, 255, 255, 255),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  decoration: BoxDecoration(
                                                                    
                                                                    shape: BoxShape.circle,
                                                                  ),
                                                                  child: StreamBuilder<QuerySnapshot>(
                                                                              stream: (name != 'FollowUP' && name != 'FollowUP')
                                                                                  ? //
                                                                                  FirebaseFirestore.instance
                                                                                      .collection('users') //
                                                                                      .where('role',isEqualTo: "Seler") //
                                                                                      
                                                                                      .snapshots()
                                                                                              : //
                                                                                              FirebaseFirestore.instance
                                                                                                  .collection("HomePost") //
                                                                                                  .snapshots(), //
                                                                                          builder: (context, snapshot) {
                                                                                            return (snapshot.connectionState ==
                                                    ConnectionState.waiting)
                                                                                                ? Center(child: CircularProgressIndicator())
                                                                                                : ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                     
                                                    itemCount: snapshot.data!.docs.length,
                                                    itemBuilder: (context, index) {
                                                      DocumentSnapshot data =snapshot.data!.docs[index];
                                                                      return Container(
                                                                        width: 120,
                                                                        height: 120,
                                                                        clipBehavior: Clip.antiAlias,
                                                                        decoration: BoxDecoration(
                                                                          shape: BoxShape.circle,
                                                                        ),
                                                                        child: Image.network(
                                                                          data['image'],
                                                                          fit: BoxFit.cover,
                                                                        ),
                                                                      );
                                                                    });}
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'فرۆشیاران:',
                                                                  
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                                      10, 0, 10, 0),
                                                                  child: Icon(
                                                                    Icons.storefront_outlined,
                                                                    color: Colors.black,
                                                                    size: 24,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        
                                                    ),
                                                   ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )

                              
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
void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) =>const MainScreen()),);
  }}
