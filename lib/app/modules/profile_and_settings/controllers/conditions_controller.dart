import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../model/conditional_model.dart';

class ConditionsController extends GetxController {
  var isLoading = true.obs;
  var conditionsData = Rxn<Data>(); // Single Data object, nullable
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchConditions();
    super.onInit();
  }

  /// API Call to Fetch Conditions Data using BaseClient
  void fetchConditions() async {
    try {
      isLoading(true);
      String token = LocalStorage.getData(key: AppConstant.accessToken);

      var headers = {
        'Content-Type': "application/json",
        "Authorization": token
      };

      http.Response response = await BaseClient.getRequest(
        api: Api.conditionsPage,
        headers: headers,
      );

      var jsonData = await BaseClient.handleResponse(response);
      ConditionsModel conditions = ConditionsModel.fromJson(jsonData);
      conditionsData.value = conditions.data;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }

  /// Method to get Privacy Policy text
  String getPrivacyPolicy() {
    return conditionsData.value?.privacyPolicy ?? "No Data Available";
  }

  /// Method to get Terms & Conditions text
  String getTermsAndConditions() {
    return conditionsData.value?.termsAndConditions ?? "No Data Available";
  }

  /// Method to get About Us text
  String getAboutUs() {
    return conditionsData.value?.aboutUs ?? "No Data Available";
  }
}