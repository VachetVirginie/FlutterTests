// To create User parsing JSON data, do
// final user = userFromJson(jsonString);
class User {
  int id;
  String email;
  String name;
  String password;
  bool enabled;
  bool admin;
  dynamic facebookId;
  dynamic passwordTokenToken;
  dynamic passwordTokenExpirationTime;
  dynamic photo;
  dynamic phoneNumber;

  User({
    this.id,
    this.email,
    this.name,
    this.password,
    this.enabled,
    this.admin,
    this.facebookId,
    this.passwordTokenToken,
    this.passwordTokenExpirationTime,
    this.photo,
    this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        password: json["password"],
        enabled: json["enabled"],
        admin: json["admin"],
        facebookId: json["facebookId"],
        passwordTokenToken: json["passwordTokenToken"],
        passwordTokenExpirationTime: json["passwordTokenExpirationTime"],
        photo: json["photo"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "password": password,
        "enabled": enabled,
        "admin": admin,
        "facebookId": facebookId,
        "passwordTokenToken": passwordTokenToken,
        "passwordTokenExpirationTime": passwordTokenExpirationTime,
        "photo": photo,
        "phoneNumber": phoneNumber,
      };
}
