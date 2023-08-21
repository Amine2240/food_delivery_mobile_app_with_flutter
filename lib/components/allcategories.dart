import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:food_delivery_app/components/categorie.dart';
import 'package:food_delivery_app/providers/categoriebool.dart';
import 'package:food_delivery_app/providers/categoriefetching.dart';
import 'package:provider/provider.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  // ignore: non_constant_identifier_names
  List Categories = [];
  void fetchcategories() async {
    try {
      var response = await Dio()
          .get('https://www.themealdb.com/api/json/v1/1/categories.php');
      if (response.data != null && response.data['categories'] != null) {
        setState(() {
          Categories = response.data['categories'];
        });
      }

      print('categories fetched : $Categories');
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchcategories();
  }

  int itemindex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Category:',
            style: TextStyle(
                fontSize: 25, fontFamily: 'Brigolode', letterSpacing: 2.5),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...Categories.asMap().entries.map((categorie) {
                  return GestureDetector(
                    onTap: () {
                      context.read<Categoriebooleen>().togglecategoriebool();
                      context.read<Fetchingcategories>().fetchcategorieelements(
                          categorie.value['strCategory']);
                      setState(() {
                        itemindex = categorie.key;
                      });
                    },
                    child: Mycategorie(
                      imageURL: categorie.value['strCategoryThumb'],
                      categoryname: categorie.value['strCategory'],
                      itemownkey: categorie.key,
                      clickeditemindex: itemindex,
                    ),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
