import 'package:exam_mid/models/last_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailLastTimePage extends StatelessWidget {
  final LastTime lastTime;
  DetailLastTimePage(this.lastTime);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lastTime.title),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Text('หมวดหมู่  :'),
                  SizedBox(
                    width: 40,
                  ),
                  Text(lastTime.mode)
                ],
              ),
              Row(
                children: [
                  Text('วันที่  :'),
                  SizedBox(
                    width: 40,
                  ),
                  Text(DateFormat('dd/MM/yyyy')
                      .format(lastTime.time)
                      .toString()),
                ],
              ),
              Row(
                children: [
                  Text('เวลา :'),
                  SizedBox(
                    width: 40,
                  ),
                  Text(lastTime.time.toString().substring(10, 16))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
