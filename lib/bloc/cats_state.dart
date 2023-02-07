part of 'cats_bloc.dart';

@immutable
abstract class CatsState {}

class CatsInitial extends CatsState {}

class CatsSucces extends CatsState {
  final String? image;
  CatsSucces({required this.image});
}

class CatsError extends CatsState {}
