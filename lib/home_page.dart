import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/card_view_widget.dart';
import 'widgets/recent_transactions_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topContainer(),
          const CardViewWidget(),
          const RecentTransactionsWidget()
        ],
      ),
    );
  }

  Widget topContainer() {
    return Container(
        height: 220,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
            color: Color(0XFF1d2d69),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
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
}
