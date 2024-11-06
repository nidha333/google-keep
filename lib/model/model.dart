import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class googleKeep {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? note;
  googleKeep({required this.title, required this.note});
}
