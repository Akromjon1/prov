import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:state_management_inherited_widget/view_model/detail_view_model.dart';
import 'package:state_management_inherited_widget/view_model/home_view_model.dart';

import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) => HomeViewModel(),),
          ChangeNotifierProvider(create: (BuildContext context) => DetailViewModel(),)
        ],
        child: const HomeView()
    );
  }
}