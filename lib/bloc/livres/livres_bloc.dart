// ignore_for_file: depend_on_referenced_packages, unused_field

import 'package:bloc/bloc.dart';
import 'package:bpi_examen/models/Livre.dart';
import 'package:bpi_examen/repositories/LivreRepository.dart';
import 'package:meta/meta.dart';

part 'livres_event.dart';
part 'livres_state.dart';

class LivresBloc extends Bloc<LivresEvent, LivresState> {
  
  // LivreRepository
  final LivreRepository _livreRepository = LivreRepository();

  LivresBloc() : super(LivresInitial()) {

    // On Fetches Livres
    on<FetchLivres>((event, emit) async {
      // emit the LivresLoading state
      emit(LivresLoading());
      await _livreRepository.getAllLivres().then((livres) {
        // emit the LivresLoaded state
        emit(LivresLoaded(livres: livres));
      }).catchError((error) {
        // emit the LivresNotLoaded state
        emit(LivresNotLoaded(error: error.toString()));
      });
    });

    // On Find Livres
    on<FindLivres>((event, emit) async {
      // emit the LivresLoading state
      emit(LivresLoading());
      await _livreRepository.findLivres(event.keyword).then((livres) {
        // emit the LivresLoaded state
        emit(LivresLoaded(livres: livres));
      }).catchError((error) {
        // emit the LivresNotLoaded state
        emit(LivresNotLoaded(error: error.toString()));
      });
    });

    // On Delete Livre
    on<DeleteLivre>((event, emit) async {
      // emit the LivresLoading state
      emit(LivresLoading());
      await _livreRepository.deleteLivre(event.id_livre).then((livres) {
        // emit the LivresLoaded state
        emit(LivresLoaded(livres: livres));
      }).catchError((error) {
        // emit the LivresNotLoaded state
        emit(LivresNotLoaded(error: error.toString()));
      });
    });

  }
}
