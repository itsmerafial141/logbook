import 'dart:convert';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/edit_aktivitases/edit_aktivitas_model.dart';

class EditAktivitasProvider extends GetConnect {
  final url = "https://logbook-4b79b-default-rtdb.firebaseio.com/";

  Future<EditAktivitas> updateAktivitas(
    String id,
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
    final response = await put(url + "logs/$id.json", body);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return editAktivitasFromJson(response.bodyString.toString());
    }
  }

  Future<EditAktivitas> showEditAktivitas(String id) async {
    final response = await get(url + "/logs/$id.json");
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return editAktivitasFromJson(response.bodyString.toString());
    }
  }
}
