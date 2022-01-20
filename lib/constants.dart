import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFFFEFEFE);
const kTitleTextColor = Color(0xFF303030);
const kBodyTextColor = Color(0xFF4B4B4B);
const kTextLightColor = Color(0xFF959595);
const kInfectedColor = Color(0xFFFF8748);
const kDeathColor = Color(0xFFFF4848);
const kRecovercolor = Color(0xFF36C12C);
const kPrimaryColor = Color(0xFF3382CC);
final kShadowColor = Color(0xFFB7B7B7).withOpacity(.16);
final kActiveShadowColor = Color(0xFF4056C6).withOpacity(.15);

const KTitleTextStyle = TextStyle(
  color: kTitleTextColor,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

const myStyle = TextStyle(
  color: kTitleTextColor,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

const titlesStyle = TextStyle(
  //color: Colors.yellow,
  backgroundColor: Colors.cyan,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);



const KLinkTextStyle =
    TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500);

final KCardDecoration = BoxDecoration(color: Colors.white, boxShadow: [
  BoxShadow(
      blurRadius: 15,
      spreadRadius: 2.0,
      offset: Offset(0, 8.0),
      color: kShadowColor)
]);

final KActiveCardDecoration =
    KCardDecoration.copyWith(color: kActiveShadowColor);
