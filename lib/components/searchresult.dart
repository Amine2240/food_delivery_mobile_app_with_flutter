import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/detailspage.dart';

class Mysearchresult extends StatefulWidget {
  const Mysearchresult({
    super.key,
    required this.searchlist,
  });
  final List searchlist;

  @override
  State<Mysearchresult> createState() => _MysearchresultState();
}

class _MysearchresultState extends State<Mysearchresult> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...widget.searchlist.map((item) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(
                            productimage: item['strMealThumb'],
                            productname: item['strMeal'],
                            price: double.parse(item['idMeal']) / 200,
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
                          color: const Color.fromARGB(159, 255, 255, 255),
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
                          color: Color.fromARGB(148, 0, 0, 0),
                          blurRadius: 100,
                          offset: Offset(5, 10),
                          spreadRadius: -30)
                    ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image.network(
                        item['strMealThumb'],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 150,
                    child: Container(
                      padding: const EdgeInsets.only(left: 5),
                      width: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            item['strMeal'],
                            style: const TextStyle(
                                fontFamily: 'Brigolode', fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sea Food\nCanada',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black45),
                              ),
                              Text(
                                '${double.parse(item['idMeal']) / 200}',
                                style: const TextStyle(
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
        })
      ],
    );
  }
}
