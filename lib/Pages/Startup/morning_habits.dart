import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morningo/Models/OnboardInformationController.dart';
import 'package:morningo/Pages/SetupPage.dart';

class Choice {
  const Choice(
      {this.title, this.picture, this.backgroundColor, this.titleForScreen});
  final String? title;
  final String? picture;
  // New Input Required
  final Color? backgroundColor;
  final String? titleForScreen;
// final Color textColor;

}

const List<Choice> choices = const <Choice>[
  const Choice(
    backgroundColor: Colors.white,
    title: 'Meditate',
    picture: "Assets/SVG/meditate_guy.svg",
    titleForScreen: 'Meditate',
  ),
  const Choice(
    backgroundColor: Colors.blueGrey,
    title: 'Run',
    picture: "Assets/SVG/run_guy.svg",
  ),
  // const Choice(
  //   title: 'Exercise',
  //   picture: "Assets/SVG/exercise_guy.svg",
  //   backgroundColor: Colors.white,
  // ),
  const Choice(
    backgroundColor: Colors.white,
    title: 'Plan',
    picture: "Assets/SVG/plan_guy.svg",
  ),
  const Choice(
    backgroundColor: Colors.white,
    title: 'Gratitude',
    picture: "Assets/SVG/thinking_guy.svg",
  ),
  const Choice(
    backgroundColor: Colors.green,
    title: 'Cycle',
    picture: "Assets/SVG/cycle_guy.svg",
  ),

  const Choice(
    backgroundColor: Colors.blueGrey,
    title: 'Journal',
    picture: "Assets/SVG/journal_guy.svg",
  ),
  const Choice(
    backgroundColor: Colors.blueGrey,
    title: 'Learning',
    picture: "Assets/SVG/learn_guy.svg",
  ),
  const Choice(
    backgroundColor: Colors.blueGrey,
    title: 'Affirmation',
    picture: "Assets/SVG/aff_guy.svg",
  ),
  const Choice(
    backgroundColor: Colors.blueGrey,
    title: 'Visualization',
    picture: "Assets/SVG/visu_guy.svg",
  ),
];

// selected cards
List<Choice?> selectedCards = <Choice?>[];
List<String?> selectedItems = [];

int selectedIndex = -1;

// int selectedLists = [1, 2, 3];

class MorningHabits extends StatefulWidget {
  const MorningHabits({Key? key}) : super(key: key);

  @override
  State<MorningHabits> createState() => _MorningHabitsState();
}

class _MorningHabitsState extends State<MorningHabits> {
  List<String>? chosenCards = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    collectionGetting();
  }

  void collectionGetting() async {
    chosenCards = await OnboardController().getCollection("@morning_habits");
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
            margin: EdgeInsets.only(top: heightScreen * 0.08, left: 5),
            padding: EdgeInsets.all(16),
            child: Text(
              'The habits are changeable anytime',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(161, 164, 178, 1),
                fontFamily: 'Manrope',
                fontSize: 20,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 50, left: 7, top: 10),
            padding: EdgeInsets.all(16),
            child: Text(
              'Choose your morning habits',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(63, 65, 78, 1),
                  fontFamily: 'Manrope',
                  fontSize: 25,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.bold,
                  height: 1.5 /*PERCENT not supported*/
                  ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: heightScreen * 0.15),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Scrollbar(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
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
                if (chosenCards!.length == 0) {
                  final snackBar = SnackBar(
                    content: const Text('Minimum of 1 Habit Is Required'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SetupPage()),
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
  const SelectCard({Key? key, this.choice}) : super(key: key);
  final Choice? choice;

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
          selectedItems.remove(widget.choice!.title);
          selected = false;
        } else if (selected == false) {
          selected = true;
          selectedCards.add(widget.choice);

          // Add new items
          selectedItems.add(widget.choice!.title);
        }
        print(selectedItems);
        OnboardController().setCollection("@morning_habits", selectedItems);
        setState(() {});
      },
      child: Card(
          color: Colors.white,
          elevation: selected ? 10 : 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent, width: 1),
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
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              SvgPicture.asset(
                                widget.choice!.picture!,
                                height: 120,
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              // Figma Flutter Generator ReducestressWidget - TEXT
                              Text(
                                widget.choice!.title!,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.w500,
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
