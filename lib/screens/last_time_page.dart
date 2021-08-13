import 'package:exam_mid/models/last_time.dart';
import 'package:exam_mid/screens/detail_last_time_page.dart';
import 'package:exam_mid/service/box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LastTimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LastTimeState();
}

class LastTimeState extends State<LastTimePage> {
  final TextEditingController _filter = new TextEditingController();

  @override
  void dispose() {
    Hive.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exam MidTerm'),
        ),
        body: ValueListenableBuilder<Box<LastTime>>(
            valueListenable: Boxes.getLastTime().listenable(),
            builder: (context, box, _) {
              final listLastTime = box.values.toList().cast<LastTime>();
              return Column(children: [
                Container(
                  height: 50,
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 40,
                        width: 200,
                        child: TextField(
                          controller: _filter,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Search Mode'),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                        child:
                            Icon(IconData(0xe567, fontFamily: 'MaterialIcons')),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  color: Colors.green[400],
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Text('งานที่ทำ'),
                      Spacer(),
                      Text('เวลา'),
                      SizedBox(width: 100)
                    ],
                  ),
                ),
                Expanded(
                    child: listLastTime.length == 0
                        ? Center(
                            child: Text('ไม่มีสิ่งที่ต้องทำ'),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: listLastTime.length,
                            itemBuilder: (BuildContext context, int index) {
                              LastTime lastTime = listLastTime[index];
                              return Container(
                                margin: EdgeInsets.only(bottom: 2),
                                color: Colors.green[200],
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailLastTimePage(lastTime)),
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: [
                                        Text(lastTime.title),
                                        Spacer(),
                                        Text(lastTime.time
                                            .toString()
                                            .substring(0, 10)),
                                        SizedBox(width: 20),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          iconSize: 24.0,
                                          color: Colors.red,
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    AlertDialog(
                                                      title: Text(
                                                          'ต้องการลบหรือไม่'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: const Text(
                                                              'ยกเลิก'),
                                                          onPressed: () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: const Text(
                                                              'ยืนยัน'),
                                                          onPressed: () async {
                                                            await lastTime
                                                                .delete();
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ],
                                                    ));
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }))
              ]);
            }),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          tooltip: 'เพิ่มงาน',
          onPressed: () async {
            TextEditingController title = new TextEditingController();
            TextEditingController mode = new TextEditingController();

            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: Text('เพิ่มงานที่ทำ'),
                      content: Container(
                        height: 150,
                        child: Column(
                          children: [
                            TextField(
                              controller: title,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'tile'),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: mode,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'mode'),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('ยกเลิก'),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text('ยืนยัน'),
                          onPressed: () async {
                            await addLastTime(title.text, mode.text);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ));
          },
        ));
  }

  Future addLastTime(String title, String mode) async {
    final lastTime = LastTime()
      ..title = title
      ..time = DateTime.now()
      ..mode = mode;

    final box = Boxes.getLastTime();
    box.add(lastTime);
  }
}
