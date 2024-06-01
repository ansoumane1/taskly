class User {
  bool status;
  UserClass user;
  String message;
  String token;

  User({
    required this.status,
    required this.user,
    required this.message,
    required this.token,
  });

  User copyWith({
    bool? status,
    UserClass? user,
    String? message,
    String? token,
  }) =>
      User(
        status: status ?? this.status,
        user: user ?? this.user,
        message: message ?? this.message,
        token: token ?? this.token,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        user: UserClass.fromJson(json["user"]),
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user.toJson(),
        "message": message,
        "token": token,
      };
}

class UserClass {
  int id;
  String firstName;
  String lastName;
  int phone;
  String email;
  dynamic emailVerifiedAt;
  dynamic image;
  String username;
  int roleId;
  DateTime createdAt;
  DateTime updatedAt;

  UserClass({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.emailVerifiedAt,
    required this.image,
    required this.username,
    required this.roleId,
    required this.createdAt,
    required this.updatedAt,
  });

  UserClass copyWith({
    int? id,
    String? firstName,
    String? lastName,
    int? phone,
    String? email,
    dynamic emailVerifiedAt,
    dynamic image,
    String? username,
    int? roleId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserClass(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        image: image ?? this.image,
        username: username ?? this.username,
        roleId: roleId ?? this.roleId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        image: json["image"],
        username: json["username"],
        roleId: json["role_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "image": image,
        "username": username,
        "role_id": roleId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
