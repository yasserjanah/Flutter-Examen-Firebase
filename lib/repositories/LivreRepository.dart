
// ignore_for_file: non_constant_identifier_names

import 'package:bpi_examen/models/Livre.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// create Interface ILivreRepository
abstract class ILivreRepository {
  // getAllLivres
  Future<List<Livre>> getAllLivres();

  // findLivres
  Future<List<Livre>> findLivres(String query);

  // deleteLivre
  Future<List<Livre>> deleteLivre(int id_livre);
}

class LivreRepository implements ILivreRepository {

  late List<Livre> livres;

  LivreRepository(){
    // initialisation des livres
    // livres = [
    //   Livre(
    //     id_livre: 1,
    //     isbn: "978-2-1234-5678-9",
    //     titre: "Big Data and Machine Learning",
    //     auteur: "Marc Batty",
    //     anne_publication: DateTime(2016),
    //     nb_exemplaires: 2,
    //     prix: 8.99
    //   ),
    //   Livre(
    //     id_livre: 2,
    //     isbn: "978-2-1234-5678-0",
    //     titre: "Python for Data Science",
    //     auteur: "Pierre Lévy",
    //     anne_publication: DateTime(2013),
    //     nb_exemplaires: 6,
    //     prix: 9.85
    //   ),
    //   Livre(
    //     id_livre: 3,
    //     isbn: "978-2-1234-5678-1",
    //     titre: "Black Hat Python",
    //     auteur: "Marc Batty",
    //     anne_publication: DateTime(2010),
    //     nb_exemplaires: 4,
    //     prix: 7.12
    //   ),
    //   Livre(
    //     id_livre: 4,
    //     isbn: "978-2-1234-5678-2",
    //     titre: "R for Data Science",
    //     auteur: "Hadley Wickham",
    //     anne_publication: DateTime(2018),
    //     nb_exemplaires: 10,
    //     prix: 18.99
    //   ),
    //   Livre(
    //     id_livre: 5,
    //     isbn: "978-2-1234-5678-3",
    //     titre: "Data mining and statistics",
    //     auteur: "Stefan van der Walt",
    //     anne_publication: DateTime(2020),
    //     nb_exemplaires: 8,
    //     prix: 8.99
    //   )];
  }

  // AllLivres
  @override
  Future<List<Livre>> getAllLivres() async {
    // wait for 1 second
    // await Future.delayed(const Duration(seconds: 1));
    // return livres;
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('livres');
    QuerySnapshot querySnapshot = await collectionReference.get();
    // print data
    livres = querySnapshot.docs.map(
      (documentSnapshot) => Livre.fromMap(documentSnapshot as DocumentSnapshot<Map<String, dynamic>>),
    ).toList();
    return livres;
  }

  // findLivres By keyword
  @override
  Future<List<Livre>> findLivres(String keyword) async {

    // we won't need to call firebase again;
    // just search on the local list

    // wait for 1 second
    await Future.delayed(const Duration(seconds: 1));
    // filter by keyword
    // tu peux chercher par titre our auteur
    return livres.where((livre) =>
      livre.titre.toLowerCase().contains(keyword.toLowerCase()) ||
      livre.auteur.toLowerCase().contains(keyword.toLowerCase())
    ).toList();
  }

  // deleteLivre
  @override
  Future<List<Livre>> deleteLivre(int id_livre) async {
    // wait for 1 second
    //await Future.delayed(const Duration(seconds: 1));
    // delete livre
    //livres.removeWhere((livre) => livre.id_livre == id_livre);
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('livres');
    // find adherent to delete
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs.forEach((documentSnapshot) {
      Livre livre = Livre.fromMap(documentSnapshot as DocumentSnapshot<Map<String, dynamic>>);
      if(livre.id_livre == id_livre){
        collectionReference.doc(documentSnapshot.id).delete();
      }
    });
    return getAllLivres();
  }

}