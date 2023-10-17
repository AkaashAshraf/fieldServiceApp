import 'package:field_service_app/config/api_urls.dart';
import 'package:field_service_app/http/http.dart';
import 'package:field_service_app/models/response/notifications_response.dart';
import 'package:field_service_app/models/simple/notification.dart';
import 'package:get/state_manager.dart';

class NotificationsController extends GetxController {
  RxList<Notificationn> notification = <Notificationn>[].obs;
  RxInt totalNotification = 0.obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    fetchNotifications();
    super.onInit();
  } //onInit

  fetchNotifications() async {
    try {
      loading(true);
      var raw = await post(notificationList, {});
      if (raw.statusCode == 200) {
        var response = notificationsFromJson(raw.body);

        totalNotification(response.totalNotifications);
        notification(response.data);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      loading(false);
    }
  }

  markNotificationsAsRead({int id = 0}) async {
    try {
      var raw = await post(notificationMarkAsRead, {"id": id.toString()});
      if (raw.statusCode == 200) {
        var response = notificationsFromJson(raw.body);

        totalNotification(response.totalNotifications);
        notification(response.data);
      }
    } catch (e) {
      print(e.toString());
    } finally {}
  }
}
