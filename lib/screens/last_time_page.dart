import 'package:exam_mid/mock_data.dart';
import 'package:exam_mid/models/last_time.dart';
import 'package:exam_mid/screens/detail_last_time_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastTimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LastTimeState();
}

class LastTimeState extends State<LastTimePage> {
  late List<LastTime> listLastTime;

  @override
  void initState() {
    super.initState();
    listLastTime = mock;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exam MidTerm'),
        ),
        body: Container(
          // color: Colors.indigo[50],
          child: Column(children: [
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
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Search'),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    child: Icon(IconData(0xe567, fontFamily: 'MaterialIcons')),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Text('งานที่ทำ'),
                  Spacer(),
                  Text('เวลา'),
                  SizedBox(width: 40)
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: listLastTime.length,
                    itemBuilder: (BuildContext context, int index) {
                      LastTime lastTime = listLastTime[index];
                      return InkWell(
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
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(lastTime.title),
                              Spacer(),
                              Text(lastTime.time.toString().substring(0, 10)),
                            ],
                          ),
                        ),
                      );
                    }))
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Increase volume by 10',
            onPressed: () {
              setState(() {});
            },
          ),
        ));
  }
}
