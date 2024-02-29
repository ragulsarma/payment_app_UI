import 'package:flutter/material.dart';
import 'package:payment_app_ui/model/transactions_view_items.dart';

class RecentTransactionsWidget extends StatefulWidget {
  const RecentTransactionsWidget({super.key});

  @override
  State<RecentTransactionsWidget> createState() =>
      _RecentTransactionsWidgetState();
}

class _RecentTransactionsWidgetState extends State<RecentTransactionsWidget> {
  List<TransactionViewItems> listItems = [
    TransactionViewItems(
      name: 'Bills',
      icon: const Icon(
        Icons.phone_in_talk,
        size: 30,
        color: Color(0XFF273986),
      ),
      desc: 'Telephone Phone Bills',
      iconColor: const Color(0XFFd7d9e6),
      price: '\$200.00',
    ),
    TransactionViewItems(
      name: 'Workspace',
      icon: const Icon(
        Icons.print,
        size: 30,
        color: Color(0XFF159b19),
      ),
      desc: 'Workspace Bills',
      iconColor: const Color(0XFFccecd6),
      price: '\$2210.00',
    ),
    TransactionViewItems(
      name: 'Utility Bills',
      icon: const Icon(
        Icons.bolt_rounded,
        size: 30,
        color: Color(0XFF7d306f),
      ),
      desc: 'Electric Bills',
      iconColor: const Color(0XFFe6d9e4),
      price: '\$423.00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Transactions',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        // fontWeight: FontWeight.w500
                      ),
                    ),
                    Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.grey,
                      size: 25,
                    )
                  ],
                )),
            SizedBox(height: 10),
            ListView.builder(
                itemCount: listItems.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  decoration: BoxDecoration(
                                    color: listItems[index].iconColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: listItems[index].icon),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listItems[index].name,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      // fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    listItems[index].desc,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 11,
                                      //    fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listItems[index].price,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                               Text(
                                '12/12/2025',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 12,
                                  //    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          )
                        ],
                      ));
                }),
            const SizedBox(
              height: 50,
            ),
          ],
        ));
  }
}
