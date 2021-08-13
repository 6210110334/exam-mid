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
  final TextEditingController _filter = new TextEditingController();

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
        body: Column(children: [
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
                    onChanged: (value) {
                      setState(() {
                        _filter.text = value;
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Search Mode'),
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
            height: 40,
            color: Colors.green[400],
            margin: EdgeInsets.symmetric(horizontal: 8),
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
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Text(lastTime.title),
                                  Spacer(),
                                  Text(lastTime.time
                                      .toString()
                                      .substring(0, 10)),
                                ],
                              ),
                            ),
                          ),
                        );
                      }))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Increase volume by 10',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: Text('เพิ่มงานที่ทำ'),
                        content: Text('add'),
                      ));
              // setState(() {
              //   listLastTime.add(LastTime(DateTime.now(), 'ซักผ้า', 'Home'));
              // });
            },
          ),
        ));
  }
}
