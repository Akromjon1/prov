import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:state_management_inherited_widget/view/detail_view.dart';
import 'package:state_management_inherited_widget/view_model/home_view_model.dart';


class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => HomeViewModel(),
        child: const DetailView()
    );
  }
}