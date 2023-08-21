import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/detailspage.dart';

class PopularFood extends StatefulWidget {
  const PopularFood(
      {Key? key,
      required this.image,
      required this.name,
      required this.category,
      required this.country,
      required this.kind,
      required this.itemprice})
      : super(key: key);

  final String image, name, category, country, kind;
  final double itemprice;

  @override
  State<PopularFood> createState() => _PopularFoodState();
}

class _PopularFoodState extends State<PopularFood> {
  void printsome() {
    print(
      'name:${widget.name},price:${widget.itemprice},image:${widget.image},',
    );
  }

  @override
  Widget build(BuildContext context) {
    printsome();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(
                      productimage: widget.image,
                      productname: widget.name,
                      price: widget.itemprice,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 180,
        height: 250,
        child: Stack(children: [
          Positioned(
              top: 40,
              child: Container(
                width: 180,
                height: 200,
                decoration: BoxDecoration(
                    color: Color.fromARGB(159, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(18, 0, 0, 0),
                        blurRadius: 30,
                      )
                    ]),
              )),
          Positioned(
            bottom: 100,
            left: 10,
            child: Container(
              height: 150,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(159, 0, 0, 0),
                    blurRadius: 40,
                    offset: Offset(5, 10),
                    spreadRadius: -25)
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  widget.image,
                ),
              ),
            ),
          ),
          Positioned(
              top: 150,
              child: Container(
                padding: EdgeInsets.only(left: 5),
                width: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(fontFamily: 'Brigolode', fontSize: 30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.category}\n${widget.country}',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black45),
                        ),
                        Text(
                          widget.kind,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.red),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
