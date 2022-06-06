// ignore_for_file: non_constant_identifier_names

part of 'livres_bloc.dart';

@immutable
abstract class LivresEvent {}

// event that indicates that the user has requested to fetch the list of livres
class FetchLivres extends LivresEvent {}

// event findLivre
class FindLivres extends LivresEvent {
  final String keyword;

  FindLivres({required this.keyword});
}

// event delete livre
class DeleteLivre extends LivresEvent {
  final int id_livre;

  DeleteLivre({required this.id_livre});
}
