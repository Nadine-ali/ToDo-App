

class userModel{
  String name;
  String email;
  String userid;

  userModel({
    required this.name,
    required this.email,
    required this.userid});

  userModel.fromjson(Map <String,dynamic>json)
  :this(
  name: json['name'],
  email: json['email'],
  userid: json['userId'],
  );

  Map<String,dynamic>tojson() {
    return{
      "name":name,
      "email":email,
      "userId":userid,
    };
  }
}