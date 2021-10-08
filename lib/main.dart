import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';

void main()=>runApp(
  Myapp(),
);

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,

      ),
      title: 'calculator',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String btnval;
  int firstnum;
  int secondnum;
  String textToDisplay = "";
  String res = "";
  String operatortoperform;

  void btnClicked(btnval){
    if(btnval == "C"){
      firstnum = 0;
      secondnum = 0;
      res = "";
    }
    else if(btnval =="+" || btnval=="-"||btnval=="X"||btnval=="/"){
      firstnum = int.parse(textToDisplay);
      operatortoperform = btnval;
      res = "";
    }
    else if(btnval == "="){
      secondnum = int.parse(textToDisplay);
      if(operatortoperform == "+"){
        res = (firstnum + secondnum).toString();
      }
      if(operatortoperform == "-"){
        res = (firstnum - secondnum).toString();
      }
      if(operatortoperform == "X"){
        res = (firstnum * secondnum).toString();
      }
      if(operatortoperform == "/"){
        res = (firstnum / secondnum).toString();
      }
    }
    else{
      res = int.parse(textToDisplay + btnval).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

//customButton widget
  Widget customButton(btnval){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
          onPressed: () => btnClicked(btnval),
        child: Text(
          '$btnval',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'calculator ( + , - , * , / )',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),

        ),
        centerTitle: true,
      ),

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 10.0,bottom: 10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  '$textToDisplay',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,

                  ),
                ),
              ),
            ),

            Row(
              children: <Widget>[
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("X"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
