import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/components/allitemscart.dart';
import 'package:food_delivery_app/pages/homescreen.dart';
import 'package:food_delivery_app/providers/productslist.dart';
import 'package:provider/provider.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  // void printsome() {
  //   print(
  //       // 'productList : ${widget.productsList}',
  //       'context watch products list : ${context.watch<PorductsList>().productsList}');
  // }

  double totalprice = 0;
  void calculertotalprice() {
    context.watch<PorductsList>().productsList.forEach((item) {
      print('item : $item');
       totalprice = totalprice + item.price;
    });
    
  }

  // @override
  // void initState() {
  //   super.initState();
  //   calculertotalprice();
  // }

  @override
  Widget build(BuildContext context) {
    // printsome();
    calculertotalprice();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 40,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 115, 0),
                borderRadius: BorderRadius.circular(40),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.orange, blurRadius: 50, spreadRadius: -5),
                ]),
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/images/trash.svg',
                  width: 15,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: AllItems(
          // productsList: widget.productsList,
          ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal:',
                  style: TextStyle(fontSize: 25, color: Colors.black45),
                ),
                Text(
                  '$totalprice',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 115, 0),
                      fontSize: 23,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Container(
              width: 300,
              height: 55,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 115, 0),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(64, 255, 153, 0),
                        blurRadius: 20,
                        spreadRadius: 5,
                        offset: Offset(0, 10))
                  ]),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyhomeScreen()));
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      elevation: MaterialStatePropertyAll(0)),
                  child: const Text(
                    'Check Out',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
