import 'package:flutter/material.dart';

class Mycategorie extends StatelessWidget {
  const Mycategorie(
      {super.key,
      required this.imageURL,
      required this.categoryname,
      required this.itemownkey,
      required this.clickeditemindex});

  final String imageURL, categoryname;
  final int itemownkey;
  final int clickeditemindex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      decoration: BoxDecoration(
          color: itemownkey == clickeditemindex
              ? const Color.fromARGB(123, 255, 153, 0)
              : Colors.transparent,
          border: Border.all(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 106, 0),
                  borderRadius: BorderRadius.circular(55),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(128, 255, 153, 0),
                        blurRadius: 15,
                        offset: Offset(5, 7))
                  ]),
              height: 60,
              width: 60,
              child: Image.network(
                imageURL,
                fit: BoxFit.cover,
              )),
          Text(
            categoryname,
            style: const TextStyle(
                fontSize: 17, fontFamily: 'Brigolode', letterSpacing: 1.2),
          )
        ],
      ),
    );
  }
}
