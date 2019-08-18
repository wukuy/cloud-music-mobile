import 'package:cloud_music_mobile/common/Http.dart';
import 'package:cloud_music_mobile/models/UserEvent.dart';

class FirendDao {
  static userEvent(Map<String, dynamic> data) async {
    var result = await Http(loading: false).get('/event', data: data);
    if (result != null) {
      return UserEvent.fromJson(result);
    }
  }
}
