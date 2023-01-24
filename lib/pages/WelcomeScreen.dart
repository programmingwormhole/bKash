import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'auth/loginScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> sliderImage = [
      Padding(
        padding: const EdgeInsets.only(left: 1, right: 1),
        child: SizedBox(
          height: 500,
          width: MediaQuery.of(context).size.width / 0.0,
          child: Image.asset(
            'assets/images/welcomeAds1.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 1, right: 1),
        child: SizedBox(
          height: 500,
          width: MediaQuery.of(context).size.width / 0.0,
          child: Image.asset(
            'assets/images/welcomeAds2.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 1, right: 1),
        child: SizedBox(
          height: 500,
          width: MediaQuery.of(context).size.width / 0.0,
          child: Image.asset(
            'assets/images/welcomeAds3.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CarouselSlider(
                items: sliderImage,
                options: CarouselOptions(
                    autoPlay: true, height: 300, viewportFraction: 1)),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'আপনার NID দিয়ে বিকাশ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const Text(
              'একাউন্ট খুলুন মিনিটেই',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 2,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 7,
                      vertical: 12),
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const loginScreen()));
              },
              child: const Text(
                "লগ ইন / রেজিস্ট্রেশন",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'বিকাশ অ্যাপ ঘুরে দেখুন',
                  style: TextStyle(
                      color: Colors.pink, fontWeight: FontWeight.w500),
                ))
          ],
        ),
      ),
    );
  }
}
