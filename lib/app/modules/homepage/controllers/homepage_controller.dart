import 'package:get/get.dart';

class HomepageController extends GetxController with StateMixin{
  var isCalenderDropdown = true.obs;

  DateTime selectedDate = DateTime.now();
  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2022, 12);
}
