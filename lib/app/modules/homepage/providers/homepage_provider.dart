import 'package:get/get.dart';

import '../homepage_model.dart';

class HomepageProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Homepage.fromJson(map);
      if (map is List) {
        return map.map((item) => Homepage.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Homepage?> getHomepage(int id) async {
    final response = await get('homepage/$id');
    return response.body;
  }

  Future<Response<Homepage>> postHomepage(Homepage homepage) async =>
      await post('homepage', homepage);
  Future<Response> deleteHomepage(int id) async => await delete('homepage/$id');
}
