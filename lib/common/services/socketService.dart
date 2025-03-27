
import 'package:get/get.dart';
import 'package:pickleball/common/app_constant/app_constant.dart';
import 'package:pickleball/common/helper_widget/local_store.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
class SocketService extends GetxService {
  late IO.Socket socket;
  bool isSocketInitialized = false;
  RxBool isLoading = false.obs;
  Map<String, dynamic>? lastMessageResponse;
  Future<void> initializeSocket() async {
    if (isSocketInitialized) return;


    socket = IO.io(
      'http://192.168.10.144:4000',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setAuth({'token': LocalStorage.getData(key: AppConstant.accessToken)})
          .build(),
    );
    socket.connect();
    socket.onConnect((_) async {
      print('Socket connected');

    });
    socket.onDisconnect((_) {
      print('Socket disconnected');
    });
    isSocketInitialized = true;
  }

  @override
  Future<void> onClose() async {
    super.onClose();
    socket.disconnect();
  }
}