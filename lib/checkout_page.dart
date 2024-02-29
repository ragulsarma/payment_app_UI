import 'package:flutter/material.dart';

import 'widgets/master_card_widget.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: const Color(0XFFff3f5c),
    backgroundColor: const Color(0XFFff3f5c),
    minimumSize: const Size(120, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topContainer(),
            amountPayWidget(),
            masterCardTransaction()
          ],
        ),
      ),
    );
  }

  Widget topContainer() {
    return Container(
        height: 220,
        padding: const EdgeInsets.only(left: 15, right: 40),
        decoration: const BoxDecoration(
            color: Color(0XFFf9f9fb),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.grey,
                          size: 20,
                        )),
                    const Text(
                      'Checkout',
                      style: TextStyle(
                          color: Color(0XFF1d2d69),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 15.0,
                  backgroundImage: NetworkImage(
                    'https://static.wixstatic.com/media/9b1f7f_3ee3cce48e1f479ea27e93c91893cc8a~mv2.jpg/v1/fill/w_500,h_478,al_c,q_90/file.jpg',
                  ),
                  backgroundColor: Colors.transparent,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Cost',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$50.00',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 35,
                        letterSpacing: 5,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget amountPayWidget() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Amount',
          style: TextStyle(
              color: Color(0XFF1d2d69),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '00.00',
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 37,
              letterSpacing: 5,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: raisedButtonStyle,
          onPressed: () {},
          child: const Text(
            'Pay',
            style: TextStyle(color: Colors.white),
          ),
        )
      ]));

  Widget masterCardTransaction() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            'To',
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const MasterCardWidget(
            name: 'Master Card',
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0RPTETmgOUBDh4AxRbNXEGNzAB4DeaSxudA&usqp=CAU',
            number: '3342',
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Your Card',
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const MasterCardWidget(
            name: 'Visa Debit Card',
            image:
                'https://www.visa.co.in/dam/VCOM/regional/ap/india/global-elements/images/in-visa-classic-card-498x280.png',
            number: '3543',
          )
        ]));
  }
}
