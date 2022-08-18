import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/home_view_model.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<HomeViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
          )
        ],
      ),
      body: ListView.builder(
              itemCount: prov.orders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  horizontalTitleGap: 30,
                  leading: Image.network(prov.orders[index].image, height: 60, width: 60, fit: BoxFit.cover,),
                  title: Text(prov.orders[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  subtitle: Text("${prov.orders[index].price} so'm", style: const TextStyle(fontSize: 17.5, fontWeight: FontWeight.w600),),
                  trailing: Checkbox(
                    value: prov.orders[index].isSelected,
                    onChanged: (value) => prov.checkProduct(value, index),
                  ),
                );
              },
            ),

    );
  }}
