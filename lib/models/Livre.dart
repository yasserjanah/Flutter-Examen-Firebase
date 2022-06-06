
// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Livre {
  late int id_livre;
  late String isbn;
  late String titre;
  late String auteur;
  late DateTime anne_publication;
  late int nb_exemplaires;
  late double prix;

  Livre({required this.id_livre, required this.isbn, required this.titre, required this.auteur, required this.anne_publication, required this.nb_exemplaires, required this.prix});

  factory Livre.fromMap(DocumentSnapshot<Map<String, dynamic>> map){
    return Livre(
      id_livre: map['id_livre'],
      isbn: map['isbn'],
      titre: map['titre'],
      auteur: map['auteur'],
      anne_publication: DateTime(map['anne_publication']),
      nb_exemplaires: map['nb_exemplaires'],
      prix: map['prix'],
    );
  }

}