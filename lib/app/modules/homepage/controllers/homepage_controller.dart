import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/homepage_model.dart';
import '../providers/homepage_provider.dart';

class HomepageController extends GetxController
    with StateMixin<List<Homepage>> {
  final listAktivitas = List<Homepage>.empty().obs;

  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2030, 12);

  var selectedDay = DateTime.now().obs;
  var statusCheck = false.obs;

  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  final localDataAktivitas = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    showAktivitas();
  }

  void showAktivitasLocale() {
    try {
      if (localDataAktivitas.read("localData") != null) {
        var data = localDataAktivitas.read("localData");
        for (var dataLocal in data) {
          var aktivitas = Homepage(
            id: dataLocal["id"],
            status: dataLocal["status"],
            target: dataLocal["target"],
            realita: dataLocal["realita"],
            kategori: dataLocal["kategori"],
            subaktivitas: dataLocal["subaktivitas"],
            waktu: dataLocal["waktu"],
            tanggal: dataLocal["tanggal"],
          );
          print("ID : " + dataLocal["id"]);
          listAktivitas.add(aktivitas);
        }
        var dataLocale = listAktivitas
            .where((element) => element.tanggal == formatedDate(DateTime.now()))
            .toList();
        change(dataLocale, status: RxStatus.success());
        print("ini offline");
      }
    } catch (err) {
      print("ini Error");
      print(err.toString());
    }
  }

  void showAktivitasOnline() {
    try {
      homepageProvider.showAktivitas().then(
        (response) {
          // ignore: unnecessary_null_comparison
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
                  entry.value.timestamp,
                );
              }
              change(listAktivitas, status: RxStatus.success());
            }
            localDataAktivitas.write("localData", listAktivitas);
            getDataByDate(formatedDate(DateTime.now()));
          }
        },
        onError: (err) {
          change(null, status: RxStatus.error(err));
          throw err.toString();
        },
      );
      print("ini online");
    } catch (err) {
      change(null, status: RxStatus.error(err.toString()));
      throw err.toString();
    }
  }

  void stateAktivitas(Homepage data) {
    statusCheck.value = data.status;
    statusCheck.toggle();
    data.status = statusCheck.value;
  }

  void deleteAktivitas(String id) {
    listAktivitas.removeWhere((element) => element.id == id);
    getDataByDate(formatedDate(selectedDay.value));
    homepageProvider.deleteAktivitas(id);
  }

  String formatedDate(DateTime date) {
    var formatDate = DateFormat("EEEE, d MMMM yyyy", "id_ID");
    return formatDate.format(date);
  }

  void getDataByDate(String date) {
    var data =
        listAktivitas.where((element) => element.tanggal == date).toList();
    change(data, status: RxStatus.success());
  }

  void getDataByStatus(bool status, String date) {
    var data = listAktivitas
        .where(
          (element) => element.status == status && element.tanggal == date,
        )
        .toList();
    change(data, status: RxStatus.success());
  }

  HomepageProvider homepageProvider = Get.put(HomepageProvider());

  void showAktivitas() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showAktivitasLocale();
    } else {
      showAktivitasOnline();
    }
  }

  void addToListAktivitas(
    String id,
    bool status,
    String target,
    String realita,
    String kategori,
    String subAktivitas,
    String waktu,
    String tanggal,
  ) {
    var aktivitas = Homepage(
      id: id,
      status: status,
      target: target,
      realita: realita,
      kategori: kategori,
      subaktivitas: subAktivitas,
      waktu: waktu,
      tanggal: tanggal,
    );
    listAktivitas.add(aktivitas);
  }

  Future<bool> isThereAnInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
