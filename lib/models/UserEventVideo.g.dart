// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserEventVideo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEventVideo _$UserEventVideoFromJson(Map<String, dynamic> json) {
  return UserEventVideo(
    json['msg'] as String,
    json['video'] == null
        ? null
        : Video.fromJson(json['video'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserEventVideoToJson(UserEventVideo instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'video': instance.video,
    };

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video(
    json['vid'] as int,
    json['coverUrl'] as String,
    json['duration'] as int,
    json['playTime'] as int,
    json['height'] as int,
    json['width'] as int,
    json['size'] as int,
    json['state'] as int,
    json['coverType'] as int,
    json['videoId'] as String,
    json['title'] as String,
    json['creator'] == null
        ? null
        : Creator.fromJson(json['creator'] as Map<String, dynamic>),
    json['videoStatus'] as int,
    (json['resolutions'] as List)
        ?.map((e) =>
            e == null ? null : Resolutions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['durationms'] as int,
  );
}

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'vid': instance.vid,
      'coverUrl': instance.coverUrl,
      'duration': instance.duration,
      'playTime': instance.playTime,
      'height': instance.height,
      'width': instance.width,
      'size': instance.size,
      'state': instance.state,
      'coverType': instance.coverType,
      'videoId': instance.videoId,
      'title': instance.title,
      'creator': instance.creator,
      'videoStatus': instance.videoStatus,
      'resolutions': instance.resolutions,
      'durationms': instance.durationms,
    };

Creator _$CreatorFromJson(Map<String, dynamic> json) {
  return Creator(
    json['defaultAvatar'] as bool,
    json['province'] as int,
    json['authStatus'] as int,
    json['followed'] as bool,
    json['avatarUrl'] as String,
    json['accountStatus'] as int,
    json['gender'] as int,
    json['city'] as int,
    json['birthday'] as int,
    json['userId'] as int,
    json['userType'] as int,
    json['nickname'] as String,
    json['signature'] as String,
    json['description'] as String,
    json['detailDescription'] as String,
    json['avatarImgId'] as int,
    json['backgroundImgId'] as int,
    json['backgroundUrl'] as String,
    json['authority'] as int,
    json['mutual'] as bool,
    json['djStatus'] as int,
    json['vipType'] as int,
    json['avatarImgIdStr'] as String,
    json['backgroundImgIdStr'] as String,
  );
}

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
      'defaultAvatar': instance.defaultAvatar,
      'province': instance.province,
      'authStatus': instance.authStatus,
      'followed': instance.followed,
      'avatarUrl': instance.avatarUrl,
      'accountStatus': instance.accountStatus,
      'gender': instance.gender,
      'city': instance.city,
      'birthday': instance.birthday,
      'userId': instance.userId,
      'userType': instance.userType,
      'nickname': instance.nickname,
      'signature': instance.signature,
      'description': instance.description,
      'detailDescription': instance.detailDescription,
      'avatarImgId': instance.avatarImgId,
      'backgroundImgId': instance.backgroundImgId,
      'backgroundUrl': instance.backgroundUrl,
      'authority': instance.authority,
      'mutual': instance.mutual,
      'djStatus': instance.djStatus,
      'vipType': instance.vipType,
      'avatarImgIdStr': instance.avatarImgIdStr,
      'backgroundImgIdStr': instance.backgroundImgIdStr,
    };

Resolutions _$ResolutionsFromJson(Map<String, dynamic> json) {
  return Resolutions(
    json['resolution'] as int,
    json['size'] as int,
  );
}

Map<String, dynamic> _$ResolutionsToJson(Resolutions instance) =>
    <String, dynamic>{
      'resolution': instance.resolution,
      'size': instance.size,
    };
