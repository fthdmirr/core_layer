import 'package:hive_flutter/hive_flutter.dart';

abstract class IHive<T> {
  void registerAdapters<T>(int typeID,TypeAdapter<T> typeAdapter);
}
