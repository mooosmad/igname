class UserModel {
  final String? nom;
  final String? prenom;
  final String? contact;
  final String? password;

  const UserModel(
    this.nom,
    this.prenom,
    this.contact,
    this.password,
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map.addAll({
      'nom': nom,
      'prenom': prenom,
      'contact': contact,
      'password': password,
      // 'billing': {
      //   "first_name": firstname,
      //   "last_name": lastname,

      // },
      // 'shipping': {
      //   "first_name": firstname,
      //   "last_name": lastname,
      // },
      //shipping est info pour expedition (la livraison) et billing pour la facturation
    });
    return map;
  }
}
