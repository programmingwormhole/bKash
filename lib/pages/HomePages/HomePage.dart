import 'package:bkash/pages/HomePages/AppBar/AppBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../widget/MenuItem.dart';
import '../widget/carouselItems.dart';
import '../widget/myBkashSection.dart';
import '../widget/offerItems.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: CustomAppBar(),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // HomePage Button Section
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      menuItem('assets/HomePage/send_money.jpg', 'Send Money'),
                      menuItem('assets/HomePage/mobile_recharge.jpg',
                          'Mobile Recharge'),
                      menuItem('assets/HomePage/cash_out.jpg', 'Cash Out'),
                      menuItem('assets/HomePage/make_payment.jpg', 'Payments')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      menuItem('assets/HomePage/add_money.jpg', 'Add Money'),
                      menuItem('assets/HomePage/pay_bill.jpg', 'Pay Bill'),
                      menuItem('assets/HomePage/tickets.jpg', 'Tickets'),
                      menuItem('assets/HomePage/more.jpg', 'More'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Recent Activity Section
                Container(
                  height: 10,
                  width: mediaSize.width,
                  color: Colors.grey.withOpacity(0.1),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 140,
                    width: mediaSize.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('My bKash'),
                              Text(
                                'See All',
                                style: TextStyle(color: Colors.pink),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 0.5,
                            color: Colors.black.withOpacity(0.2),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                mybKashItem('assets/HomePage/make_payment.jpg',
                                    'NNV Coders'),
                                const SizedBox(
                                  width: 20,
                                ),
                                mybKashItem(
                                    'assets/HomePage/mobile_recharge.jpg',
                                    'Shirin Yasmin'),
                                const SizedBox(
                                  width: 20,
                                ),
                                mybKashItem('assets/HomePage/pay_bill.jpg',
                                    'Saved Bills'),
                                const SizedBox(
                                  width: 20,
                                ),
                                mybKashItem('assets/HomePage/tickets.jpg',
                                    'TikaToly Cinema'),
                                const SizedBox(
                                  width: 20,
                                ),
                                mybKashItem(
                                    'assets/HomePage/mobile_recharge.jpg',
                                    'Shirin Yasmin'),
                                const SizedBox(
                                  width: 20,
                                ),
                                mybKashItem('assets/HomePage/pay_bill.jpg',
                                    'Saved Bills'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // HomePage Slider Section
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: CarouselSlider(
                      items: carouselItems,
                      options: CarouselOptions(
                        height: 100,
                        autoPlay: true,
                        viewportFraction: 1,
                      )),
                ),
                // Sponsor Section
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 140,
                    width: mediaSize.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Sponsored Company'),
                              Text(
                                'See All',
                                style: TextStyle(color: Colors.pink),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 0.5,
                            color: Colors.black.withOpacity(0.2),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                mybKashItem(
                                    'assets/HomePage/daraz.jpg', 'Daraz'),
                                const SizedBox(
                                  width: 20,
                                ),
                                mybKashItem('assets/HomePage/shadhin_music.jpg',
                                    'Shadhin Music'),
                                const SizedBox(
                                  width: 20,
                                ),
                                mybKashItem('assets/HomePage/bdnews24.jpg',
                                    'BD News 24'),
                                const SizedBox(
                                  width: 20,
                                ),
                                mybKashItem(
                                    'assets/HomePage/akash.jpg', 'Akash DTH'),
                                const SizedBox(
                                  width: 20,
                                ),
                                mybKashItem(
                                    'assets/HomePage/stiline.jpg', 'Stiline'),
                                const SizedBox(
                                  width: 20,
                                ),
                                mybKashItem('assets/HomePage/coronabd.jpg',
                                    'Corona BD'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Offer Section
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 190,
                    width: mediaSize.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Offers'),
                              Text(
                                'See All',
                                style: TextStyle(color: Colors.pink),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 0.5,
                            color: Colors.black.withOpacity(0.2),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                offerItems(mediaSize),
                                const SizedBox(
                                  width: 20,
                                ),
                                offerItems(mediaSize),
                                const SizedBox(
                                  width: 20,
                                ),
                                offerItems(mediaSize),
                                const SizedBox(
                                  width: 20,
                                ),
                                offerItems(mediaSize),
                                const SizedBox(
                                  width: 20,
                                ),
                                offerItems(mediaSize),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Others Service
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 225,
                    width: mediaSize.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Others Services'),
                          Divider(
                            thickness: 0.5,
                            color: Colors.black.withOpacity(0.2),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              mybKashItem('assets/HomePage/flyover_toll.jpg',
                                  'Flyover Toll'),
                              mybKashItem('assets/HomePage/btcl.jpg', 'BTCL'),
                              mybKashItem(
                                  'assets/HomePage/metlife.jpg', 'Metlife'),
                              mybKashItem(
                                  'assets/HomePage/donation.jpg', 'Donation'),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              mybKashItem(
                                  'assets/HomePage/pay_bill.jpg', 'Pay Bill'),
                              mybKashItem(
                                  'assets/HomePage/add_money.jpg', 'Add Money'),
                              mybKashItem('assets/HomePage/make_payment.jpg',
                                  'Payment'),
                              mybKashItem(
                                  'assets/HomePage/card_bill.jpg', 'Card Bill'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Single Image Section
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: SizedBox(
                    height: 85,
                    width: mediaSize.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/sliderImage1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Single Offer Section
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 300,
                    width: mediaSize.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/images/offer.gif',
                            height: 100,
                            width: 100,
                          ),
                          const Text(
                            'Recharge ৳100 Get 180 Minutes',
                            style: TextStyle(fontSize: 18),
                          ),
                          const Text('With ৳5 Cashback, Validity 7 days'),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  side: const BorderSide(
                                    color: Colors.pink,
                                  )),
                              child: const Text(
                                'Recharge Now',
                                style: TextStyle(color: Colors.pink),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // bottomNavigationBar:
      ),
    );
  }
}
