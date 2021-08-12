import 'package:flutter/cupertino.dart';

class ListData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListDataState();
}

class ListDataState extends State<ListData> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Text('List'), Image.asset('assets/sky.jpg')],
    );
  }
}
