// ignore_for_file: unused_field, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:bpi_examen/models/Adherent.dart';
import 'package:bpi_examen/repositories/AdherentRepository.dart';
import 'package:meta/meta.dart';

part 'adherents_event.dart';
part 'adherents_state.dart';

class AdherentsBloc extends Bloc<AdherentsEvent, AdherentsState> {
  
  // AdherentRepository
  final AdherentRepository _adherentRepository = AdherentRepository();

  AdherentsBloc() : super(AdherentsInitial()) {

    // On Fetches Adherents
    on<FetchAdherents>((event, emit) async {
      // emit the AdherentsLoading state
      emit(AdherentsLoading());
      await _adherentRepository.getAllAdherents().then((adherents) {
        // emit the AdherentsLoaded state
        emit(AdherentsLoaded(adherents: adherents));
      }).catchError((error) {
        // emit the AdherentsNotLoaded state
        emit(AdherentsNotLoaded(error: error.toString()));
      });
    });

    // On delete Adherent
    on<DeleteAdherent>((event, emit) async {
      // emit the AdherentsLoading state
      emit(AdherentsLoading());
      await _adherentRepository.deleteAdherent(event.id_adherent).then((adherents) {
        // emit the AdherentsLoaded state
        emit(AdherentsLoaded(adherents: adherents));
      }).catchError((error) {
        // emit the AdherentsNotLoaded state
        emit(AdherentsNotLoaded(error: error.toString()));
      });
    });

  }
}
