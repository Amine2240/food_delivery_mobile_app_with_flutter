import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCart extends StatefulWidget {
  const ItemCart(
      {Key? key,
      required this.deleteitem,
      required this.name,
      required this.image,
      required this.price,
      required this.counter})
      : super(key: key);

  final VoidCallback deleteitem;
  final String name, image;
  final double price;
  final int counter;
  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  late int counter = widget.counter;
  late double itemprice = widget.price;

  void incrementcounter() {
    setState(() {
      counter++;
    });
  }

  void decrementcounter() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  void updatepricewhenadding() {
    setState(() {
      itemprice = itemprice + widget.price;
    });
  }

  void updatepricewhenremoving() {
    if (itemprice > widget.price) {
      setState(() {
        itemprice = itemprice - widget.price;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 125,
              width: 370,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(37, 0, 0, 0),
                      blurRadius: 15,
                    )
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        widget.image,
                        height: 100,
                        width: 130,
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 240,
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Text(
                        'Hot beef steak with fry',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5, right: 7),
                            height: 27,
                            width: 80,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black38),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 20,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(15, 0, 0, 0),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20))),
                                  child: IconButton(
                                    style: const ButtonStyle(),
                                    iconSize: 10,
                                    onPressed: () {
                                      decrementcounter();
                                      updatepricewhenremoving();
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 38,
                                  decoration: const BoxDecoration(
                                      border: Border.symmetric(
                                          vertical: BorderSide(
                                              color: Colors.black38))),
                                  child: Center(
                                    child: Text(
                                      '$counter',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(15, 0, 0, 0),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: IconButton(
                                    iconSize: 10,
                                    onPressed: () {
                                      incrementcounter();
                                      updatepricewhenadding();
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '£ $itemprice',
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 252, 95, 38)),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 115, 0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: IconButton(
                    onPressed: () {
                      widget.deleteitem();
                    },
                    icon: SvgPicture.asset(
                      'assets/images/trash.svg',
                      width: 15,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    )),
              ))
        ],
      ),
    );
  }
}
