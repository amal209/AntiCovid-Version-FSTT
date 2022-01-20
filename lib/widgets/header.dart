//import 'package:covid_19/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../pages/info_screen.dart';

class MyHeader extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;

  MyHeader(
      {Key? key,
      required this.image,
      required this.offset,
      required this.textBottom,
      required this.textTop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyHeaderClipper(),
      child: Container(
        width: double.infinity,
        height: 350.0,
        padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF3383CD),
                  Color(0xFF11249F),
                ]),
            image: DecorationImage(
              image: AssetImage('assets/images/virus.png'),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, InfoScreen.routeName),
              child: SvgPicture.asset('assets/icons/menu.svg'),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: offset < 0 ? 0 : offset,
                    child: SvgPicture.asset(
                      image,
                      width: 230,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    top: 20 - offset / 2,
                    left: 170,
                    child: Text(
                      '$textTop \n$textBottom',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}
