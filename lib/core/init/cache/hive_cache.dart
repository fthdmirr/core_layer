import 'package:core_layer/core/interfaces/ICache.dart';
import 'package:core_layer/core/interfaces/IHive.dart';
import 'package:core_layer/core/models/base_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveCache<T extends BaseModel> implements ICache<T>, IHive<T> {
  HiveCache(this.key);

  Box<T>? _box;
  final String key;

  @override
  Future<void> initCache() async {
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  @override
  Future<void> saveAllData(List<T> datas) async {
    await _box?.addAll(datas);
  }

  @override
  Future<void> updateData(String key, T data) async {
    await _box?.put(key, data);
  }

  @override
  T? getData(String key) {
    return _box?.get(key);
  }

  @override
  List<T>? getAllData<T>() {
    return _box?.values.toList().cast<T>();
  }

  @override
  Future<void> deleteData(String key) async {
    await _box?.delete(key);
  }

  @override
  Future<void> deleteAll() async {
    await _box?.clear();
  }

  @override
  void registerAdapters<T>(int typeID, TypeAdapter<T> typeAdapter) {
    if (!Hive.isAdapterRegistered(typeID)) {
      Hive.registerAdapter<T>(typeAdapter);
    }
  }
}
