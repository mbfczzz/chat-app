import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'word_chat_controller.dart';

class WordChatPage extends GetView<WordChatController> {
  const WordChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("文字聊天"),
        ),
      ),
    );
  }
}
