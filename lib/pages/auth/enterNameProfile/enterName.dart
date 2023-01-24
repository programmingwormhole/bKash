import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../units/stringData.dart';

class EnterName extends StatefulWidget {
  const EnterName({Key? key}) : super(key: key);

  @override
  State<EnterName> createState() => _EnterNameState();
}

class _EnterNameState extends State<EnterName> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  bool buttonActive = false;
  final _formKey = GlobalKey<FormState>();
  final _globalNew = GlobalKey<FormState>();
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
        actions: const [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Skip',
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.pink),
              )),
          SizedBox(
            width: 1,
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
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                StringValue().setName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                StringValue().setNameDis,
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 12),
              ),
              Text(
                StringValue().setNameDis2,
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 12),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                StringValue().firstName,
                style: StringValue().labelStyle,
              ),
              Form(
                key: _globalNew,
                child: TextFormField(
                  controller: _textEditingController2,
                  readOnly: false,
                  decoration: InputDecoration(
                      hintText: 'Enter your first name',
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.w300,
                          fontSize: 14)),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        buttonActive = true;
                      });
                    } else {
                      setState(() {
                        buttonActive = false;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                StringValue().lastName,
                style: StringValue().labelStyle,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.isEmpty) {
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
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: 'Enter your last name',
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
            backgroundColor:
                buttonActive ? Colors.grey.withOpacity(0.5) : Colors.pink ,
            // padding: EdgeInsets.only(left: 500, right: 500)
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EnterName()));
            }
            else if(_globalNew.currentState!.validate()){            }
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
