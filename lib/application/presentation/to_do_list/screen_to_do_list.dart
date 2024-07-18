import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iterview_test/application/core/widget.dart';
import 'package:iterview_test/application/presentation/to_do_list/bloc/to_do_list_bloc.dart';
import 'package:iterview_test/application/presentation/to_do_list/widget/to_do_list_widget.dart';
import 'package:iterview_test/application/widgets/custom_app_bar.dart';

class ScreenToDoList extends StatelessWidget {
  const ScreenToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ToDoListBloc>().add(GetAllToDosEvent());
    return Scaffold(
      appBar: const CustomAppBar(title: 'To-Do list'),
      body: SizedBox(
        child: BlocBuilder<ToDoListBloc, ToDoListState>(
          builder: (context, state) {
            if (state is ToDoListLoading) {
              return kCirculatIndicator;
            }
            if (state is ToDoListSuccess) {
              return ToDoListWidget(toDo:state.toDo,);
            }
            if (state is ToDoListEmpty) {
              return const Center(
                child: Text('List is Empty'),
              );
            }
            return const Center(
              child: Text('Something went wrong'),
            );
          },
        ),
      ),
    );
  }
}

