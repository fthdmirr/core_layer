part of '../init/services/service_manager.dart';

extension ServiceUrlExtension on ServiceHttpsEnum {
  get getURL {
    switch (this) {
      case ServiceHttpsEnum.postsJsonplaceholder:
        return Uri.https('jsonplaceholder.typicode.com', '/posts');
      default:
    }
  }

   parseURL({Object? id}) {
    switch (this) {
      case ServiceHttpsEnum.postsJsonplaceholder:
        return Uri.parse('https://jsonplaceholder.typicode.com/posts/${id ?? ''}');
      default:
    }
  }
}


extension on ServiceManager{
  R parseData<R, T extends BaseModel>(List data) {
  final T _model = data[0];
  final String _responseBody = data[1];
  final parsed = jsonDecode(_responseBody);

  if (parsed is Map<String, dynamic>) {
    return _model.fromJson(parsed) as R;
  } else if (parsed is List<dynamic>) {
    return parsed.map((e) => _model.fromJson(e)).toList().cast<T>() as R;
  } else {
    return parsed;
  }
}
}