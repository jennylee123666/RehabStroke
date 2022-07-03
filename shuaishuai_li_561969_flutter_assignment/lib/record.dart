import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Record
{
  String id;
  String recordList = "";
  int repeTime;
  // int time;
  int totalClick;
   // timeSpent;
  String? image;

  Record({ required this.id,  required this.repeTime, this.image, required this.recordList,
    required this.totalClick, });

  Record.fromJson(Map<String, dynamic> json, String id):
        id = id, //(4)
        recordList = json['recordList'],
        repeTime = json['repeTime'],
        // time = json['timeEnds'],
        totalClick = json['totalClick'],
        // timeSpent = json['timeEnds'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
    'recordList': recordList,
    'repeTime': repeTime,
    // 'timeEnds' : time,
    'totalClick':totalClick,
    // 'timeEnds':time,
    'image':image
  };


}

class RecordModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<Record> items = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  CollectionReference recordsCollection = FirebaseFirestore.instance.collection('records');

  //added this
  bool loading = false;
  RecordModel() {fetch();}

  Future fetch() async {
    //clear any existing data we have gotten previously, to avoid duplicate data
    items.clear();
    //indicate that we are loading
    loading = true;
    notifyListeners(); //tell children to redraw, and they will see that the loading indicator is on
    //get all movies
    var querySnapshot = await (recordsCollection.orderBy("repeTime")).get();
    //iterate over the movies and add them to the list
    querySnapshot.docs.forEach((doc) {
      //note not using the add(Movie item) function, because we don't want to add them to the db
      var record = Record.fromJson(doc.data()! as Map<String, dynamic>, doc.id);
      print(record);
      items.add(record);
    });
    //put this line in to artificially increase the load time, so we can see the loading indicator (when we add it in a few steps time)
    //comment this out when the delay becomes annoying
    await Future.delayed(Duration(seconds: 2));
    //we're done, no longer loading
    loading = false;
    update();
  }
  Future add(Record item) async {
    loading = true;
    update();
    await recordsCollection.add(item.toJson());
    //refresh the db
    await fetch();
  }

  Future updateItem(String id, Record item) async {
    loading = true;
    update();
    await recordsCollection.doc(id).set(item.toJson());
    //refresh the db
    await fetch();
  }

  Future delete(String id) async {
    loading = true;
    update();
    await recordsCollection.doc(id).delete();
    //refresh the db
    await fetch();
  }

  Record? get(String? id) {
    if (id == null) return null;
    return items.firstWhere((record)=> record.id == id);
  }

  void update(){
    notifyListeners();
  }
//replaced this



}