import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iterview_test/application/presentation/to_do_list/cubit/check_box_cubit.dart';
import 'package:iterview_test/data/models/to_do_data_model.dart';

class ToDoListWidget extends StatelessWidget {
  const ToDoListWidget({
    super.key,
    required this.toDo,
  });

  final List<ToDoDataModel> toDo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckboxCubit(toDo.length),
      child: BlocBuilder<CheckboxCubit, List<bool>>(
        builder: (context, checkboxState) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final todo = toDo[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.date),
                trailing: Checkbox(
                  value: checkboxState[index],
                  onChanged: (value) {
                    context.read<CheckboxCubit>().toggleCheckbox(index);
                  },
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: toDo.length,
          );
        },
      ),
    );
  }
}
