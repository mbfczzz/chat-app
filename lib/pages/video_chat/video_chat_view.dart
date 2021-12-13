import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'video_chat_controller.dart';

class VideoChatPage extends GetView<VideoChatController> {
  const VideoChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("视频聊天"),
        ),
      ),
    );
  }
}
