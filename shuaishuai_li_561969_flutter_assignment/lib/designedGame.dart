
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';
bool _value = true;
bool isSwitched = true;

class designedGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
            appBar: AppBar(title: Text('Designed Exercise')),
            body:
            Center(
                child: Button())
        ));
  }
}
class Button extends StatefulWidget {
  final String? id;

  const Button({super.key, this.id}); //UPDATE THIS LINE
  ButtonState createState() => ButtonState();
}

class ButtonState extends State<Button> {
  bool enabled1 = true;bool enabled2 = true;bool enabled3 = true;bool enabled4 = true;bool enabled5 = true;
  bool click_button1 = false;bool click_button2 = false;bool click_button3 = false;bool click_button4 = false;bool click_button5 = false;

  @override
  Widget build(BuildContext context) {
    var _currentSliderValue;
    return Stack(
        children: <Widget>[

          Positioned(
              left: 190,
              top: 150,
              child: SizedBox(
                  width: 100,
                  child: Text("  I    ", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),)
              )
          ),
          Positioned(
              left: 230,
              top: 150,
              child: SizedBox(
                  width: 200,
                  child: Text("  ___    ", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),)
              )
          ),
          Positioned(
              left: 280,
              top: 150,
              child: SizedBox(
                  width: 250,
                  child: Text("  V    ", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),)
              )
          ),

          Positioned(
              left: 300,
              top: 150,
              child: SizedBox(
                  width: 300,
                  child: Text("  ___     ", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),)
              )
          ),
          Positioned(
              left: 400,
              top: 150,
              child: SizedBox(
                  width: 160,
                  child: Text("  T    ", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),)
              )
          ),
          Positioned(
              left: 500,
              top: 150,
              child: SizedBox(
                  width: 160,
                  child: Text("  H   ", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),)
              )
          ),
          Positioned(
              left: 600,
              top: 150,
              child: SizedBox(
                  width: 160,
                  child: Text("  ___  ", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),)
              )
          ),
          Positioned(
              left: 700,
              top: 150,
              child: SizedBox(
                  width: 160,
                  child: Text("  S    ", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),)
              )
          ),
          Positioned(
              left: 800,
              top: 150,
              child: SizedBox(
                  width: 160,
                  child: Text(" G    ", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),)
              )
          ),
          Positioned(
              left: 900,
              top: 150,
              child: SizedBox(
                  width: 160,
                  child: Text("  A    ", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),)
              )
          ),
          Positioned(
              left: 1000,
              top: 150,
              child: SizedBox(
                  width: 160,
                  child: Text("  ____  ", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),)
              )
          ),
          Positioned(
              left: 1100,
              top: 150,
              child: SizedBox(
                  width: 160,
                  child: Text(" E ", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),)
              )
          ),
          Positioned(
              left: MediaQuery
                  .of(context)
                  .size
                  .width / 4+RandomNum(),
              top: MediaQuery
                  .of(context)
                  .size
                  .height / 4+RandomNum(),
              child: SizedBox(
                width: 50, height: 50,
                child: ElevatedButton(
                  onPressed: enabled1 ? () =>
                  {
                    if(click_button1 = true){
                      setState(() => enabled1 = false,),
                    },
                    click_button1 = true,
                  } : null,
                  child: Text(enabled1 ? 'E' : "E", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),),
                  style: ElevatedButton.styleFrom(
                    primary: enabled1 ? Colors.deepPurpleAccent : Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              )
          ),
          Positioned(
              left: MediaQuery
                  .of(context)
                  .size
                  .width / 7+RandomNum1(),
              top: MediaQuery
                  .of(context)
                  .size
                  .height / 7+RandomNum1(),
              child: SizedBox(
                width: 50, height: 50,
                child: ElevatedButton(
                  onPressed: enabled2 ? () =>
                  {
                    if(click_button2 = true){
                      setState(() => enabled2 = false,),
                    },
                    click_button2 = true,
                  } : null, //set onPressed to null means disable

                  child: Text(enabled2 ? 'O' : "O", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),),
                  style: ElevatedButton.styleFrom(
                    primary: enabled2 ? Colors.deepPurpleAccent : Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              )
          ),
          Positioned(
              left: MediaQuery
                  .of(context)
                  .size
                  .width / 3+RandomNum2(), top: MediaQuery
              .of(context)
              .size
              .height / 3+RandomNum2(),
              child: SizedBox(
                width: 50, height: 50,
                child: ElevatedButton(
                  onPressed: enabled3 ? () =>
                  {
                    if(click_button3 = true){
                      setState(() => enabled3 = false,),
                    },
                    click_button3 = true,
                    // clicks++,buttons+="A,",
                    // five[clicks-1]=3,
                    // reset(),
                    // CheckComplete(),
                  } : null,
                  child: Text(enabled3 ? 'I' : "I", style: DefaultTextStyle
                      .of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),),
                  style: ElevatedButton.styleFrom(
                    primary: enabled3 ? Colors.deepPurpleAccent : Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              )
          ),
          Positioned(
              left: MediaQuery
                  .of(context)
                  .size
                  .width / 3+RandomNum3(),
              top: MediaQuery
              .of(context)
              .size
              .height / 4+RandomNum3(),
              child: SizedBox(
                  width: 50, height: 50,
                  child: Visibility(
                    child: ElevatedButton(
                      onPressed: enabled4 ? () =>
                      {
                        if(click_button4 = true){
                          setState(() => enabled4 = false,),
                        },
                        click_button4 = true,
                        // clicks++,buttons+="G,",
                        // five[clicks-1]=4,
                        // reset(),
                        // CheckComplete(),
                      } : null,
                      child: Text(enabled4 ? 'M' : "M", style: DefaultTextStyle
                          .of(context)
                          .style
                          .apply(fontSizeFactor: 2.0),),
                      style: ElevatedButton.styleFrom(
                        primary: enabled4 ? Colors.deepPurpleAccent : Colors
                            .white,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  )
              )
          ),
          Positioned(
            left: MediaQuery
                .of(context)
                .size
                .width / 2+RandomNum4(), top: MediaQuery
              .of(context)
              .size
              .height / 5+RandomNum4(),
            child: SizedBox(
                width: 50, height: 50,
                child: Visibility(
                  child: ElevatedButton(
                    onPressed: enabled5 ? () =>
                    {
                      if(click_button5 = true){
                        setState(() => enabled5 = false,),
                      },
                      click_button5 = true,

                    } : null,
                    child: Text(enabled5 ? 'W' : "X", style: DefaultTextStyle
                        .of(context)
                        .style
                        .apply(fontSizeFactor: 2.0),),
                    style: ElevatedButton.styleFrom(
                      primary: enabled5 ? Colors.deepPurpleAccent : Colors
                          .white,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  ),

                )

            ),
          ),

          Positioned(
            left: MediaQuery.of(context).size.width/2+300,
            top: MediaQuery.of(context).size.height/4-100,
            child: Row(
              children:[
                Text('Indication'),
                Switch(
                  value: _value,
                  onChanged: (value){
                    setState(() {
                      _value = value;
                      print(_value);
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                ),
                Text('Reset'),
                Switch(
                  value: isSwitched,
                  onChanged: (value){
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                ),
              ],
            ),
          ),
        ]);
  }
  int RandomNum(){
    var setPosition = Random();
    return setPosition.nextInt(120);
  }
  int RandomNum1(){
    var setPosition = Random();
    return setPosition.nextInt(180);
  }
  int RandomNum2(){
    var setPosition = Random();
    return setPosition.nextInt(220);
  }
  int RandomNum3(){
    var setPosition = Random();
    return setPosition.nextInt(270);
  }
  int RandomNum4(){
    var setPosition = Random();
    return setPosition.nextInt(320);
  }
}