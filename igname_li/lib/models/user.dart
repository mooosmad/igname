import 'dart:convert';
import 'package:hive/hive.dart';
part "user.g.dart";

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  @HiveType(typeId: 0)
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? nom;
  @HiveField(3)
  final String? prenom;
  @HiveField(4)
  final String? contact;
  @HiveField(5)
  final String? password;

  User({
    this.id,
    this.nom,
    this.prenom,
    this.contact,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nom: json["nom"],
        prenom: json["prenom"],
        contact: json["contact"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "prenom": prenom,
        "contact": contact,
        "password": password,
      };
}
