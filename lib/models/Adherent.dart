
// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Adherent {
  late int id_adherent;
  late String nom;
  late String prenom;
  late String email;
  late String tel;

  Adherent({required this.id_adherent, required this.nom, required this.prenom, required this.email, required this.tel});

  factory Adherent.fromMap(DocumentSnapshot<Map<String, dynamic>> map){
    print(map.id);
    return Adherent(
      id_adherent: map['id_adherent'],
      nom: map['nom'],
      prenom: map['prenom'],
      email: map['email'],
      tel: map['tel'],
    );
  }

}