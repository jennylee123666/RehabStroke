import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:shuaishuai_li_561969_flutter_assignment/main.dart';
import 'dart:core';
import 'camera.dart';
import 'record.dart';
import 'package:image_picker/image_picker.dart';

import 'package:share_plus/share_plus.dart';
import 'dart:io';
// import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
String list = '';
var itemList =[Record];
class History extends StatelessWidget {

  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
      // create:(context) => RecordModel(),
      // child: MaterialApp(
        title: 'History',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
       home: HistoryPage(recordList: "History Information",),
      // ),
    );
  }
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key, required this.recordList}) : super(key: key);

  final String recordList;

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
{
late File image;
// late Future<File> imageFile;
// Widget showImage() {
//   return FutureBuilder<File>(
//     future: imageFile,
//     builder: (BuildContext context, AsyncSnapshot<File> snapshot){
//       if (snapshot.connectionState ==  ConnectionState.done &&
//           snapshot.data != null){
//         return Image.file(
//           snapshot.data,
//           width: 100,
//           height: 100,
//         );
//       }else if(snapshot.error != null){
//         return const Text('Error Picking Image',);
//       }else{
//         return const Text('No Image Selected');
//       }
//     },
//   );
// }
// pickImagefromGallery(ImageSource source) {
//   setState((){
//     imageFile = ImagePicker.pickImage(source: source);
//   });
//
// }
  // final List<Record> records = [
  //   Record(id:"1", repeTime:1 ,recordList : [1,2,3,4,5], time:2001, totalClick:9001, image:"https://upload.wikimedia.org/wikipedia/en/8/8a/The_Lord_of_the_Rings_The_Fellowship_of_the_Ring_%282001%29.jpg", timeSpent: 1,),
  //   Record(id:"1", repeTime:1 ,recordList : [1,2,3,4,5], time:2001, totalClick:9001, image:"https://upload.wikimedia.org/wikipedia/en/c/c1/The_Matrix_Poster.jpg",timeSpent: 1,)
  // ];
  @override
  Widget build(BuildContext context)
  {
    return Consumer<RecordModel>(
        builder:buildScaffold
    );
  }
Future pickImage() async{
    try{
   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(()=> this.image = imageTemporary);
} on PlatformException catch (e){
      print("failed to pick image:$e");
    }
  }
  Scaffold buildScaffold(BuildContext context, RecordModel recordModel, _){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recordList),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(32),
                  child:Column(
                    children: <Widget>[
                       // showImage(),
                      ElevatedButton.icon(
                          onPressed: () => {
                            // pickImage(),
                            // pickImagefromGallery(ImageSource.gallery),
                          },
                          icon: const Icon(Icons.image_outlined),
                          label: const Text("Pick Gallery")),
                    // image !=null? Image.file(image!,width: 80,
                    // height: 90,
                    // fit: BoxFit.cover,):FlutterLogo(size: 30,)
                    ],
                  )
                  ),
                ElevatedButton.icon(
                    onPressed: () => {
                      camera(),
                    },
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: const Text("Take Photo")),
                ElevatedButton(
                    onPressed: () => {
                      itemList.forEach((item) {

                    list += '-llllll';
                    list += "something";
                    list += '\n';
                    }
                    ),
                    Share.share(list.toString()+"record..................")
                    },
                    child: const Text("Share Record")),
                Text("Please slide to left to delete unwanted record! Refresh the page to check the newly added ones!")
              ],
            ),

            if (recordModel.loading) CircularProgressIndicator() else  Expanded(
              child: ListView.builder(
                  itemCount: recordModel.items.length,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemBuilder: (_, index){

                    var record = recordModel.items[index];
                    var image = record.image;
                    return Dismissible(

                        background: Container(color: Colors.deepPurple,),
                        key: ValueKey<int>(index),
                        onDismissed: (DismissDirection direction) {
                          showDialog<String>(
                            context: context, builder: (BuildContext context) => AlertDialog(
                            title: const Text('Are you sure to delete the record?'),
                            content: const Text('It cannot be reversed'),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () => setState(() {
                            recordModel.delete(record.id);
                            Navigator.push(context, MaterialPageRoute(
                                builder:(context) => History()
                            ));
                          }),
                                child: const Text('Delete'),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.push(context, MaterialPageRoute(
                                    builder:(context) => History()
                                )),
                                child: const Text('Cancel'),
                              ),
                            ],
                          ),
                          );

                        },
                        child: ListTile( //movie list
                          title: Text(record.recordList.toString()),
                          subtitle: Text(
                              // " Clicked at: " +record.time.toString()
                               " Record List: " + record.recordList.toString()
                              + " Totally repeted:"+ record.repeTime.toString() +"times  "
                              +"Total clicked "+record.totalClick.toString()+"times"
                              // +"Time spent"+record.timeSpent.toString()),
                          ),
                          // leading: image != null ? Image.network(image) : null,
                          onTap: () { 
                            // return Alert(context: context,
                            // title:"Are you sure to delete?" )

                          },
                        )
                    );
                  }),

            ),
            ElevatedButton(
              onPressed: () => setState(() {
                Navigator.push(context, MaterialPageRoute(
                    builder:(context) => MyHomePage(title: '',)
                ));
              }),
              child: const Text('Back to HomePage'),
            ),

          ],
        ),
      ),
    );
  }

}


// Future pickImage() async{
//   try{
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image == null) return;
//
//     final imageTemporary = File(image.path);
//     setState(()=> this.image = imageTemporary);
//   } on PlatformException catch (e){
//     print("failed to pick image:$e");
//   }
// }
// Future<bool> confirmDialog1(BuildContext context) {
//   return showDialog<bool>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context){
//         return AlertDialog(
//           title: Text("Are you sure"),
//           actions: <Widget>[
//            FlatButton(
//                 child:const Te
//                 onPressed: onPressed,
//                 child: child)
//           ],
//         )
//       }
//   )

