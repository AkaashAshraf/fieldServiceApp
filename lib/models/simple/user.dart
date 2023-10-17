class User {
  int id;
  String name;
  String email;
  String emailVerifiedAt;
  String createdAt;
  String updatedAt;
  int appUserType;

  User({
    this.id = 0,
    this.name = "",
    this.email = "",
    this.emailVerifiedAt = "",
    this.createdAt = "",
    this.updatedAt = "",
    this.appUserType = 1,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        emailVerifiedAt: json["email_verified_at"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        appUserType: json["app_user_type"] ?? 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "app_user_type": appUserType,
      };
}
