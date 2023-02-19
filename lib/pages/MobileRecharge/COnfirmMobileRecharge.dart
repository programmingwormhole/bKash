import 'package:flutter/material.dart';

import '../models/AnimatedButton.dart';

import 'SuccessScreen.dart';

class ConfirmMobileRecharge extends StatelessWidget {
  String name;
  String phoneNumber;
  String amount;
  String reff;

  ConfirmMobileRecharge(
      {super.key, required this.reff,
      required this.name,
      required this.phoneNumber,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.1),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
                size: 30,
              )),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            //DO your ui design
            // I am keeping it blank for the demo
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: const TextSpan(
                          text: 'Confirm ',
                          style: TextStyle(color: Colors.pink, fontSize: 18),
                          children: [
                        TextSpan(
                            text: 'Mobile Recharge',
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))
                      ])),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/147/147144.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(phoneNumber,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.5)))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.7)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('\$$amount.00'),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$$amount.00 + \$00.00',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      IntrinsicHeight(
                          child: Row(
                        children: <Widget>[
                          VerticalDivider(
                            color: Colors.black.withOpacity(1),
                            width: 15,
                          ),
                          const Text(''),
                        ],
                      )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Balance',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.7)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('\$1758.00'),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  Text(
                    'Reference',
                    style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(reff),
                ],
              ),
            ),
          ),
          //Animated button
          AnimatedButton(
            onComplete: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RcgMobileSuccess()));
            },
          )
        ],
      ),
    );
  }
}
