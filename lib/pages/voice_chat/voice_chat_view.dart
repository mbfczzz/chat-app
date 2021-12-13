import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'voice_chat_controller.dart';

class VoiceChatPage extends GetView<VoiceChatController> {
  const VoiceChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("语音聊天"),
        ),
      ),
    );
  }
}
