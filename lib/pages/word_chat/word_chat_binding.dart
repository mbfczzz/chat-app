import 'package:get/get.dart';
import 'word_chat_controller.dart';

class WordChatBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<WordChatController>(() => WordChatController());
    }
}
