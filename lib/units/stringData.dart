import 'package:flutter/material.dart';

class StringValue {
  // Image assets section
  String loginLogo = 'assets/images/bKash_logo.png';
  String profilePicture = 'assets/images/devProfile.jpg';
  String code = "assets/images/do_not_share.jpg";

  // String Section
  String appName = "bKash";
  String defaultCountry = 'BD';
  String lanBng = 'বাংলা';
  String tapBalance = 'Tap for Balance';
  String currencySymbol = '৳';
  String userBalance = '৳ ৫,০০০.৬৮';
  String entPhone = 'Enter mobile number';
  String profileName = 'Md Shirajul Islam';
  String richFor = 'for ';
  String loginReg = 'Login / Registration';
  String mobileNbr = 'Mobile Number';
  String yourMobileNbr = 'Your Mobile Number';
  String hintText = '01xxxxxxxxx';
  String agreeText = 'Proceeding you agree to our ';
  String termsCondition = 'Terms and Conditions';
  String verifyTxt = 'Verify';
  String loginTxt = 'Log In';
  String setName = 'Set your name';
  String setNameDis = 'Your name will appear on your bKash App home screen.';
  String setNameDis2 = 'Only you can see this.';
  String setPP = 'Add your profile picture';

  String setPPdis =
      'Tap below add icon (+) to take a photo or upload your picture.';
  String ppVisible = 'Make my picture visible to others bKash App users.';
  String firstName = 'First Name';
  String lastName = 'Last Name';
  String toYourAcc = 'to your bKash account';
  String accPin = 'bKash PIN';
  String forgotPin = 'Forgot PIN?';

  // Styling Section
  TextStyle labelStyle = TextStyle(
      fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.6));
  String verifyCode = 'Verification code has been sent to';
  String mblNbr = "017xxxxxxxx ";
  TextButton cngBtn = TextButton(
      onPressed: () {},
      child: const Text(
        '(Change)',
        style: TextStyle(
            fontWeight: FontWeight.w400, color: Colors.pink, fontSize: 13),
      ));
}
