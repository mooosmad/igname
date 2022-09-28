import 'dart:convert';
import 'package:hive/hive.dart';
part "user.g.dart";

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String? nom;
  @HiveField(1)
  final String? prenom;
  @HiveField(2)
  final String? contact;
  @HiveField(3)
  final String? password;

  User({
    this.nom,
    this.prenom,
    this.contact,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        nom: json["nom"],
        prenom: json["prenom"],
        contact: json["contact"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "nom": nom,
        "prenom": prenom,
        "contact": contact,
        "password": password,
      };
}
