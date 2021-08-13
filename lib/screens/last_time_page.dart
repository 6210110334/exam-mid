import 'package:exam_mid/mock_data.dart';
import 'package:exam_mid/models/last_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastTimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LastTimeState();
}

class LastTimeState extends State<LastTimePage> {
  List<LastTime> listLastTime = mock;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        height: 50,
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term'),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text('filter'),
          ],
        ),
      ),
      Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: listLastTime.length,
                  itemBuilder: (BuildContext context, int index) {
                    LastTime lastTime = listLastTime[index];
                    return Container(
                      height: 20,
                      child: Row(
                        children: [
                          Text(lastTime.title),
                          Text(lastTime.time.toString()),
                          Text(lastTime.mode)
                        ],
                      ),
                    );
                  })))
    ]));
  }
}
