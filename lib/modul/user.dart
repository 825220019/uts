class User{
  late int? userid;
  late String? username;
  late String? password;

  User({this.userid, this.username, this.password});
  User.fromMap(dynamic obj){
    this.userid = obj['userid'];
    this.username = obj['username'];
    this.password = obj['password'];
  }

  Map<String, dynamic> toMap(){
    var map = <String,dynamic>{
      'username': username,
      'password': password
    };
    return map;
  }

   userMap() {
     var mapping = Map<String, dynamic>();
     mapping['Userid'] = userid ?? null;
     mapping['Username'] = username!;
     mapping['Password'] = password!;
     return mapping;
   }
}