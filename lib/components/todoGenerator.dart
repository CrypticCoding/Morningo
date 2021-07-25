// ignore: camel_case_types
import 'package:flutter/material.dart';

List<String> todos = [];
List<String> subtitles = [];
List<Container> cards = [];

class TodoGenerator extends StatefulWidget {
  // const TodoGenerator({ Key? key }) : super(key: key);
  @override
  _TodoGeneratorState createState() => _TodoGeneratorState();
}

class _TodoGeneratorState extends State<TodoGenerator> {
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xfff5a36d),
              ),
              child: ListTile(
                dense: true,
                contentPadding: EdgeInsets.all(15),
                title: Text(
                  todos[index],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: const Color(0xfff3eeee),
                  ),
                  textAlign: TextAlign.left,
                ),
                subtitle: Text(
                  subtitles[index],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: const Color(0xfff3eeee),
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.left,
                ),
                tileColor: Color(0xfff5a36d),
                trailing: IconButton(
                    icon: Icon(Icons.done),
                    onPressed: () {
                      TodoController().removeTodo(index);
                      setState(() {});
                    }),
              ),
            ),
          );
        },
        padding: EdgeInsets.all(14),
        itemCount: todos.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        controller: scrollController,
      ),
    );
  }
}

class TodoController {
  void addTodo(todo, subtitle) {
    todos.add(todo);
    subtitles.add(subtitle);
  }

  void removeTodo(todo) {
    todos.removeAt(todo);
    subtitles.removeAt(todo);
  }

  void removeAllTodo() {
    todos.removeRange(0, todos.length);
    subtitles.removeRange(0, subtitles.length);
  }

  int getAllTodoLenght() {
    return todos.length;
  }
}

class TodoGen {
  void generateTodo() {
    if (todos.length > 0) {
      TodoController().removeAllTodo();
    }
    TodoController().addTodo("Meditate", "Meditation for 5 mins");
    TodoController().addTodo("Excercise", "Excercise for 5 mins");
    TodoController().addTodo("Plan", "Planning for 10 mins");
    // Card Generation
    // TodoCardGenerator();
  }
}

class TodoCardGenerator {
  Widget type1Card() {
    return Container(
      color: Color(0xfff3eeee),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xfff5a36d),
      ),
    );
  }

  Widget type2Card() {
    return Container(
      color: Color(0xfff3eeee),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xff45aefe),
      ),
    );
  }

  TodoCardGenerator() {
    addCard();
  }
  void addCard() {
    cards.add(type1Card());
    cards.add(type2Card());
  }
}
