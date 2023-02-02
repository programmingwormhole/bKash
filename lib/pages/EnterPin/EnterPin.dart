import 'package:bkash/pages/HomePages/HomePage.dart';
import 'package:bkash/pages/auth/enterNameProfile/enterName.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../units/stringData.dart';

class EnterPin extends StatefulWidget {
  const EnterPin({Key? key}) : super(key: key);

  @override
  State<EnterPin> createState() => _EnterPinState();
}

class _EnterPinState extends State<EnterPin> {
  TextEditingController _textEditingController = TextEditingController();
  bool buttonActive = false;
  final _formKey = GlobalKey<FormState>();

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
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 5, bottom: 5),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    side: const BorderSide(color: Colors.pink, width: 1.5)),
                onPressed: () {},
                child: Text(
                  StringValue().lanBng,
                  style: const TextStyle(fontSize: 16, color: Colors.pink),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_hrczfk4y.json',
                      height: 60,
                      width: 60)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                StringValue().loginTxt,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                StringValue().toYourAcc,
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                StringValue().mobileNbr,
                style: StringValue().labelStyle,
              ),
              TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                    hintText: '+88  01xxxxxxxxx',
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400)),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringValue().accPin,
                    style: StringValue().labelStyle,
                  ),
                  Text(StringValue().forgotPin,
                      style: const TextStyle(color: Colors.pink)),
                ],
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 6) {
                      setState(() {
                        buttonActive = true;
                      });
                    } else {
                      setState(() {
                        buttonActive = false;
                      });
                    }
                  },
                  controller: _textEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your PIN';
                    } else if (value.length < 6) {
                      return 'PIN must be in 6 digits';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  obscureText: true,
                  obscuringCharacter: '•',
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: 'Enter bkash PIN',
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.w300,
                          fontSize: 14)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: const RoundedRectangleBorder(),
            backgroundColor: buttonActive ? Colors.pink : Colors.grey,
            // padding: EdgeInsets.only(left: 500, right: 500)
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EnterName()));
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Next',
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
