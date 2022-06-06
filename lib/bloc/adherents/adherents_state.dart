part of 'adherents_bloc.dart';

@immutable
abstract class AdherentsState {}

// do nothing
class AdherentsInitial extends AdherentsState {}

// state that indicates that the user has requested to fetch the list of adherents
class AdherentsLoading extends AdherentsState {}

// state that indicates that the list of adherents has been fetched
class AdherentsLoaded extends AdherentsState {
  final List<Adherent> adherents;

  AdherentsLoaded({required this.adherents});
}

// state that indicates that the list of adherents could not be fetched
class AdherentsNotLoaded extends AdherentsState {
  final String error;

  AdherentsNotLoaded({required this.error});
}
