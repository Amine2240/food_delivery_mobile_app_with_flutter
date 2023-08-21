import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/mylist.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 75,
      elevation: 0,
      padding: EdgeInsets.zero,
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(103, 181, 181, 181),
                blurRadius: 100,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home_filled),
              color: const Color.fromARGB(255, 255, 115, 0),
              iconSize: 40,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_outline_rounded),
              iconSize: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class Myfullnavbar extends StatelessWidget {
  const Myfullnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(children: [
        const Positioned(bottom: 0, width: 411, child: BottomNavBar()),
        Positioned(
          left: 170,
          bottom: 40,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 115, 0),
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(128, 255, 153, 0),
                      blurRadius: 25,
                      offset: Offset(5, 0))
                ]),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyList(
                                // productsList: [],
                              )));
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ),
      ]),
    );
  }
}
