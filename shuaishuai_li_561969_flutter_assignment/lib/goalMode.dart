import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/History.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/setGoal.dart';

int repeTimeIndex=1;
int click = 0;
String recordInput1 = "";
int repeTime=0;
String recordList="";
int totalClick=1;
double _currentSliderValue = 3;
String repeTimes ="" ;
String repe="";

class goalModePage extends StatelessWidget {

  const goalModePage({Key? key,}) : super(key: key);
  // repe = repeTimeGoal;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
            appBar: AppBar(title: const Text('Prescribed Game')),
            body:
            Center(child: Column(children: <Widget>[
              FittedBox(child: Text(" Repetition Time Goal: "+repeTimeGoal.toString()),
              ),
              FittedBox(child: Text("Time Limit: "+timeLimit.toString()),),
              Expanded( child: Button(),),

            ])
            )));

  }

// @override
// State<StatefulWidget> createState() {
//   // TODO: implement createState
//   throw UnimplementedError();
// }

}
// class _goalModePageState extends State<goalModePage>{
//   get repeTimeGoal => repeTimeIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     callback(repeT){
//       setState((){
//        repeTimeIndex = repeT;
//        print(repeT);
//       });
//     }
//     throw UnimplementedError();
//   }
// }
// Text("Settled repetition Goal: "+repeTimeGoal+"  Time limit: "+timeLimit),
class Button extends StatefulWidget {

  ButtonState createState() => ButtonState();
}
class ButtonState extends State<Button> {
  final String repeT ="";
  // final Function callback(){}
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
  bool btn4Clicked = false;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    bool visible;

    return Stack(
        fit:StackFit.expand,
        children: [
          Positioned(
              left: MediaQuery.of(context).size.width/2+300,
              top: MediaQuery.of(context).size.height/5+100,
              child: SizedBox(
                  child: Text(" Current Repetition time: "+repeTimes.toString())
                // child: Text("Settled repetition Goal: "+repeTimeGoal+"  Time limit: "+timeLimit),
              )
          ),
          Positioned(
              left: MediaQuery.of(context).size.width/2+RandomNum(),
              top: MediaQuery.of(context).size.height/2+RandomNum(),
              child: SizedBox(

                child: ElevatedButton(

                  onPressed: () => [
                    btn1Clicked = true,
                    click++,
                    buttonPositionReset(),
                    print("clicked "+click.toString()+" times"),setState(() => _flag = !_flag,),
                    recordInput1+="1,",
                    print("repetition times"+repeTimes.toString()),
                    //Record.recordList+="1"
                    repeTimes = (click/_currentSliderValue).toInt().toString(),
                    CheckComplete(),
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
                  click++,
                  recordInput1+="2,",
                  print("clicked "+click.toString()+" times"),
                  repeTimes = (click/_currentSliderValue).toInt().toString(),
                  print("repetition times"+repeTimes.toString()),
                  CheckComplete(),
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
                    click++,
                    recordInput1+="3,",
                    buttonPositionReset(),
                    print("clicked "+click.toString()+" times"),
                    repeTimes = (click/_currentSliderValue).toInt().toString(),
                    print("repetition times"+repeTimes.toString()),
                    CheckComplete(),
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
                    if(( btn3Clicked = true) && (_value = true)){
                      setState(() => _flag2= !_flag2,),
                      setState(() => _flag3= !_flag3,),
                    },
                    btn4Clicked = true,
                    click++,
                    recordInput1+="4,",
                    print("clicked "+click.toString()+" times"),
                    repeTimes = (click/_currentSliderValue).toInt().toString(),
                    buttonPositionReset(),
                    print("repetition times"+repeTimes.toString()),
                    CheckComplete(),
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
                    if(( btn4Clicked = true) && (_value = true)){
                      setState(() => _flag3 = !_flag3,),
                      setState(() => _flag4 = !_flag4,),
                    },
                    btn4Clicked = true,
                    click++,
                    recordInput1+="5",
                    print("recordIput1: "+recordInput1.toString()),
                    print("clicked "+click.toString() +" times"),
                    repeTimes = (click/_currentSliderValue).toInt().toString(),
                    buttonPositionReset(),
                    print("repetition times"+repeTimes.toString()),
                    CheckComplete(),
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
                      print("button number"+_value.toString());
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
                      print("reset"+isSwitched.toString());
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
                  label: _currentSliderValue.toInt().toString(),
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
    if(click>=3)
    {
      if(_currentSliderValue==3)
      {
        print(_currentSliderValue);

        setState(() => _flag = true,);setState(() => _flag1 = true);setState(() => _flag2= true,);
        return true;
      }
      if(_currentSliderValue==4&&click>=4){
        print(_currentSliderValue);

        setState(() => _flag = true,);setState(() => _flag1 = true);setState(() => _flag2= true,);setState(() => _flag3 = true,);
        return true;
      }
      if(_currentSliderValue==5&&click==5){
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

  Future generate_record() async{

    final List<Record> records = [];
    CollectionReference recordsCollection = FirebaseFirestore.instance.collection('records');

    // String timeEnds = DateTime.now().toString();
    Record NewRecord = Record(
      repeTime:int.parse(repeTimes),
      recordList : recordInput1,
      // time = json['timeEnds'],
      totalClick :click,
      id: '',
    );
    DocumentReference docRef = await

    recordsCollection.add(NewRecord.toJson());
    print(recordsCollection.id);

    print("records added to dabs");
  }

  void CheckComplete(){
    if(int.parse(repeTimes) >=int.parse(repeTimeGoal)){
      generate_record();
      showDialog<String>(
        context: context, builder: (BuildContext context) => AlertDialog(
        title: const Text('Congrats'),
        content: const Text('You hit the goal!'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder:(context) => History()
            )),
            child: const Text('Direct to History Page'),
          ),
        ],
      ),
      );
    }
  }
}