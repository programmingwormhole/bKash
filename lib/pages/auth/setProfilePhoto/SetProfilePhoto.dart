import 'package:bkash/pages/HomePages/HomePage.dart';
import 'package:flutter/material.dart';

import '../../../units/stringData.dart';

class SetProfilePhoto extends StatefulWidget {
  const SetProfilePhoto({Key? key}) : super(key: key);

  @override
  State<SetProfilePhoto> createState() => _SetProfilePhotoState();
}

class _SetProfilePhotoState extends State<SetProfilePhoto> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.pink,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text(
                'Skip',
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.pink),
              ),
            ),
          ),
          const SizedBox(
            width: 1,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(children: [
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  StringValue().loginLogo,
                  height: 45,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringValue().setPP,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                  Text(
                    StringValue().setPPdis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent.withOpacity(0.1),
                          shape: BoxShape.circle),
                      height: 180,
                      width: 180,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(0.1),
                          shape: BoxShape.circle),
                      height: 130,
                      width: 130,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Image.asset(
                          StringValue().profilePicture,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 45,
                        right: 45,
                        child: Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                                color: Colors.pink, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            )))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: isChecked
                          ? MaterialStateProperty.all(Colors.pink)
                          : MaterialStateProperty.all(Colors.grey),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      StringValue().ppVisible,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.w300,
                          fontSize: 12),
                    )
                  ],
                )
              ],
            )
          ]),
        ),
      ),
      bottomNavigationBar: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: const RoundedRectangleBorder(),
            backgroundColor: Colors.pink,
            // backgroundColor:
            //     buttonActive ? Colors.grey.withOpacity(0.5) : Colors.pink ,
            // padding: EdgeInsets.only(left: 500, right: 500)
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                )
              ],
            ),
          )),
    );
  }
}
