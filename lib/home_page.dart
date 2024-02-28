import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class CardViewItems {
  CardViewItems({required this.cvv, required this.name, required this.number});

  String name;
  String cvv;
  String number;
}

class _HomePageState extends State<HomePage> {
  PageController _pageController =
      PageController(viewportFraction: 0.8, initialPage: 0);
  int activePage = 0;
  List<CardViewItems> images = [
    CardViewItems(cvv: '898', name: 'Peter Parker', number: '2314'),
    CardViewItems(cvv: '243', name: 'John KM', number: '5432'),
    CardViewItems(cvv: '779', name: 'Raj M', number: '1424'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [topContainer(), cardView()],
      ),
    );
  }

  Widget topContainer() {
    return Container(
        height: 220,
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            color: Color(0XFF1d2d69),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Home',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                CircleAvatar(
                  radius: 15.0,
                  backgroundImage: NetworkImage(
                    'https://static.wixstatic.com/media/9b1f7f_3ee3cce48e1f479ea27e93c91893cc8a~mv2.jpg/v1/fill/w_500,h_478,al_c,q_90/file.jpg',
                  ),
                  backgroundColor: Colors.transparent,
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Available Balance',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '\$3150.00',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  letterSpacing: 5,
                  fontWeight: FontWeight.w400),
            )
          ],
        ));
  }

  Widget cardView() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Cards',
              style: TextStyle(
                  color: Color(0XFF1d2d69),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
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
                    return Container(
                      margin: EdgeInsets.all(10),
                      // height: 170,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Color(0XFF16586e),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          )),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'VISA',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '**** **** **** ${images[pagePosition].number}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
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
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${images[pagePosition].name}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '12/20',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    '${images[pagePosition].cvv}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                    /* return Container(
                      margin: EdgeInsets.all(10),
                      child: Image.network(images[pagePosition]),
                    );*/
                  }),
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
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }
}
