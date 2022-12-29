import "package:get_storage/get_storage.dart";

class Storage {
  static Storage instance = Storage._();

  final GetStorage _storage = GetStorage("local_storage");

  Storage._();

  Future<void> save(String key, dynamic data) {
    return _storage.write(key, data);
  }

  Future<bool> init() {
    return _storage.initStorage;
  }

  T? get<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> remove(String key) {
    return _storage.remove(key);
  }
}
