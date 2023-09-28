import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:project_june1/api%20integration/api%20integration%20using%20dio/model/datamodel.dart';

}

class DataController extends GetxController {
  RxList<DataModel> datas = RxList();
  RxBool isLoading = true.obs;
  RxBool isListatDown = false.obs;
  RxBool isNetConnected = true.obs;

  isInternetConnected() async {
    isNetConnected.value = await InternetConnectionChecker().hasConnection;
  }
}