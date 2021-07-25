import 'package:flutter/material.dart';

class SetupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 100),
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Information',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 39,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                TextFormField(
                  maxLength: 10,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                TextFormField(
                  maxLength: 3,
                  decoration: InputDecoration(hintText: "Age"),
                ),
                TextFormField(
                  maxLength: 3,
                  decoration: InputDecoration(
                      hintText: "Average Fall Asleep Time (In Hours)"),
                ),
                TextFormField(
                  maxLength: 3,
                  decoration: InputDecoration(hintText: "Sleep Time"),
                ),
                TextFormField(
                  maxLength: 3,
                  decoration: InputDecoration(hintText: "Average Wake Up Time"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Done',
                        style: TextStyle(
                          fontFamily: '',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(33.0),
                          color: const Color(0xff6e00ff),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
