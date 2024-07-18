import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iterview_test/application/presentation/add%20to%20do/bloc/bloc/add_to_do_bloc.dart';
import 'package:iterview_test/application/presentation/add%20to%20do/screen_add_to_do.dart';
import 'package:iterview_test/application/presentation/to_do_list/bloc/to_do_list_bloc.dart';
import 'package:iterview_test/data/path_provider_service/path_provider_service.dart';

main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PathProviderService service =PathProviderService();
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddToDoBloc(service:service ),
        ),
        BlocProvider(
          create: (context) => ToDoListBloc(),
        ),
       
      ],
      child:const  MaterialApp( 
        debugShowCheckedModeBanner: false,
        home: ScreenAddToDo(),
      ),
    );
  }
}