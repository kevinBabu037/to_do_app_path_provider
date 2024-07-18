part of 'to_do_list_bloc.dart';

@immutable
sealed class ToDoListEvent {}

final class GetAllToDosEvent extends ToDoListEvent {
    
}