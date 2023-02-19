import 'package:flutter/material.dart';

import '../models/appBarModel.dart';
import '../models/contactList.dart';
import 'amountScreen.dart';

class MobileRecharge extends StatefulWidget {
  const MobileRecharge({Key? key}) : super(key: key);

  @override
  State<MobileRecharge> createState() => _MobileRechargeState();
}

class _MobileRechargeState extends State<MobileRecharge> {
  final TextEditingController _phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: customPageBar('Mobile Recharge'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Container(
                  width: mediaSize.width - 30,
                  height: 110,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
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
                        Divider(
                          color: Colors.black.withOpacity(0.1),
                          thickness: 1,
                        ),
                        TextFormField(
                          cursorColor: Colors.pink,
                          controller: _phoneNumber,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter phone number',
                              hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => RcgAmountScreen(
                                                phoneNumber:
                                                    _phoneNumber.text)));
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.pink,
                                  ))),
                        ),
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
                height: 217,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                      const Text('Recent'),
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                        thickness: 1,
                      ),
                      ListView.builder(
                        itemCount: 3,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => RcgAmountScreen(
                                            phoneNumber: _phoneNumber.text)));
                              },
                              child: Row(
                                children: [
                                  const CircleAvatar(
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
                                      Text(contactList[index]['number'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black
                                                  .withOpacity(0.5)))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 4, bottom: 20),
                width: mediaSize.width - 30,
                height: 1565,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
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
                      const Text('Contacts'),
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                        thickness: 1,
                      ),
                      ListView.builder(
                        itemCount: contactList.length,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => RcgAmountScreen(

                                            phoneNumber: _phoneNumber.text)));
                              },
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://cdn-icons-png.flaticon.com/512/147/147144.png'),
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
                                      Text(contactList[index]['number'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black
                                                  .withOpacity(0.5)))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
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
