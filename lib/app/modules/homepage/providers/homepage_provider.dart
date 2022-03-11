import 'dart:convert';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/aktivitas_response.dart';

class HomepageProvider extends GetConnect {
  final url = "https://logbook-4b79b-default-rtdb.firebaseio.com/";

  Future saveAktivitas(
    String timestamp,
    String target,
    String category,
    String reality,
    String time,
  ) async {
    final body = json.encode({
      "timestamp": timestamp,
      "logs": [
        {
          "target": target,
          "category": category,
          "reality": reality,
          "time": time,
          "note": "Write something here",
          "is_done": false
        }
      ]
    });
    await post(url + "/logs.json", body);
  }
  // Future updateAktivitas(
  //   String timestamp,
  //   String target,
  //   String category,
  //   String reality,
  //   String time,
  // ) async {
  //   final body = json.encode({
  //     "timestamp": timestamp,
  //     "logs": [
  //       {
  //         "target": target,
  //         "category": category,
  //         "reality": reality,
  //         "time": time,
  //         "note": "Write something here",
  //         "is_done": false
  //       }
  //     ]
  //   });
  //   await put(url + "/logs.json", body);
  // }

  Future<Map<String, AktivitasResponse>> showAktivitas() async {
    final response = await get(url + "/logs.json");
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.bodyString.toString() != "null") {
        return aktivitasResponseFromJson(response.bodyString.toString());
      } else {
        return {};
      }
    }
  }

  Future<String> deleteAktivitas(String id) async {
    final response = await delete(url + "/logs/" + id + ".json");
    if (response.status.hasError) {
      return "Terjadi kedalahan!";
    } else {
      if (response.bodyString.toString() != "null") {
        return "Data telah musnah!";
      } else {
        return "Gagal hapus data!";
      }
    }
  }
}
