import 'package:hive/hive.dart';

part 'last_time.g.dart';

@HiveType(typeId: 0)
class LastTime extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late DateTime time;

  @HiveField(2)
  late String mode;
}
