import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/homepage_model.dart';
import 'package:table_calendar/table_calendar.dart';
import '../providers/homepage_provider.dart';

class HomepageController extends GetxController
    with StateMixin<List<Homepage>> {
  final listAktivitas = List<Homepage>.empty().obs;
  final listData = List<Homepage>.empty().obs;
  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2030, 12);
  var selectedDay = DateTime.now().obs;
  var statusCheck = false.obs;

  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  void stateAktivitas(Homepage data) {
    statusCheck.value = data.status;
    statusCheck.toggle();
    data.status = statusCheck.value;
    print(data.target.toString() + " = " + data.status.toString());
  }

  void deleteAktivitas(String id) {
    listAktivitas.removeWhere((element) => element.id == id);
    listData.removeWhere((element) => element.id == id);
    change(listData, status: RxStatus.success());
    print("this id = " + id);
    homepageProvider.deleteAktivitas(id);
  }

  String formatedDate(DateTime date) {
    var formatDate = DateFormat("EEEE, d MMMM yyyy", "id_ID");
    return formatDate.format(date);
  }

  void getDataByDate(String date) {
    var data =
        listAktivitas.where((element) => element.tanggal == date).toList();
    listData.value = data;
    change(data, status: RxStatus.success());
  }

  void getDataByStatus(bool status, String date) {
    var data = listAktivitas
        .where((element) => element.status == status && element.tanggal == date)
        .toList();
    listData.value = data;
    change(data, status: RxStatus.success());
  }

  @override
  void onInit() {
    super.onInit();
    showAktivitas();
  }

  HomepageProvider homepageProvider = Get.put(HomepageProvider());

  void showAktivitas() {
    try {
      homepageProvider.showAktivitas().then(
        (response) {
          if (response != null) {
            for (var entry in response.entries) {
              for (var data in entry.value.logs) {
                addToListAktivitas(
                    entry.key,
                    data.isDone,
                    data.target,
                    data.reality,
                    data.category,
                    "subAktivitas",
                    data.time,
                    entry.value.timestamp);
              }
              change(listData, status: RxStatus.success());
            }
            // listData.value = getDataByDate(formatedDate(DateTime.now()));
            getDataByDate(formatedDate(DateTime.now()));
          }
        },
        onError: (err) {
          throw err.toString();
        },
      );
    } catch (err) {
      throw err.toString();
    }
  }

  void addToListAktivitas(String id, bool status, String target, String realita,
      String kategori, String subAktivitas, String waktu, String tanggal) {
    var aktivitas = Homepage(
        id: id,
        status: status,
        target: target,
        realita: realita,
        kategori: kategori,
        subaktivitas: subAktivitas,
        waktu: waktu,
        tanggal: tanggal);
    listAktivitas.add(aktivitas);
    listData.add(aktivitas);
  }
}
