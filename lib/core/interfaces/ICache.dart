
abstract class ICache<T> {
  Future<void> initCache();
  Future<void> saveAllData(List<T> datas);
  T? getData(String key);
  List<T>? getAllData<T>();
  Future<void> updateData(String key, T data);
  Future<void> deleteData(String key);
  Future<void> deleteAll();
}
