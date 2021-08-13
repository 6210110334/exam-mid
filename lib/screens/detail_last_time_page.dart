import 'package:exam_mid/models/last_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailLastTimePage extends StatelessWidget {
  final LastTime lastTime;
  DetailLastTimePage(this.lastTime);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lastTime.title),
      ),
    );
  }
}
