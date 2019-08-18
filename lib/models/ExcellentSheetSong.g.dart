// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExcellentSheetSong.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExcellentSheetSong _$ExcellentSheetSongFromJson(Map<String, dynamic> json) {
  return ExcellentSheetSong(
    (json['playlists'] as List)
        ?.map((e) =>
            e == null ? null : Playlists.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['code'] as int,
    json['more'] as bool,
    json['lasttime'] as int,
    json['total'] as int,
  );
}

Map<String, dynamic> _$ExcellentSheetSongToJson(ExcellentSheetSong instance) =>
    <String, dynamic>{
      'playlists': instance.playlists,
      'code': instance.code,
      'more': instance.more,
      'lasttime': instance.lasttime,
      'total': instance.total,
    };

Playlists _$PlaylistsFromJson(Map<String, dynamic> json) {
  return Playlists(
    json['name'] as String,
    json['id'] as int,
    json['trackNumberUpdateTime'] as int,
    json['status'] as int,
    json['userId'] as int,
    json['createTime'] as int,
    json['updateTime'] as int,
    json['subscribedCount'] as int,
    json['trackCount'] as int,
    json['cloudTrackCount'] as int,
    json['coverImgUrl'] as String,
    json['coverImgId'] as int,
    json['description'] as String,
    (json['tags'] as List)?.map((e) => e as String)?.toList(),
    json['playCount'] as int,
    json['trackUpdateTime'] as int,
    json['specialType'] as int,
    json['totalDuration'] as int,
    json['creator'] == null
        ? null
        : Creator.fromJson(json['creator'] as Map<String, dynamic>),
    (json['subscribers'] as List)
        ?.map((e) =>
            e == null ? null : Subscribers.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['subscribed'] as bool,
    json['commentThreadId'] as String,
    json['newImported'] as bool,
    json['adType'] as int,
    json['highQuality'] as bool,
    json['privacy'] as int,
    json['ordered'] as bool,
    json['anonimous'] as bool,
    json['coverStatus'] as int,
    json['shareCount'] as int,
    json['coverImgId_str'] as String,
    json['commentCount'] as int,
    json['copywriter'] as String,
    json['tag'] as String,
  );
}

Map<String, dynamic> _$PlaylistsToJson(Playlists instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'trackNumberUpdateTime': instance.trackNumberUpdateTime,
      'status': instance.status,
      'userId': instance.userId,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'subscribedCount': instance.subscribedCount,
      'trackCount': instance.trackCount,
      'cloudTrackCount': instance.cloudTrackCount,
      'coverImgUrl': instance.coverImgUrl,
      'coverImgId': instance.coverImgId,
      'description': instance.description,
      'tags': instance.tags,
      'playCount': instance.playCount,
      'trackUpdateTime': instance.trackUpdateTime,
      'specialType': instance.specialType,
      'totalDuration': instance.totalDuration,
      'creator': instance.creator,
      'subscribers': instance.subscribers,
      'subscribed': instance.subscribed,
      'commentThreadId': instance.commentThreadId,
      'newImported': instance.newImported,
      'adType': instance.adType,
      'highQuality': instance.highQuality,
      'privacy': instance.privacy,
      'ordered': instance.ordered,
      'anonimous': instance.anonimous,
      'coverStatus': instance.coverStatus,
      'shareCount': instance.shareCount,
      'coverImgId_str': instance.coverImgIdStr,
      'commentCount': instance.commentCount,
      'copywriter': instance.copywriter,
      'tag': instance.tag,
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
    (json['expertTags'] as List)?.map((e) => e as String)?.toList(),
    json['djStatus'] as int,
    json['vipType'] as int,
    json['backgroundImgIdStr'] as String,
    json['avatarImgIdStr'] as String,
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
      'expertTags': instance.expertTags,
      'djStatus': instance.djStatus,
      'vipType': instance.vipType,
      'backgroundImgIdStr': instance.backgroundImgIdStr,
      'avatarImgIdStr': instance.avatarImgIdStr,
    };

Subscribers _$SubscribersFromJson(Map<String, dynamic> json) {
  return Subscribers(
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
    json['backgroundImgIdStr'] as String,
    json['avatarImgIdStr'] as String,
  );
}

Map<String, dynamic> _$SubscribersToJson(Subscribers instance) =>
    <String, dynamic>{
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
      'backgroundImgIdStr': instance.backgroundImgIdStr,
      'avatarImgIdStr': instance.avatarImgIdStr,
    };
