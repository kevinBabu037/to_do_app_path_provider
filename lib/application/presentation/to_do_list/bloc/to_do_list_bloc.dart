import 'package:bloc/bloc.dart';
import 'package:iterview_test/data/models/to_do_data_model.dart';
import 'package:iterview_test/data/path_provider_service/path_provider_service.dart';
import 'package:meta/meta.dart';

part 'to_do_list_event.dart';
part 'to_do_list_state.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  ToDoListBloc() : super(ToDoListInitial()) {

   PathProviderService service =PathProviderService();

    on<GetAllToDosEvent>((event, emit) async{

        emit(ToDoListLoading()) ;

        List<ToDoDataModel> todo = await service.getToDo();

        if (todo.isNotEmpty) {
          emit(ToDoListSuccess(toDo:todo ));
        }else{
          emit(ToDoListEmpty());
        }
      

    });
  }
}
