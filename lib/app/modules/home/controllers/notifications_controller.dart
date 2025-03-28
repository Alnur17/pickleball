import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../../common/widgets/custom_snackbar.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../model/notification_model.dart';

class NotificationsController extends GetxController {
  final isLoading = false.obs;
  final notificationList = <Datum>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllMyNotification();
  }

  Future getAllMyNotification() async {
    try {
      isLoading(true);
      String token = LocalStorage.getData(key: AppConstant.accessToken);

      var headers = {
        'Authorization': token,
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.notifications, headers: headers),
      );

      if (responseBody['success'] = true) {
        String message = responseBody['message'].toString();
        NotificationModel notificationModel =
            NotificationModel.fromJson(responseBody);
        notificationList.value = notificationModel.data;

        kSnackBar(message: message, bgColor: AppColors.green);

        isLoading(false);
      } else {
        throw 'notification in Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
    } finally {
      isLoading(false);
    }
  }
}
