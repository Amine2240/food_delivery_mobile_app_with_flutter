import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/offer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AllOffers extends StatefulWidget {
  const AllOffers({super.key});

  @override
  State<AllOffers> createState() => _AllOffersState();
}

class _AllOffersState extends State<AllOffers> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        height: 150,
        width: double.infinity,
        child: PageView(
          controller: _controller,
          children: const [
            Myoffer(
                buttoncolor: Color.fromRGBO(12, 46, 195, 1),
                offervalue: '100% OFF',
                offertitle: 'Free Delivery',
                offerimage: 'assets/images/pizza.png',
                offercolor: Color.fromRGBO(12, 46, 195, 0.416)),
            Myoffer(
                buttoncolor: Color.fromRGBO(12, 195, 158, 1),
                offervalue: '50% OFF',
                offertitle: 'Special Deals',
                offerimage: 'assets/images/hamburger.png',
                offercolor: Color.fromRGBO(12, 195, 158, 0.263)),
            Myoffer(
                buttoncolor: Color.fromRGBO(255, 89, 0, 1),
                offervalue: '30% OFF',
                offertitle: 'Special Ramadan',
                offerimage: 'assets/images/spagiti.png',
                offercolor: Color.fromRGBO(255, 89, 0, 0.389)),
          ],
        ),
      ),
      SmoothPageIndicator(
        controller: _controller,
        count: 3,
        effect: const ScaleEffect(
          dotHeight: 10,
          dotWidth: 15,
        ),
      ),
    ]);
  }
}
