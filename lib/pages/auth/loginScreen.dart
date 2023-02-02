import 'package:bkash/pages/auth/verifyNumber/verifyNumber.dart';
import 'package:bkash/units/stringData.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController _inputController = TextEditingController();
  bool enable = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _inputController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
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
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            Image.asset(
              StringValue().loginLogo,
              height: 45,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              StringValue().entPhone,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
            ),
            RichText(
                text: TextSpan(
                    text: StringValue().richFor,
                    style: const TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                        fontSize: 20),
                    children: [
                  TextSpan(
                      text: StringValue().loginReg,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20))
                ])),
            const SizedBox(
              height: 30,
            ),
            Text(StringValue().mobileNbr),
            IntlPhoneField(
              controller: _inputController,
              onChanged: (value){
                if(_inputController.text.length == 10){
                  setState(() {
                    enable = true;
                  });
                } else {
                  setState(() {
                    enable = false;
                  });
                }
              },

              initialCountryCode: StringValue().defaultCountry,
              decoration: InputDecoration(
                  hintText: StringValue().hintText,
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.4))),
            ),
            RichText(
                text: TextSpan(
                    text: StringValue().agreeText,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 14),
                    children: [
                  TextSpan(
                      text: StringValue().termsCondition,
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          color: Colors.pink,
                          fontSize: 14))
                ])),
          ],
        ),
      ),
      bottomNavigationBar:
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: const RoundedRectangleBorder(),
              backgroundColor: enable ? Colors.pink : Colors.grey.withOpacity(0.5),
              // padding: EdgeInsets.only(left: 500, right: 500)
            ),
            onPressed: enable
                ? () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => verifyNumber(number: _inputController.text,)));
                  }
                : () {},
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
      ),

    );
  }
}
