import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/itemcart.dart';
import 'package:food_delivery_app/providers/productslist.dart';
import 'package:provider/provider.dart';

class AllItems extends StatefulWidget {
  const AllItems({super.key});

  // const AllItems({Key? key, required this.productsList}) : super(key: key);
  // final List productsList;

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  @override
  Widget build(BuildContext context) {
    // printsome();
    return SingleChildScrollView(
      child: Column(
        children: [
          const Center(
              child: Text('My Cart',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700))),
          ...context
              .watch<PorductsList>()
              .productsList
              .asMap()
              .entries
              .map((entry) {
            final index = entry.key;
            final item = entry.value;
            return ItemCart(
              deleteitem: () => context.read<PorductsList>().deleteitem(index),
              name: item.name,
              price: item.price,
              image: item.image,
              counter: item.count,
            );
          })
        ],
      ),
    );
  }
}
