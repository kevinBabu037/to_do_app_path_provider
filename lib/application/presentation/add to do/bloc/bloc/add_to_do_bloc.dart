import 'package:bloc/bloc.dart';
import 'package:iterview_test/data/path_provider_service/path_provider_service.dart';
import 'package:meta/meta.dart';

part 'add_to_do_event.dart';
part 'add_to_do_state.dart';

class AddToDoBloc extends Bloc<AddToDoEvent, AddToDoState> {
  final PathProviderService service;

  AddToDoBloc({required this.service}) : super(AddToDoInitial()) {
    on<AddToDosEvent>((event, emit) async {
      emit(AddToDoLoadingState());

      try {
        await service.addToDo(event.title, event.dueDate);
        emit(AddToDoSuccessState());
      } catch (e) {
        emit(AddToDoErrorState());
      }
    });
  }
}
