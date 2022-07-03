import 'package:flutter/material.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/SecondPage.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/goalMode.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/prescribeGamePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/record.dart';
import 'History.dart';
import 'package:provider/provider.dart';
String repeTimeGoal="";
String timeLimit ="";
class setGoalPage extends StatelessWidget {

  setGoalPage({Key? key,}) : super(key: key);

  var txtNameController1 = TextEditingController();
  var txtNameController2 = TextEditingController();
  var prescribeNameController = PageController;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Goal"),
      ),
      body: Center(child: Column(children: <Widget>[
        // mainAxisAlignment:MainAxisAlignment.spaceAround;

        const Spacer(),

        Expanded(
          child: TextField(
            controller: txtNameController1,
            decoration: const InputDecoration(
                hintText: "Repetition Time Goal",
                labelText: "Set Repetition Time Goal"
            ),
          ),
        ),
        Expanded(
          child: TextField(
            controller: txtNameController2,
            decoration: const InputDecoration(
                hintText: "Time Limit Goal",
                labelText: "Set Time Limit Goal"
            ),
          ),
        ),
        ElevatedButton(
          child:const Text("Save"),
          onPressed: () =>[
          {
            repeTimeGoal= txtNameController1.text.toString(),
            timeLimit =  txtNameController2.text.toString(),
            Navigator.push(context, MaterialPageRoute(
                builder:(context) => goalModePage(),
                // builder:(context) =>ButtonState(repeTimeGoal: txtNameController1.text, timeLimit: txtNameController2.text)

            ))
          },
            // {
            //   Navigator.push(context, MaterialPageRoute(
            //
            //      builder:(context) => Button(repeTimeGoal: txtNameController1.text, timeLimit: txtNameController2.text)
            //
            //   ))
            // }
        ]

        ),
        const Spacer(),

      ],)
      ), //add your widgets here
    );
  }
}