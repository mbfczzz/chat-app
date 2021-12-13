import 'package:chat/pages/Login/login_model.dart';
import 'package:chat/services/login_type_enum.dart';
import 'package:chat/services/login_way.dart';
import 'package:chat/services/user_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //用户名控制器
  TextEditingController? textUserNameController;
  //密码控制器
  TextEditingController? textPassWordController;
  //手机号控制器
  TextEditingController? phoneController;
  //手机验证码控制器
  TextEditingController? phoneVerifyCodeController;
  //手机号控制器
  TextEditingController? emailController;
  //手机验证码控制器
  TextEditingController? emailVerifyCodeController;
  //登录类型 0是用户名密码登录,1是手机号登录,2是邮箱登录
  int? loginType = LoginTypeEnum.user;
  //tab默认数组
  List<Widget> tabList = const [
    Tab(
      text: "用户名",
    ),
    Tab(
      text: "手机号",
    ),
    Tab(
      text: "邮箱",
    )
  ];
  TabController? tabController;

  //true密码不可见
  final passwordIsVisible = true.obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    //初始化控制器
    textUserNameController = TextEditingController();
    textPassWordController = TextEditingController();
    phoneController = TextEditingController();
    phoneVerifyCodeController = TextEditingController();
    emailController = TextEditingController();
    emailVerifyCodeController = TextEditingController();
    tabController = TabController(length: 3, vsync: this);
    tabController!.addListener(() {
      loginType = tabController!.index;
    });
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;

  //发送手机验证码
  void sendPhoneVerifyCode() {
    print("发送手机验证码!");
  }

  //发送邮箱验证码
  void sendEmailVerifyCode() {
    print("发送邮箱验证码!");
  }

  //更新密码是否可见
  void updatePasswordIsVisible(bool value) {
    this.passwordIsVisible.value = !value;
  }

  //登录提交
  void submit() {
    User user = User(
        username: textUserNameController!.text,
        password: textPassWordController!.text,
        phone: phoneController!.text,
        code: loginType == LoginTypeEnum.phone
            ? phoneVerifyCodeController!.text
            : emailVerifyCodeController!.text,
        email: emailController!.text);
    UserLogin().login(user);
    if (user.username == "admin" && user.password == "a123456") {
      Get.toNamed("/chat");
    }
  }
}
