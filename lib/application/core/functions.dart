
import 'package:flutter/material.dart';

kNavigationPush(BuildContext context,Widget screen){
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen,));
}

kSnackBar(BuildContext context,String text){
   ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
   );
}