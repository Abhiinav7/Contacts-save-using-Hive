import 'package:hive/hive.dart';
part 'hive_model.g.dart';
@HiveType(typeId: 0)
class HiveModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String phone;
  HiveModel({required this.phone, required this.name});
}
