import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iterview_test/application/core/functions.dart';
import 'package:iterview_test/application/core/height%20and%20width.dart';
import 'package:iterview_test/application/core/validations.dart';
import 'package:iterview_test/application/core/widget.dart';
import 'package:iterview_test/application/presentation/add%20to%20do/bloc/bloc/add_to_do_bloc.dart';
import 'package:iterview_test/application/presentation/add%20to%20do/widgets/textformfield.dart';
import 'package:iterview_test/application/widgets/custom_app_bar.dart';

class ScreenAddToDo extends StatelessWidget {
  const ScreenAddToDo({super.key});

  @override
  Widget build(BuildContext context) {
    final titleTextController = TextEditingController();
    final dateTextController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Add To-Do'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: titleTextController,
                label: 'Title',
                validator: validateTitle,
              ),
              kHeight30,
              CustomTextFormField(
                controller: dateTextController,
                label: 'Due Date',
                validator: validateDueDate,
              ),
              kHeight30,
              BlocConsumer<AddToDoBloc, AddToDoState>(
                listener: (context, state) {
                  if (state is AddToDoSuccessState) {
                    kSnackBar(context, "To-Do Added");
                    titleTextController.clear();
                    dateTextController.clear();
                  } else if (state is AddToDoErrorState) {
                    kSnackBar(context, 'Failed to Add To-Do');
                  }
                },
                builder: (context, state) {
                  if (state is AddToDoLoadingState) {
                    return kCirculatIndicator;
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        context.read<AddToDoBloc>().add(
                          AddToDosEvent(
                            title: titleTextController.text,
                            dueDate: dateTextController.text,
                          ),
                        );
                      }
                    },
                    child: const Text('Add To-Do'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
