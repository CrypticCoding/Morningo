// ignore: camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morningo/Models/OnboardInformationController.dart';

List<String> todos = [];
List<String> subtitles = [];
// List<TodoCard> cards = [];
List<Widget> svgs = [];

List<TodoCard> cards = [];
ScrollController scrollController;
List<String> placesToGo = [];
List<Color> colorsOfCard = [];

List<String> selectedCardsTodo = [];

class TodoGenerator extends StatefulWidget {
  @override
  _TodoGeneratorState createState() => _TodoGeneratorState();
}

class _TodoGeneratorState extends State<TodoGenerator> with RouteAware {
  final newKey = GlobalKey<_TodoGeneratorState>();

  @override
  Widget build(BuildContext newContext) {
    return ListView.builder(
      addRepaintBoundaries: true,
      addAutomaticKeepAlives: true,
      addSemanticIndexes: true,
      reverse: false,
      cacheExtent: 3,
      primary: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 7, top: 0),
          child: Container(
            child: Column(
              children: [
                cards[index],
              ],
            ),
          ),
        );
      },
      padding: EdgeInsets.only(top: 1),
      itemCount: cards.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      controller: scrollController,
    );
  }
}

class TodoController {
  void addTodo(todo, subtitle, svg, placeToGo, colorOfCard) {
    todos.add(todo);
    subtitles.add(subtitle);
    // New
    svgs.add(svg);
    placesToGo.add(placeToGo);
    colorsOfCard.add(colorOfCard);
  }

  void removeTodo(todo) {
    todos.removeAt(todo);
    subtitles.removeAt(todo);
    // New
    svgs.removeAt(todo);
  }

  void removeAllTodo() {
    todos.removeRange(0, todos.length);
    subtitles.removeRange(0, subtitles.length);
    // New
    svgs.removeRange(0, svgs.length);
  }

  int getAllTodoLenght() {
    return cards.length;
  }

  void removeSpecificTodo(todo, [subtitle, SvgPicture svg, int index]) async {
    cards.removeWhere((element) => element.todoName == todo);
    // print(cards);
  }
}

class TodoGen {
  void generateTodo() async {
    if (todos.length > 0) {
      TodoController().removeAllTodo();
    }
    selectedCardsTodo =
        await OnboardController().getCollection("@morning_habits");

    for (var i = 0; i < selectedCardsTodo.length; i++) {
      TodoController().addTodo(
        selectedCardsTodo[i],
        "${selectedCardsTodo[i]} in 10 Minutes",
        SvgPicture.asset(
            'Assets/SVG/${selectedCardsTodo[i].toLowerCase()}_guy.svg'),
        "/${selectedCardsTodo[i]}",
        Colors.white,
      );
    }

    // This is where you will add those panes
    // TodoController().addTodo(
    //   "Meditate",
    //   "Meditation for 10 mins",
    //   SvgPicture.asset('Assets/SVG/meditate_guy.svg'),
    //   "/Meditate",
    //   Color(0xfffba4a4),
    // );
    // TodoController().addTodo(
    //     "Excercise",
    //     "Excercise for 10 mins",
    //     SvgPicture.asset('Assets/SVG/exercise_guy.svg'),
    //     "/Excercise",
    //     Color(0xffd2a4fb));
    // TodoController().addTodo(
    //   "Plan",
    //   "Planning for 10 mins",
    //   SvgPicture.asset('Assets/SVG/plan_guy.svg'),
    //   "/Plan",
    //   Color(0xffa4befb),
    // );

    // Card Generation
    TodoCardGenerator().generateCard();
  }
}

class TodoCardGenerator {
  void generateCard([index]) {
    for (var i = 0; i < todos.length; i++) {
      cards.add(
        TodoCard(
          todoName: todos[i],
          subtitle: subtitles[i],
          mascot: svgs[i],
          placeToGo: placesToGo[i],
          colorOfCard: colorsOfCard[i],
        ),
      );
    }
  }
}

// ignore: must_be_immutable
class TodoCard extends StatefulWidget {
  String todoName;
  String subtitle;

  Widget mascot;
  String placeToGo;

  BuildContext buildContext;

  var colorOfCard;

  TodoCard({
    Key key,
    @required this.todoName,
    @required this.subtitle,
    @required this.mascot,
    @required this.placeToGo,
    this.buildContext,
    @required this.colorOfCard,
  }) : super(key: key);
  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      borderOnForeground: true,
      shadowColor: Colors.black87,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(bottom: 0),
      color: widget.colorOfCard,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.todoName,
                  style: TextStyle(
                    fontFamily: 'Caviar Dreams',
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'duration: 10 minutes',
                  style: TextStyle(
                    fontFamily: 'Caviar Dreams',
                    fontSize: 9,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                Container(
                  margin: EdgeInsets.only(right: 120, left: 0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed("/" + widget.todoName)
                          .then((_) => setState(() {}));
                    },
                    child: Text(
                      'start',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    minWidth: 49,
                    height: 24,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: const Color(0xff1e0e33),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: widget.mascot,
            width: 109,
            height: 100,
          )
        ],
      ),
    );
  }
}

// ABSOLUTE LATEST CARD:
// Navigator.pushNamed(context, '/' + widget.todoName);

// LATEST ONES:
// ListTile(
//               dense: true,
//               contentPadding: EdgeInsets.all(15),
//               title: Text(
//                 todos[index],
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 20,
//                   color: const Color(0xfff3eeee),
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//               subtitle: Text(
//                 subtitles[index],
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 14,
//                   color: const Color(0xfff3eeee),
//                   fontWeight: FontWeight.w300,
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//               tileColor: Color(0xfff5a36d),
//               trailing: IconButton(
//                   icon: Icon(Icons.done),
//                   color: Colors.white,
//                   onPressed: () {
//                     print(todos[index]);
//                     Navigator.of(context).pushNamed('/' + todos[index]).then(
//                           (_) => setState(
//                             () {},
//                           ),
//                         );
//                   }),
//             ),

// ListTile(
//                   dense: true,
//                   contentPadding: EdgeInsets.all(15),
//                   title: Text(
//                     todos[index],
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 20,
//                       color: const Color(0xfff3eeee),
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                   subtitle: Text(
//                     subtitles[index],
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 14,
//                       color: const Color(0xfff3eeee),
//                       fontWeight: FontWeight.w300,
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                   tileColor: Color(0xfff5a36d),
//                   trailing: IconButton(
//                     icon: Icon(Icons.done),
//                     color: Colors.white,
//                     onPressed: () {
//                       print(todos[index]);
//                       Navigator.of(newContext)
//                           .pushNamed('/' + todos[index])
//                           .then(
//                             (_) => setState(
//                               () {},
//                             ),
//                           );
//                     },
//                     hoverColor: Colors.white,
//                   ),

//                 ),
