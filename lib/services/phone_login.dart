import 'package:chat/pages/Login/login_model.dart';
import 'package:chat/services/login_way.dart';

class PhoneLogin extends LoginWay {
  @override
  void login(User user) {
    print("手机号登录!");
  }
}
