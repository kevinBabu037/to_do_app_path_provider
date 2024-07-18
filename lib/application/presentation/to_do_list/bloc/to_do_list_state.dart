part of 'to_do_list_bloc.dart';

@immutable
sealed class ToDoListState {}

final class ToDoListInitial extends ToDoListState {}
final class ToDoListLoading extends ToDoListState {}
final class ToDoListSuccess extends ToDoListState {
 final List<ToDoDataModel> toDo;

  ToDoListSuccess({required this.toDo});
}
final class ToDoListEmpty extends ToDoListState {}
