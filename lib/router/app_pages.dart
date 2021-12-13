// app_pages.dart
import 'package:chat/pages/Login/login_binding.dart';
import 'package:chat/pages/Login/login_view.dart';
import 'package:chat/pages/chat/chat_binding.dart';
import 'package:chat/pages/chat/chat_view.dart';
import 'package:chat/pages/video_chat/video_chat_binding.dart';
import 'package:chat/pages/video_chat/video_chat_view.dart';
import 'package:chat/pages/voice_chat/voice_chat_view.dart';
import 'package:chat/pages/word_chat/word_chat_binding.dart';
import 'package:chat/pages/word_chat/word_chat_view.dart';
import 'package:chat/router/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => const ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.wordChat,
      page: () => const WordChatPage(),
      binding: WordChatBinding(),
    ),
    GetPage(
      name: AppRoutes.voiceChat,
      page: () => const VoiceChatPage(),
      binding: WordChatBinding(),
    ),
    GetPage(
      name: AppRoutes.vedioChat,
      page: () => const VideoChatPage(),
      binding: VideoChatBinding(),
    ),
  ];
}
