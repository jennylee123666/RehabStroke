import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/record.dart';
//how many buttons are used for this game
//goal of success
int fclick = 0;
String recordInput = "";
String frepeTimes ="" ;
class prescribeGamePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
            appBar: AppBar(title: const Text('Prescribed Game')),
            body:
            Center(
                child: Button())
        ));
  }

}
class Button extends StatefulWidget {

  ButtonState createState() => ButtonState();
}
class ButtonState extends State<Button> {
  bool _flag = true;
  bool _flag1 = true;
  bool _flag2 = true;
  bool _flag3 = true;
  bool _flag4 = true;
  bool _value = true;
  bool isSwitched = true;
  double _currentSliderValue = 3;
  bool btn1Clicked = false;
  bool btn2Clicked = false;
  bool btn3Clicked = false;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    bool visible;
    return Stack(children: [
      Positioned(
      left: MediaQuery.of(context).size.width / 2 + RandomNum(),
      top: MediaQuery.of(context).size.height/2+RandomNum(),
          child: SizedBox(

            child: ElevatedButton(

              onPressed: () => [
                btn1Clicked = true,
                fclick++,
                buttonPositionReset(),
                print("clicked"+fclick.toString()),setState(() => _flag = !_flag,),
                recordInput+="1",
                print(recordInput),
                frepeTimes = (fclick/_currentSliderValue).toInt().toString(),
              ],
              child: Text(_flag ? '1' : '1'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // This is what you need!
              ),
            ),
          )
      ),

      Positioned(
        left: MediaQuery.of(context).size.width/2+RandomNum1(),
        top: MediaQuery.of(context).size.height/3+RandomNum1(),
        child: SizedBox(

          child: ElevatedButton(
            onPressed: () => [
              // if (slider)
              if(( btn1Clicked = true) && (_value = true)){
                setState(() => _flag = !_flag,),
                setState(() => _flag1 = !_flag1,),
              },
              btn2Clicked = true,
              fclick++,
              print("clicked"+fclick.toString()),
              recordInput+="2",
              print(recordInput),
              frepeTimes = (fclick/_currentSliderValue).toInt().toString(),
            ],
            child: Text(_flag ? '2' : '2'),
            style: ElevatedButton.styleFrom(
              primary: _flag ? Colors.blue : Colors.green,
            ),
          ),
        ),
      ),


      Positioned(
          left: MediaQuery.of(context).size.width/2+RandomNum2(),
          top: MediaQuery.of(context).size.height/2+RandomNum2(),
    child: Visibility(
          child: SizedBox(

            child:
            ElevatedButton(

              onPressed: () => [
                if ( _currentSliderValue == 2 ){
                  setState(() => visible = !_flag1,)
                },
                if(( btn2Clicked = true) && (_value = true)){
                  setState(() => _flag1 = !_flag1,),
                  setState(() => _flag2 = !_flag2,)
                },
                btn3Clicked = true,
                fclick++,
                buttonPositionReset(),
                print("clicked"+fclick.toString()),
                recordInput+="3",
                print(recordInput),
                frepeTimes = (fclick/_currentSliderValue).toInt().toString(),
              ],
              child: Text(_flag1 ? '3' : '3'),
              style: ElevatedButton.styleFrom(
                primary: _flag1 ? Colors.blue : Colors.green,
              ),
            ),
          ),visible: btn3visible(),
      ),),
      Positioned(
        left: MediaQuery.of(context).size.width/2+RandomNum3(),
        top: MediaQuery.of(context).size.height/1.5+RandomNum3(),
        child: Visibility(
          child: SizedBox(
            child:
            ElevatedButton(
              onPressed: () => [
                if(( btn2Clicked = true) && (_value = true)){
                  setState(() => _flag2= !_flag2,),
                  setState(() => _flag3= !_flag3,),
                },
                btn3Clicked = true,
                fclick++,
                print("clicked"+fclick.toString()),
                buttonPositionReset(),
                recordInput+="4",
                print(recordInput),
                frepeTimes = (fclick/_currentSliderValue).toInt().toString(),
              ],
              child: Text(_flag2 ? '4' : '4'),
              style: ElevatedButton.styleFrom(
                primary: _flag2 ? Colors.blue : Colors.green,
              ),
            ),
          ),visible: btn4visible(),
        ),),
      Positioned(
        left: MediaQuery.of(context).size.width/2+RandomNum4(),
        top: MediaQuery.of(context).size.height/3.5+RandomNum4(),
        child: Visibility(
          child: SizedBox(

            child:
            ElevatedButton(
              onPressed: () => [
                if(( btn2Clicked = true) && (_value = true)){
                  setState(() => _flag3 = !_flag3,),
                  setState(() => _flag4 = !_flag4,),
                },
                btn3Clicked = true,
                fclick++,
                print("clicked"+fclick.toString()),
                buttonPositionReset(),
                recordInput+="5",
                print(recordInput),
                frepeTimes = (fclick/_currentSliderValue).toInt().toString(),
              ],
              child: Text(_flag3 ? '5' : '5'),
              style: ElevatedButton.styleFrom(
                primary: _flag3 ? Colors.blue : Colors.green,
              ),
            ),
          ),visible: btn5visible(),
        ),),
      Positioned(
        left: MediaQuery.of(context).size.width/2+300,
        top: MediaQuery.of(context).size.height/4,
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
      Positioned(
        left: MediaQuery.of(context).size.width/2+300,
        top: MediaQuery.of(context).size.height/5,
        child: Row(
          children:[
            Text('Indication'),

            Slider(
              value: _currentSliderValue,
              min: 2,
              max: 5,
              divisions: 3,
              label: _currentSliderValue.round().toString(),
              onChanged: (double sliderValue) {
                setState(() {
                  _currentSliderValue = sliderValue;
                  var i = sliderValue.toInt();
                  print( _currentSliderValue);
                });
              },
            )
          ],
        ),
      ),
    ]);
  }

  bool buttonPositionReset()
  {
    if(fclick>=3)
    {
      if(_currentSliderValue==3)
      {
        print(_currentSliderValue);

        setState(() => _flag = true,);setState(() => _flag1 = true);setState(() => _flag2= true,);
        return true;
      }
      if(_currentSliderValue==4&&fclick>=4){
        print(_currentSliderValue);

        setState(() => _flag = true,);setState(() => _flag1 = true);setState(() => _flag2= true,);setState(() => _flag3 = true,);
        return true;
      }
      if(_currentSliderValue==5&&fclick==5){
        print(_currentSliderValue);

        setState(() => _flag = true,);setState(() => _flag1 = true);setState(() => _flag2= true,);setState(() => _flag3 = true,);setState(() => _flag4 = true,);
        return true;
      }else{
        return false;
      }
    }
    else
    {
      return false;
    }
  }

  bool btn3visible(){
    if(_currentSliderValue>=3){
      return true;
    }else{
      return false;
    }
  }
  bool btn4visible(){
    if(_currentSliderValue>=4){
      return true;
    }else{
      return false;
    }
  }
  bool btn5visible(){
    if(_currentSliderValue==5){
      return true;
    }else{
      return false;
    }
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
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      Future generate_record() async{

        final List<Record> records = [];
        CollectionReference recordsCollection = FirebaseFirestore.instance.collection('records');

        String timeEnds = DateTime.now().toString();
        Record NewRecord = Record(
          repeTime:int.parse(frepeTimes),
          recordList : recordInput,
          // time = json['timeEnds'],
          totalClick :fclick,
          id: '',
        );
        DocumentReference docRef = await

        recordsCollection.add(NewRecord.toJson());
        print(recordsCollection.id);

        print("records added to dabs");
      }
      generate_record();
    });
    switch(state) {
      case AppLifecycleState.resumed:
      // Handle this case
        break;
      case AppLifecycleState.inactive:
      // Handle this case
        break;
      case AppLifecycleState.paused:
      // Handle this case
        break;
    }
  }
  // if (
  // Navigator.push(context, MaterialPageRoute(
  // builder:(context) => SecondPage(name: txtNameController.text)
  //
  // ))){
  //
  // }
}

