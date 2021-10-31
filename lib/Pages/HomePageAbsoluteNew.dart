import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:morningo/Models/globalHandler.dart';

class HomePageAbsolute extends StatefulWidget {
  @override
  _HomePageAbsoluteState createState() => _HomePageAbsoluteState();
}

class _HomePageAbsoluteState extends State<HomePageAbsolute> {
  // ignore: non_constant_identifier_names
  int currentIndex_ = 0;
  int morningStar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupMorningStar();
  }

  void setupMorningStar() async {
    morningStar = await GlobalMorningStarHandler().getMorningStar() ?? 0;
    if (morningStar == 0) {
      GlobalMorningStarHandler().setMorningStar(0);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(28),
          topLeft: Radius.circular(28),
        ),
        child: SizedBox(
          height: 110,
          child: BottomNavigationBar(
            currentIndex: currentIndex_,
            enableFeedback: true,
            unselectedItemColor: const Color(0xffdbdbdb),
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.school), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.public), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
            ],
            selectedItemColor: Color(0xffb0a4fb),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            onTap: (index) {
              setState(() {
                currentIndex_ = index;
                print(currentIndex_);
                // if (currentIndex_ == 0) {
                //   Navigator.pushNamed(context, '/courses');
                // }
              });
            },
          ),
        ),
      ),
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Stack(
            alignment: Alignment.topLeft,
            clipBehavior: Clip.antiAlias,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      'Good Morning',
                      style: TextStyle(
                        fontFamily: 'Caviar Dreams',
                        fontSize: 17,
                        color: const Color(0xffc0becc),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40, left: 130),
                    child: Icon(FeatherIcons.sun),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      '120',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 23,
                        color: const Color(0xfffba4a4),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 50, left: 10),
                child: Text(
                  'Saugat Jarif',
                  style: TextStyle(
                    fontFamily: 'Caviar Dreams',
                    fontSize: 32,
                    color: const Color(0xffb0a4fb),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 90,
                ),
                child: Text(
                  '12:00 AM',
                  style: TextStyle(
                    fontFamily: 'Caviar Dreams',
                    fontSize: 40,
                    color: const Color(0xffce97b0),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(top: 160),
                child: Text(
                  'Courses Enrolled / Stats',
                  style: TextStyle(
                    fontFamily: 'Caviar Dreams',
                    fontSize: 20,
                    color: const Color(0xffc0becc),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: 190),
                width: 222,
                height: 104,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: const Color(0xfffbc6a4),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 340),
                child: Text(
                  'Activities',
                  style: TextStyle(
                    fontFamily: 'Caviar Dreams',
                    fontSize: 20,
                    color: const Color(0xffc0becc),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Center(
                heightFactor: 14,
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 117,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(47.0),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff404b69)),
                  ),
                  child: Center(
                    child: Text(
                      'Woke Up',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        color: const Color(0xff283149),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 370),
                width: 318.75,
                height: 81.77,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: const Color(0xfffba4a4),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 460),
                width: 318.75,
                height: 81.77,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: const Color(0xfffba4a4),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 550),
                width: 318.75,
                height: 81.77,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: const Color(0xfffba4a4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
