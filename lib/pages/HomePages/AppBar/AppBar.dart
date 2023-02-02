import 'package:bkash/units/stringData.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isBalanceShown = false;
  bool _isBalance = true;
  bool _isAnimation = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('assets/images/profilePicture.jpg'),
                )),
            const SizedBox(
              width: 20
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringValue().profileName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                    onTap: changeState,
                    child: Container(
                        width: 150,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Stack(alignment: Alignment.center, children: [
                          AnimatedOpacity(
                            opacity: _isBalanceShown ? 1 : 0,
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              StringValue().userBalance,
                              style: const TextStyle(
                                  color: Colors.pink, fontSize: 14),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: _isBalance ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Text(
                              StringValue().tapBalance,
                              style: const TextStyle(
                                  color: Colors.pink,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 1100),
                            left: _isAnimation == false ? 5 : 125,
                            curve: Curves.fastOutSlowIn,
                            child: Container(
                              height: 20,
                              width: 20,
                              // padding: const EdgeInsets.only(bottom: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(50)),
                              child: FittedBox(
                                child: Text(
                                  StringValue().currencySymbol,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            ),
                          )
                        ])))
              ],
            ),
            const SizedBox(
                width: 80
            ),
            Image.asset(
              'assets/HomePage/fly.png',
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  void changeState() async {
    _isAnimation = true;
    _isBalance = false;
    setState(() {});

    await Future.delayed(const Duration(milliseconds: 800),
        () => setState(() => _isBalanceShown = true));
    await Future.delayed(const Duration(seconds: 3),
        () => setState(() => _isBalanceShown = false));
    await Future.delayed(const Duration(milliseconds: 200),
        () => setState(() => _isAnimation = false));
    await Future.delayed(const Duration(milliseconds: 800),
        () => setState(() => _isBalance = true));
  }
}
