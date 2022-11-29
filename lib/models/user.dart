class UserModel {
  String uid;
  String email;
  String fullName;

  UserModel({
    required this.uid,
    required this.email,
    required this.fullName,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          uid: json["uid"] as String,
          email: json["email"] as String,
          fullName: json["fullName"] as String,
        );

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "fullNameName": fullName,
    };
  }
}
