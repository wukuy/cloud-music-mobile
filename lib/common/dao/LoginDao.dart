import 'package:cloud_music_mobile/common/Http.dart';
import 'package:cloud_music_mobile/models/UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginDao {
  /// 获取歌曲
  static logoin(params) async {
    var result = await Http().get('/login/cellphone', data: params);
    
    if(result != null) {
      var data = result.data;
      int uid = data['account']['id'];
      String backgroundUrl = data['profile']['backgroundUrl'];
      String avatarUrl = data['profile']['avatarUrl'];
      String nickname = data['profile']['nickname'];
      
      UserInfo userInfo = UserInfo.fromJson({"nickname": nickname, "uid": uid, "backgroundUrl": backgroundUrl, "avatarUrl": avatarUrl});

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userInfo", userInfo.toJson().toString());

      return userInfo;
    }
  }
}
