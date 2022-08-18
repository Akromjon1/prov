import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_inherited_widget/view/home_page.dart';
import 'package:state_management_inherited_widget/view_model/home_view_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Learn State Management Lesson 1",
      home: HomePage(),

    );
  }
}
