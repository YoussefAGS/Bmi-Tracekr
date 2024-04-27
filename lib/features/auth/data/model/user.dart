


class MyUser{
  String id,userName,email;
  MyUser({required this.id,required this.userName, required this.email});
  MyUser.fromJson(Map<String,dynamic>json):this(
      id:json['id'],
      userName:json['userName'],
      email:json['email']
  );
  Map<String,dynamic>toJson(){
    return{
      "id":id,
      "userName":userName,
      "email":email
    };

}

}