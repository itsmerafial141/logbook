import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomepageController extends GetxController with StateMixin {
  var isCalenderDropdown = true.obs;

  DateTime selectedDate = DateTime.now();
  // String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

  DateTime parseDateStr(String inputString) {
    DateFormat format = DateFormat.yMMMMd();
    return format.parse(inputString);
  }

  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2022, 12);
}
