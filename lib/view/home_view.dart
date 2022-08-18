import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_inherited_widget/view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping App", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: ()=> provider.navigateDetail(context),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.shopping_cart, color: Colors.black, size: 35,),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child:
                    Consumer<HomeViewModel>(
                        builder: (context, model, child) {
                          return Text(model.orders.length.toString(), style: const TextStyle(color: Colors.white),);
                        }
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Consumer(
        builder: (context, model, child) {
          return ListView.builder(
            itemCount: provider.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                horizontalTitleGap: 30,
                leading: Image.network(provider.items[index].image, height: 60, width: 60, fit: BoxFit.cover,),
                title: Text(provider.items[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                subtitle: Text("${provider.items[index].price} so'm", style: const TextStyle(fontSize: 17.5, fontWeight: FontWeight.w600),),
                trailing: Checkbox(
                      value: provider.items[index].isSelected,
                      onChanged: (value) => provider.checkProduct(value, index),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
