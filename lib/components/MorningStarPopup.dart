import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MorningPopUp {
  Widget openPopup(context, [morningStarAmount]) {
    return AlertDialog(
      //title: const Text('Added New Morning Star'),
      elevation: 0,
      content: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.35,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23.0),
                color: const Color(0xffffffff),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'YOU HAVE RECIEVED',
                        style: TextStyle(
                          fontFamily: 'Apercu',
                          fontSize: 15,
                          color: const Color(0xff080c17),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0xffd04673),
                          ),
                          child: Center(
                              heightFactor: 3,
                              widthFactor: 3,
                              child: Icon(
                                FeatherIcons.xCircle,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Icon(
                            FeatherIcons.sun,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '$morningStarAmount',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 53,
                              color: const Color(0xfffba4a4),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Play Animations
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.60,
                height: MediaQuery.of(context).size.height * 0.090,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.07),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color(0xff3ed1a7),
                ),
                child: Center(
                  child: Text(
                    'RECEIVE',
                    style: TextStyle(
                      fontFamily: 'Apercu',
                      fontSize: 25,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
