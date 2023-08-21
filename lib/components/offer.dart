import 'package:flutter/material.dart';

class Myoffer extends StatelessWidget {
  const Myoffer(
      {super.key,
      required this.offercolor,
      required this.offerimage,
      required this.offertitle,
      required this.buttoncolor,
      required this.offervalue});
  final Color offercolor, buttoncolor;
  final String offerimage, offertitle, offervalue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(10),
      width: 300,
      height: 150,
      decoration: BoxDecoration(
          color: offercolor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                offertitle,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(offervalue,
                  style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w900)),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(buttoncolor)),
                  child: const Text(
                    'Order Now',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ))
            ],
          ),
          Image.asset(
            offerimage,
            fit: BoxFit.cover,
            width: 115,
            height: 130,
          )
        ],
      ),
    );
  }
}
