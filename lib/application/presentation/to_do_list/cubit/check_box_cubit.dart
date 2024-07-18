import 'package:bloc/bloc.dart';

class CheckboxCubit extends Cubit<List<bool>> {
  CheckboxCubit(int itemCount) : super(List<bool>.filled(itemCount, false));

  void toggleCheckbox(int index) {
    final updatedState = List<bool>.from(state);
    updatedState[index] = !updatedState[index];
    emit(updatedState);
  }
}
