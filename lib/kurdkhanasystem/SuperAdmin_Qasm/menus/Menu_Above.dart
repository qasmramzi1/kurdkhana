// ignore_for_file: prefer_const_constructors, duplicate_ignore, camel_case_types, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, unused_element, curly_braces_in_flow_control_structures, prefer_void_to_null, unnecessary_this, unused_local_variable, sized_box_for_whitespace, unnecessary_new, use_key_in_widget_constructors, no_logic_in_create_state, must_be_immutable, use_build_context_synchronously


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../model/Signup_user_Model/modelSignup.dart';
import '../../../model/onHover.dart';
import '../chatgroup.dart';



class Menu_Above extends StatefulWidget {
 

  const Menu_Above({Key? key}) : super(key: key);

  @override
  _Menu_AboveState createState() => _Menu_AboveState();
}

class _Menu_AboveState extends State<Menu_Above> {

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
             
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  //menu above
                  Container(
                    width: 900,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDEDED),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //profile
                        Container(
                          width: 300,
                          height: 75,
                          decoration: BoxDecoration(
                            color: Color(0xFFEDEDED),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                               //chat persion
                                InkWell(
                                  onTap: () async {
                                     showDialog(
                                       context: context,
                                       builder: (context) => Center(
                                       child: Padding(
                                         padding: const EdgeInsets.only(
                                          top: 27,
                                          left: 0,
                                          right: 700,
                                          bottom: 0
                                         ),
                                         child: Container(
                                          // color: Colors.white,
                                           width: 450.0,
                                           height: 650.0,
                                           child: Dialog(
                                           child: ListView(children: <Widget>[
                                           Column(mainAxisSize: MainAxisSize.max, children: [
                                           SingleChildScrollView(
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  Container(
                                                    height: MediaQuery.of(context).size.height * 0.79,
                                                    child: messages(
                                                      email: loggedInUser.email!,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: TextFormField(
                                                          controller: message,
                                                          decoration: InputDecoration(
                                                            filled: true,
                                                            fillColor: Colors.purple[100],
                                                            hintText: 'message',
                                                            enabled: true,
                                                            contentPadding: const EdgeInsets.only(
                                                                left: 14.0, bottom: 8.0, top: 8.0),
                                                            focusedBorder: OutlineInputBorder(
                                                              borderSide: new BorderSide(color: Colors.purple),
                                                              borderRadius: new BorderRadius.circular(10),
                                                            ),
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide: new BorderSide(color: Colors.purple),
                                                              borderRadius: new BorderRadius.circular(10),
                                                            ),
                                                          ),
                                                          validator: (value) {},
                                                          onSaved: (value) {
                                                            message.text = value!;
                                                          },
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          if (message.text.isNotEmpty) {
                                                            fs.collection('Messages').doc().set({
                                                              'message': message.text.trim(),
                                                              'time': DateTime.now(),
                                                              'email': loggedInUser.email!,
                                                              'Name': loggedInUser.Name!,
                                                              'image': loggedInUser.image!,
                                                              'role': loggedInUser.role!,
                                                              'Jor': loggedInUser.Jor!,
                                                              'Query':'Chat-Group',
                                                            });

                                                            message.clear();
                                                          }
                                                        },
                                                        icon: Icon(Icons.send_sharp),
                                                      ),
                                                    ],
                                                  )])
                                                                                  )
                                           ])]))),
                                       )));
                                  },
                                  child: Icon(
                                    Icons.chat_rounded,
                                    color: Colors.black,
                                    size: 35,
                                  ),
                                ),
                               //logout
                                InkWell(
                                  onTap: () async {
                                     showDialog(
                                       context: context,
                                       
                                       builder: (context) => Center(
                                       child: Padding(
                                         padding: const EdgeInsets.only(
                                          top: 27,
                                          left: 0,
                                          right: 790,
                                          bottom: 450,
                                         ),
                                         child: Container(
                                          //color: Colors.black,
                                           width: 298.0,
                                           height: 148.0,
                                           child: Dialog(
                                           child: ListView(children: <Widget>[
                                           Column(mainAxisSize: MainAxisSize.max, children: [
                                            //Edit Profile
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
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                       Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                            0, 0, 10, 5),
                                                        child: Icon(
                                                          Icons.person_2_outlined,
                                                          color: Color.fromARGB(255, 211, 240, 81),
                                                          size: 28,
                                                        ),
                                                      ),
                                                     // SizedBox(width: 15,),
                                                    
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
                                                              'Edite Profile',
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
                                                     ],
                                                  ),
                                                ),
                                                );
                                          
                                              }
                                            ),
                                            //logout
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
                                                    logout();
                                                  },
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                       Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                            0, 0, 10, 5),
                                                        child: Icon(
                                                          Icons.logout_outlined,
                                                          color: Color.fromARGB(255, 211, 240, 81),
                                                          size: 28,
                                                        ),
                                                      ),
                                                     // SizedBox(width: 15,),
                                                    
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
                                                              'Log Out',
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
                                                     ],
                                                  ),
                                                ),
                                                );
                                          
                                              }
                                            ),
                                            
                                           ])]))))));
                                  },
                                  child: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                                //name
                                SelectionArea(
                                    child: Text(
                                 loggedInUser.Name!,
                                  style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF1D1C1C),
                                        fontSize: 18,
                                      ),
                                )),
                                //image
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
                                      loggedInUser.image!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //menu persion
                        Container(
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFEDEDED),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //notifaction
                              InkWell(
                                onTap: () async {},
                                child: Icon(
                                  Icons.notifications,
                                  color: Color(0xFF1D1C1C),
                                  size: 40,
                                ),
                              ),
                              //chat
                              InkWell(
                                onTap: () async {},
                                child: Icon(
                                  Icons.message,
                                  color: Color(0xFF1D1C1C),
                                  size: 40,
                                ),
                              ),
                              //menu persion
                              InkWell(
                                onTap: () async {
                                     showDialog(
                                       context: context,
                                       
                                       builder: (context) => Center(
                                       child: Padding(
                                         padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 390,
                                          right: 0,
                                          bottom: 300,
                                         ),
                                         child: Container(
                                          //color: Colors.black,
                                           width: 298.0,
                                           height: 298.0,
                                           child: Dialog(
                                           child: ListView(children: <Widget>[
                                           Column(mainAxisSize: MainAxisSize.max, children: [
                                            //bajdarikrdn
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
                                                        // decoration: BoxDecoration(
                                                        //   color: Color(0xFF1D1C1C),
                                                        // ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                          children: [
                                                            Text(
                                                              'بەژداریکردن',
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
                                                      SizedBox(width: 15,),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                            0, 0, 25, 5),
                                                        child: Icon(
                                                          Icons.maps_home_work_outlined,
                                                          color: Color.fromARGB(255, 211, 240, 81),
                                                          size: 28,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                );
                                          
                                              }
                                            ),
                                             //barkawtn $
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
                                                        // decoration: BoxDecoration(
                                                        //   color: Color(0xFF1D1C1C),
                                                        // ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                          children: [
                                                            Text(
                                                              'حیـسـابات',
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
                                                      SizedBox(width: 15,),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                            0, 0, 25, 5),
                                                        child: Icon(
                                                          Icons.payments_outlined,
                                                          color: Color.fromARGB(255, 211, 240, 81),
                                                          size: 28,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                );
                                          
                                              }
                                            ),
                                            //پرۆفایلی کار
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
                                                        // decoration: BoxDecoration(
                                                        //   color: Color(0xFF1D1C1C),
                                                        // ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                          children: [
                                                            Text(
                                                              'پرۆفایلی کار',
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
                                                      SizedBox(width: 15,),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                            0, 0, 25, 5),
                                                        child: Icon(
                                                          Icons.admin_panel_settings_outlined,
                                                          color: Color.fromARGB(255, 211, 240, 81),
                                                          size: 28,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                );
                                          
                                              }
                                            ),
                                            // کارەکانم
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
                                                        // decoration: BoxDecoration(
                                                        //   color: Color(0xFF1D1C1C),
                                                        // ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                          children: [
                                                            Text(
                                                              'کارەکانـــم',
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
                                                      SizedBox(width: 15,),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                            0, 0, 25, 5),
                                                        child: Icon(
                                                          Icons.precision_manufacturing_outlined,
                                                          color: Color.fromARGB(255, 211, 240, 81),
                                                          size: 28,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                );
                                          
                                              }
                                            ),
                                            // مەندوبەکانم
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
                                                        // decoration: BoxDecoration(
                                                        //   color: Color(0xFF1D1C1C),
                                                        // ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                          children: [
                                                            Text(
                                                              'مـەنـدوبەکانـم',
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
                                                      SizedBox(width: 15,),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                            0, 0, 25, 5),
                                                        child: Icon(
                                                          Icons.contact_emergency_outlined,
                                                          color: Color.fromARGB(255, 211, 240, 81),
                                                          size: 28,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                );
                                          
                                              }
                                            ),
                                          
                                           ])]))))));
                                 
                                },
                                child: Icon(
                                  Icons.menu,
                                  color: Color(0xFF1D1C1C),
                                  size: 40,
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
        ),
      ),
    );
  }
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) =>const MainScreen()),);
  }
}
