import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/components/allcategories.dart';
import 'package:food_delivery_app/components/alloffers.dart';
import 'package:food_delivery_app/components/categoriefood.dart';
import 'package:food_delivery_app/components/fullbottombar.dart';
import 'package:food_delivery_app/components/popular.dart';
import 'package:food_delivery_app/components/searchresult.dart';
import 'package:food_delivery_app/providers/categoriebool.dart';
import 'package:provider/provider.dart';

class MyhomeScreen extends StatefulWidget {
  const MyhomeScreen({Key? key}) : super(key: key);

  @override
  State<MyhomeScreen> createState() => _MyhomeScreenState();
}

class _MyhomeScreenState extends State<MyhomeScreen> {
  String inputvalue = '';
  List searchresultlist = [];
  void fetchsearch(String value) async {
    try {
      var response = await Dio()
          .get('https://www.themealdb.com/api/json/v1/1/search.php?s=$value');
      setState(() {
        searchresultlist = response.data['meals'];
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchsearch(inputvalue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(30)),
              child: Image.asset('assets/images/user.png'),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hey User,',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Ready to order?',
                  style: TextStyle(
                      fontSize: 21, fontFamily: 'Brigolode', letterSpacing: 2),
                )
              ],
            )
          ],
        ),
        leadingWidth: 250,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            iconSize: 30,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(50, 255, 255, 255),
          child: Stack(
            children: [
              Positioned(
                top: 50,
                right: -20,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(84, 255, 102, 0),
                            blurRadius: 50)
                      ]),
                ),
              ),
              Positioned(
                top: 400,
                left: -20,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(61, 0, 255, 76),
                            blurRadius: 50)
                      ]),
                ),
              ),
              Positioned(
                top: 750,
                right: -150,
                child: Container(
                  width: 400,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(65, 0, 110, 255),
                            blurRadius: 50)
                      ]),
                ),
              ),
              Positioned(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 330,
                            height: 50,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(11, 0, 0, 0),
                                borderRadius: BorderRadius.circular(15)),
                            child: TextField(
                              onChanged: (value) {
                                fetchsearch(value);
                                setState(() {
                                  inputvalue = value;
                                });
                              },
                              decoration: const InputDecoration(
                                  hintText: 'Search your carvings',
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search_rounded)),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                context
                                    .read<Categoriebooleen>()
                                    .togglecategorieboolforpopular();
                              },
                              icon: SvgPicture.asset(
                                  'assets/images/sliders-solid.svg',
                                  width: 30))
                        ],
                      ),
                    ),
                    const AllOffers(),
                    const AllCategories(),
                    if (inputvalue != '')
                      Mysearchresult(searchlist: searchresultlist),
                    if (inputvalue == '')
                      context.watch<Categoriebooleen>().categoriebool
                          ? Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Popular food:',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'Brigolode',
                                        letterSpacing: 2.5),
                                  ),
                                  Row(
                                    children: [
                                      PopularFood(
                                        itemprice: 10,
                                        name: 'Pizza',
                                        country: 'italia',
                                        kind: 'pasta,cury',
                                        category: 'vegetrian',
                                        image: 'https://www.themealdb.com//images//media//meals//x0lk931587671540.jpg',
                                      ),
                                      PopularFood(
                                        itemprice: 25,
                                        name: 'Hamburger',
                                        country: 'America',
                                        kind: 'pasta,Tomato',
                                        category: 'Junk',
                                        image: 'https://www.themealdb.com//images//media//meals//k420tj1585565244.jpg',
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      PopularFood(
                                        itemprice: 78,
                                        name: 'spagiti',
                                        country: 'italia',
                                        kind: 'pasta,cury',
                                        category: 'vegetrian',
                                        image: 'https://www.themealdb.com//images//media//meals//1549542994.jpg',
                                      ),
                                      PopularFood(
                                        itemprice: 42,
                                        name: 'Salad',
                                        country: 'italia',
                                        kind: 'pasta,cury',
                                        category: 'vegetrian',
                                        image: 'https://www.themealdb.com//images//media//meals//uvuyxu1503067369.jpg',
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : const Categoriesfood(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Myfullnavbar(),
    );
  }
}
