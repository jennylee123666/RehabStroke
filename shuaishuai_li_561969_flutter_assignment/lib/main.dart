import 'package:flutter/material.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/SecondPage.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/chooseMode.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/designedGame.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/prescribeGamePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shuaishuai_li_561969_flutter_assignment/record.dart';
import 'History.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyD70fbfhwYUkMVtwhexT4GoMMYvgGbOmoY",
          authDomain: "ios-assignment-74b01.firebaseapp.com",
          projectId: "ios-assignment-74b01",
          storageBucket: "ios-assignment-74b01.appspot.com",
          messagingSenderId: "997269185206",
          appId: "1:997269185206:web:9a0a9df7b118b3f8d3bc17",
          measurementId: "G-NM52BRKDBN"
      ));

  // Create the initialization Future outside of `build`:


  @override
  Widget build(BuildContext context)
  {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) //this function is called every time the "future" updates
      {
        // Check for errors
        if (snapshot.hasError) {
          return FullScreenText(text:"Something went wrong");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done)
        {
          //BEGIN: the old MyApp builder from last week
          return ChangeNotifierProvider(
              create: (context) => RecordModel(),
              child: MaterialApp(
                  title: 'History Information',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  home: MyHomePage(title: 'History Information')
              )
          );
          //END: the old MyApp builder from last week
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return FullScreenText(text:"Loading");
      },
    );
  }
}

class MyHomePage extends StatelessWidget {

  MyHomePage({Key? key, required String title}) : super(key: key);

  var txtNameController = TextEditingController();
  var prescribeNameController = PageController;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shuaishuai's Flutter App"),
      ),
      body: Center(child: Column(children: <Widget>[
       // mainAxisAlignment:MainAxisAlignment.spaceAround;

        const Spacer(),

        Expanded(
          child: TextField(
            controller: txtNameController,
            decoration: const InputDecoration(
                hintText: "Enter Name",
                labelText: "Name"
            ),
          ),
        ),
        ElevatedButton(
          child:const Text("Save"),
          onPressed: () =>
          {
            Navigator.push(context, MaterialPageRoute(
                builder:(context) => SecondPage(name: txtNameController.text)

            ))
          },
        ),
        const Spacer(),
        ElevatedButton(child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: const Text("Prescribe Game"),
        ),
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(
                builder:(context) => chooseModePage()

            ))
          },),
        const Spacer(),
        ElevatedButton(child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: const Text("Cognitive Game"),
        ),
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(
                builder:(context) => designedGame()

            ))
          },),
        const Spacer(),
        ElevatedButton(child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: const Text("History"),
        ),
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(
                builder:(context) => History()

            ))
          },),
        const Spacer()
      ],)
      ), //add your widgets here
    );
  }
}

class FullScreenText extends StatelessWidget {
  final String text;

  const FullScreenText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection:TextDirection.ltr, child: Column(children: [ Expanded(child: Center(child: Text(text))) ]));
  }
}
