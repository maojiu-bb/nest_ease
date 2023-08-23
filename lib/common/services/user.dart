import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  // 是否登录
  // final _isLogin = false.obs;

  // 初始化
  Future<UserService> init() async {
    return this;
  }
}
