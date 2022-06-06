
// ignore_for_file: non_constant_identifier_names

import 'package:bpi_examen/models/Adherent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
// import 'package:firebase_core/firebase_core.dart';


// create Interface IAdherentRepository
abstract class IAdherentRepository {
  // getAllAdherents
  Future<List<Adherent>> getAllAdherents();
  
  // deleteAdherent
  Future<List<Adherent>> deleteAdherent(int id_adherent);
}

class AdherentRepository implements IAdherentRepository {

  late List<Adherent> adherents;

  AdherentRepository(){
    // initialisation des adherents
    // adherents = [
    //   Adherent(
    //     id_adherent: 1,
    //     nom: "JANAH",
    //     prenom: "Yassir",
    //     email: "y.janah@google.com",
    //     tel: "0123456789",
    //   ),
    //   Adherent(
    //     id_adherent: 2,
    //     nom: "SAASSAA",
    //     prenom: "LAIDI",
    //     email: "l.saassaa@gmail.com",
    //     tel: "018370689",
    //   ),
    //   Adherent(
    //     id_adherent: 3,
    //     nom: "BOUSSELHAM",
    //     prenom: "Abdelmajid",
    //     email: "bousselham@enset-media.ac.ma",
    //     tel: "058989898",
    //   )];
  }

  // AllAdherents
  @override
  Future<List<Adherent>> getAllAdherents() async {
    //wait for 1 second
    //Future.delayed(const Duration(seconds: 1));
    // get data from firebase
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('adherents');
    QuerySnapshot querySnapshot = await collectionReference.get();
    // print data
    adherents = querySnapshot.docs.map(
      (documentSnapshot) => Adherent.fromMap(documentSnapshot as DocumentSnapshot<Map<String, dynamic>>),
    ).toList();
    return adherents;
  }

  // deleteAdherent
  @override
  Future<List<Adherent>> deleteAdherent(int id_adherent) async {
    // wait for 1 second
    //Future.delayed(
    //  const Duration(seconds: 1),
    //);
    // remove adherent
    //adherents.removeWhere((adherent) => adherent.id_adherent == id_adherent);
    // remove from firebase
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('adherents');
    // find adherent to delete
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs.forEach((documentSnapshot) {
      Adherent adherent = Adherent.fromMap(documentSnapshot as DocumentSnapshot<Map<String, dynamic>>);
      if(adherent.id_adherent == id_adherent){
        collectionReference.doc(documentSnapshot.id).delete();
      }
    });
    // return adherents
    return getAllAdherents();
  }

}