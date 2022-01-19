
import 'package:core_layer/core/interfaces/ICache.dart';

 class SQLite implements ICache{
  @override
  Future<void> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<void> deleteData(String key) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  List<T>? getAllData<T>() {
    // TODO: implement getAllData
    throw UnimplementedError();
  }

  @override
  getData(String key) {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<void> initCache() {
    // TODO: implement initCache
    throw UnimplementedError();
  }

  @override
  Future<void> saveAllData(List datas) {
    // TODO: implement saveAllData
    throw UnimplementedError();
  }

  @override
  Future<void> updateData(String key, data) {
    // TODO: implement updateData
    throw UnimplementedError();
  }


} 