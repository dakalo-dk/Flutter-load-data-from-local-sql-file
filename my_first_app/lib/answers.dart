import "package:flutter/material.dart";

class Answers extends StatelessWidget {
  final Function selectAnswer;
  Answers(this.selectAnswer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(onPressed: selectAnswer,
      child: Text("Answer 1"),
      color: Colors.blue,
      textColor: Colors.white,),
      
    );
  }
}