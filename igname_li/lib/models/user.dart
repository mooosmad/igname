import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

@JsonSerializable(explicitToJson: true, anyMap: true)
class User {
  User({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.contact,
    required this.email,
    required this.emailVerifiedAt,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String nom;
  String prenom;
  String contact;
  dynamic email;
  dynamic emailVerifiedAt;
  String role;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        nom: json["nom"],
        prenom: json["prenom"],
        contact: json["contact"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "prenom": prenom,
        "contact": contact,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class JsonSerializable {
  const JsonSerializable({required bool explicitToJson, required bool anyMap});
}
