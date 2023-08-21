import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/mylist.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/providers/productslist.dart';

class Productinfo {
  final String name;
  final String image;
  final double price;
  final int count;
  Productinfo(this.name, this.image, this.price, this.count);
}

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.productimage,
    required this.productname,
    required this.price,
  }) : super(key: key);

  final String productimage, productname;
  final double price;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int counter = 1;
  late double pricemodified = widget.price;
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
      pricemodified = pricemodified + widget.price;
    });
  }

  void updatepricewhenremoving() {
    if (pricemodified > widget.price) {
      setState(() {
        pricemodified = pricemodified - widget.price;
      });
    }
  }

  // void printsome() {
  //   print(
  //     'productList : ${productsList}',
  //   );
  //   for (var product in productsList) {
  //     print(
  //       'name:${product.name},price:${product.price},image:${product.image},',
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // printsome();
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
              Color.fromARGB(255, 255, 94, 0),
              Color.fromARGB(255, 120, 255, 129),
            ])),
        child: Stack(
          children: [
            Positioned(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 25,
                      ),
                      color: Colors.white,
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(142, 120, 255, 129)),
                          padding:
                              MaterialStatePropertyAll(EdgeInsets.all(15))),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyList(
                                    // productsList: [],
                                    )));
                      },
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        size: 25,
                      ),
                      color: Colors.white,
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 255, 115, 34),
                          ),
                          padding:
                              MaterialStatePropertyAll(EdgeInsets.all(15))),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 500,
                width: 411,
                padding: const EdgeInsets.only(top: 120),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(96, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(53, 0, 0, 0), blurRadius: 50)
                    ]),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        widget.productname,
                        style: const TextStyle(
                            fontFamily: 'Brigolode',
                            fontSize: 50,
                            letterSpacing: 4),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.timelapse,
                                color: Color.fromARGB(255, 0, 194, 6),
                              ),
                              Text(
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -1),
                                  '15 mins'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.fire_hydrant,
                                color: Color.fromARGB(255, 244, 86, 54),
                              ),
                              Text(
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -1),
                                  '470 Kal'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_border_rounded,
                                color: Color.fromARGB(255, 255, 179, 0),
                              ),
                              Text(
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -1),
                                  '4.9k reviews'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: 350,
                        color: Colors.black26,
                        margin: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(139, 255, 255, 255),
                                        Color.fromARGB(0, 255, 255, 255)
                                      ],
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topLeft),
                                  borderRadius: BorderRadius.circular(55)),
                              child: Text(
                                '£$pricemodified',
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -2,
                                    color: Color.fromARGB(255, 255, 102, 0)),
                              ),
                            ),
                            Container(
                              width: 140,
                              height: 45,
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(86, 255, 255, 255),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(64, 0, 0, 0),
                                      blurRadius: 100,
                                    )
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 35,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(51, 0, 0, 0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    child: IconButton(
                                      onPressed: () {
                                        decrementcounter();
                                        updatepricewhenremoving();
                                      },
                                      iconSize: 20,
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      '$counter',
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    width: 35,
                                    decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  85, 255, 153, 0),
                                              blurRadius: 10,
                                              offset: Offset(5, 5))
                                        ],
                                        color: Color.fromARGB(222, 255, 102, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    child: IconButton(
                                      iconSize: 20,
                                      onPressed: () {
                                        incrementcounter();
                                        updatepricewhenadding();
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Text(
                              'About ${widget.productname}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 25,
                              ),
                            ),
                            const Text(
                              'popular domburi dish consiisting of beef and oninos served over over an bowel of rice. the meat and oniear are cooked in a mixture of soy sauc mirin suagar and sake giving the dish a ',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 55,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(129, 0, 0, 0),
                          blurRadius: 50,
                          spreadRadius: -10,
                        )
                      ]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.network(
                        widget.productimage,
                        fit: BoxFit.cover,
                        width: 300,
                        height: 300,
                      ))),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: 150,
                  width: 412,
                  padding: const EdgeInsets.only(
                      top: 70, left: 40, right: 40, bottom: 15),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        Color.fromARGB(53, 255, 255, 255),
                        Color.fromARGB(0, 255, 255, 255)
                      ])),
                  child: ElevatedButton(
                      onPressed: () {
                        //
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyList(
                                    // productsList: [],
                                    )));
                        // if (!context
                        //     .watch<PorductsList>()
                        //     .productsList
                        //     .contains(Productinfo(widget.productname,
                        //         widget.productimage, pricemodified, counter)))

                        context.read<PorductsList>().addItemTocart(Productinfo(
                            widget.productname,
                            widget.productimage,
                            pricemodified,
                            counter));
                      },
                      style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(0),
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 255, 102, 0))),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
