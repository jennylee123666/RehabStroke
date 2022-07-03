import 'package:flutter/material.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/prescribeGamePage.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/setGoal.dart';

import 'goalMode.dart';


class chooseModePage extends StatelessWidget {

  chooseModePage({Key? key,}) : super(key: key);

  var txtNameController1 = TextEditingController();
  var txtNameController2 = TextEditingController();
  var prescribeNameController = PageController;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Mode Page"),
      ),
      body: Center(child: Column(children: <Widget>[
        // mainAxisAlignment:MainAxisAlignment.spaceAround;
        const Spacer(),
        ElevatedButton(child: Padding(
          padding: const EdgeInsets.all(30.0),
          child:const Text("Goal Mode"),),

          onPressed: () =>
          {
            Navigator.push(context, MaterialPageRoute(
                builder:(context) => setGoalPage()

            ))
          },
        ),
        const Spacer(),
        ElevatedButton(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
          child:const Text("Free Play Mode"),),
          onPressed: () =>
          {
            Navigator.push(context, MaterialPageRoute(
                builder:(context) => prescribeGamePage()

            ))
          },
        ),
        const Spacer(),

      ],)
      ), //add your widgets here
    );
  }
}