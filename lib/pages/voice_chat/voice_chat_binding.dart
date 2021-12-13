import 'package:get/get.dart';
import 'voice_chat_controller.dart';

class VoiceChatBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<VoiceChatController>(() => VoiceChatController());
    }
}
