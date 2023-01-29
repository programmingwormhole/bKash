import 'package:bkash/pages/EnterPin/EnterPin.dart';
import 'package:bkash/units/stringData.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';

class verifyNumber extends StatefulWidget {
  const verifyNumber({Key? key}) : super(key: key);

  @override
  State<verifyNumber> createState() => _verifyNumberState();
}

class _verifyNumberState extends State<verifyNumber> {
  final OtpFieldController _otpFieldController = OtpFieldController();
  bool enable = false;
  bool buttonActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              Image.asset(
                StringValue().loginLogo,
                height: 45,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                StringValue().verifyTxt,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                StringValue().yourMobileNbr,
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 20),
              ),
              OTPTextField(
                width: MediaQuery.of(context).size.width,
                length: 6,
                controller: _otpFieldController,
                onChanged: (value) {
                  if (value.length == 6) {
                    setState(() {
                      enable = true;
                      buttonActive = true;
                    });
                  } else {
                    setState(() {
                      enable = false;
                      buttonActive = false;
                    });
                  }
                },
                onCompleted: (otp) {
                  print('Your Enter : $otp');

                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const EnterPin()));
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                StringValue().verifyCode,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 14),
              ),
              Row(
                children: [
                  Text(
                    StringValue().mblNbr,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 14),
                  ),
                  StringValue().cngBtn
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2), blurRadius: 15)
                ]),
                child: Image.asset(StringValue().code),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: const RoundedRectangleBorder(),
            backgroundColor: enable ? Colors.pink : Colors.grey,
            // padding: EdgeInsets.only(left: 500, right: 500)
          ),
          onPressed: () {
            if (buttonActive == true) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EnterPin()));
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Confirm',
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
