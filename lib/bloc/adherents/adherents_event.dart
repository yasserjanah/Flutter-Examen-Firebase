// ignore_for_file: non_constant_identifier_names

part of 'adherents_bloc.dart';

@immutable
abstract class AdherentsEvent {}

// event that indicates that the user has requested to fetch the list of adherents
class FetchAdherents extends AdherentsEvent {}

// event delete adherent
class DeleteAdherent extends AdherentsEvent {
  final int id_adherent;

  DeleteAdherent({required this.id_adherent});
}