import 'package:flutter/material.dart';
import 'package:payment_app_ui/checkout_page.dart';
import 'package:payment_app_ui/model/card_view_items.dart';

class CardViewWidget extends StatefulWidget {
  const CardViewWidget({super.key});

  @override
  State<CardViewWidget> createState() => _CardViewWidgetState();
}

class _CardViewWidgetState extends State<CardViewWidget> {
  final PageController _pageController =
      PageController(viewportFraction: 0.8, initialPage: 0);

  List<CardViewItems> images = [
    CardViewItems(
        cvv: '898',
        name: 'Peter Parker',
        number: '2314',
        itemColor: const Color(0XFF16586e)),
    CardViewItems(
        cvv: '243',
        name: 'John KM',
        number: '5432',
        itemColor: const Color(0XFF7b316f)),
    CardViewItems(
        cvv: '779',
        name: 'Raj M',
        number: '1424',
        itemColor: const Color(0XFF283787)),
  ];
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Cards',
                  style: TextStyle(
                      color: Color(0XFF1d2d69),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 190,
              child: PageView.builder(
                  itemCount: images.length,
                  pageSnapping: true,
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      activePage = page;
                    });
                  },
                  itemBuilder: (context, pagePosition) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CheckoutPage()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: 30, top: 10, bottom: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: images[pagePosition].itemColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            )),
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'VISA',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '**** **** **** ${images[pagePosition].number}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cardholder',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Expires',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      'CVV',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  images[pagePosition].name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      '12/20',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      images[pagePosition].cvv,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(images.length, activePage)),
          ],
        ));
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(5),
        width: 13,
        height: 13,
        decoration: BoxDecoration(
            color: currentIndex == index
                ? const Color(0XFF1d2d69)
                : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }
}
