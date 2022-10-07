import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morningo/Models/OnboardInformationController.dart';
import 'package:morningo/Pages/SetupPage.dart';
import 'package:morningo/Pages/Startup/morning_habits.dart';

// TODO: NIGGA FIX MULTIPLE SELECT & DESELECT.
// Class Based Approach to Selection
// Generate Logic using Class Based Approach.

class Choice {
  const Choice({this.title, this.picture, this.backgroundColor});
  final String title;
  final String picture;
  // New Input Required
  final Color backgroundColor;

  // final Color textColor;

}

const List<Choice> choices = const <Choice>[
  const Choice(
    backgroundColor: Colors.blueAccent,
    title: 'Reduce Stress',
    picture: "Assets/SVG/top_meditation.svg",
  ),
  const Choice(
    title: 'Performance',
    picture: "Assets/SVG/top_work.svg",
    backgroundColor: Colors.deepOrange,
  ),
  const Choice(
    backgroundColor: Color.fromARGB(255, 254, 177, 146),
    title: 'Happiness',
    picture: "Assets/SVG/top_happiness.svg",
  ),
  const Choice(
    backgroundColor: Color.fromRGBO(63, 69, 83, 1),
    title: 'Anxiety',
    picture: "Assets/SVG/top_anxiety.svg",
  ),
  const Choice(
    backgroundColor: Colors.green,
    title: 'Personal Growth',
    picture: "Assets/SVG/top_growth.svg",
  ),
  const Choice(
    backgroundColor: Colors.blueGrey,
    title: 'Sleep',
    picture: "Assets/SVG/top_sleep.svg",
  ),
];

// selected cards
List<Choice> selectedCards = <Choice>[];
List<String> selectedItems = [];

int selectedIndex = -1;

// int selectedLists = [1, 2, 3];

class WhyBringHe extends StatefulWidget {
  const WhyBringHe({Key key}) : super(key: key);

  @override
  State<WhyBringHe> createState() => _WhyBringHeState();
}

class _WhyBringHeState extends State<WhyBringHe> {
  List<String> chosenCards = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    collectionGetting();
  }

  void collectionGetting() async {
    chosenCards = await OnboardController().getCollection("@bringHere");
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    // Build Card

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: heightScreen * 0.14, left: 7),
            padding: EdgeInsets.all(10),
            child: Text(
              'choose a topic to focus on:',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(161, 164, 178, 1),
                  fontFamily: 'Manrope',
                  fontSize: 20,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 50, left: 7, top: 10),
            padding: EdgeInsets.all(10),
            child: Text(
              'What Brings you to Morningo',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(63, 65, 78, 1),
                  fontFamily: 'Manrope',
                  fontSize: 28,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.bold,
                  height: 1.5 /*PERCENT not supported*/
                  ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: heightScreen * 0.20),
            child: Scrollbar(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 2,
                  mainAxisExtent: 250,
                ),
                scrollDirection: Axis.vertical,

                shrinkWrap: true,
                // crossAxisCount: 2,
                children: [
                  ...List.generate(
                    choices.length,
                    (index) => Center(
                      child: SelectCard(choice: choices[index]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: heightScreen * 0.90, left: widthScreen * 0.80),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                // Get the value from the collection Data
                collectionGetting();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MorningHabits()),
                );

                // Goto Next Page
              },
              child: Icon(Icons.arrow_right),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectCard extends StatefulWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  _SelectCardState createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (selected == true) {
          selectedCards.remove(widget.choice);
          // Add remove items
          selectedItems.remove(widget.choice.title);
          selected = false;
        } else if (selected == false) {
          selected = true;
          selectedCards.add(widget.choice);

          // Add new items
          selectedItems.add(widget.choice.title);
        }
        print(selectedItems);
        OnboardController().setCollection("@bringHere", selectedItems);
        setState(() {});
      },
      child: Card(
          color: widget.choice.backgroundColor,
          elevation: selected ? 30 : 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent, width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 3,
                              ),
                              SvgPicture.asset(
                                widget.choice.picture,
                                height: 150,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // Figma Flutter Generator ReducestressWidget - TEXT
                              Text(
                                widget.choice.title,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  //height: 1.5 /*PERCENT not supported*/
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          )),
    );
  }
}
