import 'package:chat/iconfont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formUserKey = GlobalKey<FormState>();
    final formPhoneKey = GlobalKey<FormState>();
    final formEmailKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => {}),
        title: const Text("登录"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            TabBar(
                indicator: const BoxDecoration(),
                labelColor: const Color(0xFF035DFF),
                labelStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                tabs: controller.tabList,
                controller: controller.tabController),
            Expanded(
                child:
                    TabBarView(controller: controller.tabController, children: [
              Form(
                  key: formUserKey,
                  child: Column(
                    //用户名  密码
                    children: [
                      TextFormField(
                        controller: controller.textUserNameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconfont.yonghuming),
                          labelText: "用户名",
                        ),
                      ),
                      Obx(
                        () => TextFormField(
                            controller: controller.textPassWordController,
                            validator: (value) {
                              RegExp reg = new RegExp(
                                  r"(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$");
                              if (value!.isEmpty) {
                                return '密码不能为空!';
                              }
                              if (!reg.hasMatch(value)) {
                                return '密码必须为6~16位数字和字符组合';
                              }
                              return null;
                            },
                            obscureText: controller.passwordIsVisible.value,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Iconfont.mima),
                                labelText: "密码",
                                suffixIcon: IconButton(
                                    onPressed: () => {
                                          controller.updatePasswordIsVisible(
                                              controller
                                                  .passwordIsVisible.value)
                                        },
                                    icon: controller.passwordIsVisible.value ==
                                            true
                                        ? const Icon(
                                            Iconfont.a241yincangbukejian)
                                        : const Icon(
                                            Iconfont.a240xianshikejian)))),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => {
                                  if (formUserKey.currentState!.validate())
                                    {controller.submit()}
                                },
                            child: Text("登录")),
                      )
                    ],
                  )),
              Form(
                key: formPhoneKey,
                child:
                    //手机号
                    Column(
                  children: [
                    TextFormField(
                      controller: controller.phoneController,
                      validator: (value) {
                        RegExp reg = new RegExp(r"1[0-9]\d{9}$");
                        if (value!.isEmpty) {
                          return '手机号不能为空!';
                        }
                        if (!reg.hasMatch(value)) {
                          return '请输入合法手机号码!';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        prefixText: "+ 86",
                        labelText: "手机号",
                      ),
                    ),
                    TextFormField(
                      controller: controller.phoneVerifyCodeController,
                      validator: (value) {
                        RegExp reg = new RegExp(r"\d{6}$");
                        if (value!.isEmpty) {
                          return '验证码不能为空!';
                        }
                        if (!reg.hasMatch(value)) {
                          return '请输入6位数字验证码!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "验证码",
                          suffix: ElevatedButton(
                              onPressed: () =>
                                  {controller.sendPhoneVerifyCode()},
                              child: Text("获取验证码"))),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => {
                                if (formPhoneKey.currentState!.validate())
                                  {controller.submit()}
                              },
                          child: Text("登录")),
                    )
                  ],
                ),
              ),
              Form(
                key: formEmailKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.emailController,
                      validator: (value) {
                        RegExp reg = new RegExp(
                            r"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$");
                        if (value!.isEmpty) {
                          return '邮箱不能为空!';
                        }
                        if (!reg.hasMatch(value)) {
                          return '请输入合法邮箱!';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: "邮箱"),
                    ),
                    TextFormField(
                      controller: controller.emailVerifyCodeController,
                      validator: (value) {
                        RegExp reg = new RegExp(r"\d{6}$");
                        if (value!.isEmpty) {
                          return '验证码不能为空!';
                        }
                        if (!reg.hasMatch(value)) {
                          return '请输入6位数字验证码!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "验证码",
                          suffix: ElevatedButton(
                              onPressed: () =>
                                  {controller.sendPhoneVerifyCode()},
                              child: Text("获取验证码"))),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => {
                                if (formEmailKey.currentState!.validate())
                                  {controller.submit()}
                              },
                          child: Text("登录")),
                    )
                  ],
                ),
              )
              //邮箱
            ]))
          ],
        ),
      ),
    );
  }
}
