part of 'add_to_do_bloc.dart';

@immutable
sealed class AddToDoEvent {}


final class AddToDosEvent extends AddToDoEvent{
   final String title;
   final String dueDate;

  AddToDosEvent({required this.title,required this.dueDate});
}
