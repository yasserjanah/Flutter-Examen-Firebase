part of 'livres_bloc.dart';

@immutable
abstract class LivresState {}

// do nothing
class LivresInitial extends LivresState {}

// state that indicates that the user has requested to fetch the list of livres
class LivresLoading extends LivresState {}

// state that indicates that the list of livres has been fetched
class LivresLoaded extends LivresState {
  final List<Livre> livres;

  LivresLoaded({required this.livres});
}

// state that indicates that the list of livres could not be fetched
class LivresNotLoaded extends LivresState {
  final String error;

  LivresNotLoaded({required this.error});
}
