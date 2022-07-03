import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/record.dart';

class recordDetails extends StatefulWidget
{
  final String? id; //UPDATE THIS LINE

  const recordDetails({Key? key, this.id}) : super(key: key);

  @override
  _recordDetailsState createState() => _recordDetailsState();
}
class _recordDetailsState extends State<recordDetails> {
  @override
  Widget build(BuildContext context)
  {
    var record = Provider.of<RecordModel>(context, listen:false).get(widget.id);

    var adding = record == null;
    if (adding) {record = Record(
        id:"", recordList: '', totalClick:0,
       repeTime:0,
      // time:0, timeSpent: 0
     ) ;  }

    return Scaffold(
        appBar: AppBar(
          title: Text(adding ? "Add  record" : "Edit  record"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  if (adding == false)
                    Form(child: Center(
                        child: Column(
                          children: <Widget>[
                            //game details....
                            Text("Start Date "+  record.toString().toString(),
                              style: TextStyle(height: 1, fontSize: 30),),
                            // Text("End Date "+  record.endTime.toString(),
                            //   style: TextStyle(height: 1, fontSize: 30),),
                            // Text("========== Configurations ========== ",
                            //   style: TextStyle(height: 1, fontSize: 30),),
                            //
                            // Text("Number of buttons for a success "+  record.totalButtons.toString(),
                            //   style: TextStyle(height: 1, fontSize: 30),),
                            // Text("Total time allowed "+  record.totalMinutes.toString()+" Minutes",
                            //   style: TextStyle(height: 1, fontSize: 30),),
                            // Text("Game Goal was: "+  record.totalGoal.toString(),
                            //   style: TextStyle(height: 1, fontSize: 30),),
                            // Text("success Time "+  record.success.toString(),
                            //   style: TextStyle(height: 1, fontSize: 30),),
                            // if( record.complete==true)
                            //   Text("Complete status: Yes",
                            //     style: TextStyle(height: 1, fontSize: 30),
                            //   ), if( record.complete==false)
                            //   Text("Complete status: No",
                            //     style: TextStyle(height: 1, fontSize: 30),
                            //   ),
                            // Text("Button Pressed ",
                            //   style: TextStyle(height: 1, fontSize: 30),),
                            // Text( record.buttons.toString(),
                            //   style: TextStyle(height: 1, fontSize: 30),),
                            Row(
                              children: [
                                ElevatedButton.icon(
                                    onPressed: () => {
                                      // camera(),
                                    },
                                    icon: const Icon(Icons.add_a_photo_outlined),
                                    label: const Text("Take Photo")),
                              ],
                            )
                          ],
                        )

                    ),
                    ),
                ]
            )
        )
    );



  }
}
