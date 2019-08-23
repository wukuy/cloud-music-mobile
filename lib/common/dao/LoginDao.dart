import 'package:cloud_music_mobile/common/Http.dart';
import 'package:cloud_music_mobile/models/UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginDao {
  /// 登录
  static logoin(Map<String, dynamic> params) async {
    Http http = Http();
    var data = await http.get('/login/cellphone', data: params);

    if (data != null) {
      int uid = data['account']['id'];
      String backgroundUrl = data['profile']['backgroundUrl'];
      String avatarUrl = data['profile']['avatarUrl'];
      String nickname = data['profile']['nickname'];
      Http.cookie = http.response.headers['set-cookie'].join(';');
      print(http.response.headers['set-cookie'].join(';'));
      Map<String, dynamic> userInfoMap = {
        "nickname": nickname,
        "uid": uid,
        "backgroundUrl": backgroundUrl,
        "avatarUrl": avatarUrl
      };
      UserInfo userInfo = UserInfo.fromJson(userInfoMap);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userInfo", jsonEncode(userInfoMap));

      return userInfo;
    }
  }
}
