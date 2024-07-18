part of 'add_to_do_bloc.dart';

@immutable
sealed class AddToDoState {}

final class AddToDoInitial extends AddToDoState {}

final class AddToDoLoadingState extends AddToDoState {}

final class AddToDoSuccessState extends AddToDoState {}

final class AddToDoErrorState extends AddToDoState {}

