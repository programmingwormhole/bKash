import 'package:bkash/pages/models/appBarModel.dart';
import 'package:bkash/pages/sendMoney/confirmPaymentScreen.dart';
import 'package:flutter/material.dart';

import '../models/contactList.dart';

class CashOutDetails extends StatelessWidget {
  String amount, phoneNmbr;

  CashOutDetails({super.key, required this.amount, required this.phoneNmbr});

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    TextEditingController _button = TextEditingController();
    TextEditingController _reff = TextEditingController();
    return Scaffold(
      appBar: customPageBar('Cash Out'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Container(
                  width: mediaSize.width - 30,
                  height: 106,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 1)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Receiver'),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          itemCount: 1,
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 40, bottom: 5, right: 5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/147/147144.png'),
                                    // backgroundColor: Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        contactList[index]['name'],
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      Text(phoneNmbr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black
                                                  .withOpacity(0.5)))
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 4),
                width: mediaSize.width - 30,
                height: 280,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 1)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Amount, Charge, Total Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text('Amount'),
                              Text('\$$amount'),
                            ],
                          ),
                          Column(
                            children: const [Text('Charge'), Text('\$0.00')],
                          ),
                          Column(
                            children: [const Text('Total'), Text('\$$amount')],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.2),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('Reference'),

                      TextFormField(
                        controller: _reff,
                        cursorColor: Colors.pink,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type your notes',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.2),
                      ),

                      TextFormField(
                        controller: _button,
                        cursorColor: Colors.pink,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        textAlign: TextAlign.center,
                        obscureText: true,
                        obscuringCharacter: '•',
                        // keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.pink,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                if (_button.text.length > 3) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              confirmPayPage(
                                                name: 'Unknow',
                                                phoneNumber: phoneNmbr,
                                                amount: amount,
                                                reff: _reff.text,
                                              )));
                                }
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.pink,
                              )),
                          border: InputBorder.none,
                          hintText: 'Enter your PIN',
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
