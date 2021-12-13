import 'package:chat/pages/Login/login_model.dart';
import 'package:chat/services/login_way.dart';

class UserLogin extends LoginWay {
  @override
  void login(User user) {
    print("用户名密码登录!");
  }
}
