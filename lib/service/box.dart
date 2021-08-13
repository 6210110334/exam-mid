import 'package:exam_mid/models/last_time.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<LastTime> getLastTime() => Hive.box<LastTime>('lastTime');
}
