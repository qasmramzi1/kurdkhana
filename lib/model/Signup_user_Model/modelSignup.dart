// ignore_for_file: file_names, non_constant_identifier_names

class UserModel {
  String? email;
  String? Password;
  String? uid;

  String? role;
  String? Jor;
   String? image;
    String? Name;
    String? about;
    String? query;


// receiving data
  UserModel({this.uid, this.email, this.Password,
  this.role,this.Jor,this.image,this.Name,this.about,this.query
  });
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      Password: map['Password'],
     
       role: map['role'],
       Jor:map['Jor'],
       image: map['image'],
       Name: map['Name'],
       about: map['about'],
       query: map['query']
    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'Password': Password,
      'role':role,
      'Jor':Jor,  
      'image':image,
      'Name':Name,
      'about':about,
      'query':query,
    };
  }
}