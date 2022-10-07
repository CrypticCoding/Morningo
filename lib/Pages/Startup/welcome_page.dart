import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morningo/Pages/Startup/why_bring.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator WelcomeWidget - FRAME
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: widthScreen,
          height: heightScreen,
          decoration: BoxDecoration(
            color: Color.fromRGBO(246, 150, 4, 1),
          ),
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Positioned(
                height: heightScreen * 1.58,
                width: widthScreen,
                child: SvgPicture.asset(
                  "Assets/SVG/background_meditation_home_screen.svg",
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: heightScreen * 0.71),
                child: SvgPicture.asset(
                  "Assets/SVG/BottomBox.svg",
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: heightScreen * 0.5, left: widthScreen * 0.8),
                child: SvgPicture.asset(
                  "Assets/SVG/Cloud_Forward.svg",
                ),
              ),
              Container(
                child: SvgPicture.asset(
                  "Assets/SVG/Others.svg",
                ),
              ),

              // Others.svg
              InkWell(
                hoverColor: Colors.amber,
                splashColor: Colors.red,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WhyBringHe(),
                    ),
                  );
                },
                child: Container(
                  width: widthScreen,
                  height: heightScreen * 0.1,
                  margin: EdgeInsets.only(
                      left: widthScreen * 0.05, top: heightScreen * 0.87),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: SizedBox(
                          width: widthScreen * 0.90,
                          height: heightScreen,
                          child: ButtonTheme(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // <-- Radius
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WhyBringHe()),
                                );
                              },
                              child: Text(
                                'GET STARTED',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(63, 65, 78, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  /*PERCENT not supported*/
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: heightScreen * 0.20),
                padding: EdgeInsets.all(10),
                child: Text(
                  'Hi User, Welcome to Morningo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(250, 248, 244, 1),
                      fontFamily: 'Manrope',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 1.5 /*PERCENT not supported*/
                      ),
                ),
              ),
              Center(
                heightFactor: 3,
                child: Container(
                  child: Text(
                    'MORNINGO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(225, 238, 221, 1),
                        fontFamily: 'Inter',
                        fontSize: 12,
                        letterSpacing:
                            15 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1.5 /*PERCENT not supported*/
                        ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: heightScreen * 0.37),
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: // Figma Flutter Generator ExploretheappfindsomepeaceofmindtoprepareforyourmorningroutineWidget - TEXT
                    Text(
                  'Explore the app, Find some peace of mind to prepare for your morning routine',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(235, 234, 236, 1),
                      fontFamily: 'Inter',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.5 /*PERCENT not supported*/
                      ),
                ),
              ),

              // All THE SVGS! GO HERE!!!!!!!! --------------

              Container(
                margin: EdgeInsets.only(
                  top: heightScreen * 0.45,
                ),
                child: SvgPicture.asset(
                  "Assets/SVG/Group.svg",
                ),
              ),
              // ALL THE SVGS END HERE!!!!!!! ________________
            ],
          ),
          // Figma Flutter Generator Group6777Widget - GROUP

          //),
        ),
      ),
    );
  }
}
