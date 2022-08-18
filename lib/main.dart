import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_inherited_widget/app.dart';
import 'package:state_management_inherited_widget/view_model/detail_view_model.dart';
import 'package:state_management_inherited_widget/view_model/home_view_model.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => DetailViewModel()),
      ],
      child: const MyApp()));
}