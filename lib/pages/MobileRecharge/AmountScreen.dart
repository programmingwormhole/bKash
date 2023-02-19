import 'package:bkash/pages/models/appBarModel.dart';
import 'package:flutter/material.dart';

import '../models/contactList.dart';
import 'MobileRechargeDetailScreen.dart';

class RcgAmountScreen extends StatefulWidget {
  String phoneNumber;

  RcgAmountScreen({super.key, required this.phoneNumber});

  @override
  State<RcgAmountScreen> createState() => _RcgAmountScreenState();
}

class _RcgAmountScreenState extends State<RcgAmountScreen> {
  @override
  Widget build(BuildContext context) {
    bool activeBtn = false;
    TextEditingController _amount = TextEditingController();
    TextEditingController _name = TextEditingController();

    final mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customPageBar('Mobile Recharge'),
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
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5)),
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
                                    // backgroundColor: Colors.grey,
                                    backgroundImage: NetworkImage(
                                        'https://cdn-icons-png.flaticon.com/512/147/147144.png'),
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
                                      Text(widget.phoneNumber,
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
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
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
                      const Text('Amount'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                activeBtn = true;
                              });
                            },
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    activeBtn == true ? Colors.pink : Colors.white,
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                side: const BorderSide(
                                    color: Colors.pink, width: 2)),
                            child: const Text(
                              '20',
                              style: TextStyle(color: Colors.pink),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.pink,
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                side: const BorderSide(
                                    color: Colors.pink, width: 2)),
                            child: const Text(
                              '30',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                side: const BorderSide(
                                    color: Colors.pink, width: 2)),
                            child: const Text(
                              '50',
                              style: TextStyle(color: Colors.pink),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        cursorColor: Colors.pink,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.phone,
                        controller: _amount,
                        style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 40,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  if (_amount.text.isNotEmpty) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MobileRechargeDetailScreen(
                                                    amount: _amount.text,
                                                    phoneNmbr:
                                                        widget.phoneNumber)));
                                  }
                                },
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  size: 30,
                                  color: Colors.pink,
                                )),
                            hintText: '\$0',
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 40)),
                      ),
                      const Center(
                          child: Text(
                        'Useable balance: \$1200.54',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )),
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
