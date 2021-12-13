import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chat_controller.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("聊天"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => {Get.toNamed("/chat/word")},
                  child: Text("文字聊天")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => {Get.toNamed("/chat/voice")},
                  child: Text("语音聊天")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => {Get.toNamed("/chat/vedio")},
                  child: Text("视频聊天")),
            )
          ],
        ),
      ),
    );
  }
}
