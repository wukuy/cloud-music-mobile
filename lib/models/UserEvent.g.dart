// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserEvent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEvent _$UserEventFromJson(Map<String, dynamic> json) {
  return UserEvent(
    json['code'] as int,
    json['more'] as bool,
    (json['event'] as List)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['lasttime'] as int,
  );
}

Map<String, dynamic> _$UserEventToJson(UserEvent instance) => <String, dynamic>{
      'code': instance.code,
      'more': instance.more,
      'event': instance.event,
      'lasttime': instance.lasttime,
    };

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    json['forwardCount'] as int,
    json['rcmdInfo'] == null
        ? null
        : RcmdInfo.fromJson(json['rcmdInfo'] as Map<String, dynamic>),
    json['json'] as String,
    json['pics'] as List,
    json['showTime'] as int,
    json['tmplId'] as int,
    json['actId'] as int,
    json['eventTime'] as int,
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['expireTime'] as int,
    json['id'] as int,
    json['type'] as int,
    json['topEvent'] as bool,
    json['insiteForwardCount'] as int,
    json['info'] == null
        ? null
        : Info.fromJson(json['info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'forwardCount': instance.forwardCount,
      'rcmdInfo': instance.rcmdInfo,
      'json': instance.json,
      'pics': instance.pics,
      'showTime': instance.showTime,
      'tmplId': instance.tmplId,
      'actId': instance.actId,
      'eventTime': instance.eventTime,
      'user': instance.user,
      'expireTime': instance.expireTime,
      'id': instance.id,
      'type': instance.type,
      'topEvent': instance.topEvent,
      'insiteForwardCount': instance.insiteForwardCount,
      'info': instance.info,
    };

RcmdInfo _$RcmdInfoFromJson(Map<String, dynamic> json) {
  return RcmdInfo(
    json['reason'] as String,
    json['alg'] as String,
    json['type'] as int,
    json['scene'] as String,
    json['userReason'] as String,
  );
}

Map<String, dynamic> _$RcmdInfoToJson(RcmdInfo instance) => <String, dynamic>{
      'reason': instance.reason,
      'alg': instance.alg,
      'type': instance.type,
      'scene': instance.scene,
      'userReason': instance.userReason,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
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
    json['urlAnalyze'] as bool,
    json['followeds'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
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
      'urlAnalyze': instance.urlAnalyze,
      'followeds': instance.followeds,
    };

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(
    json['commentThread'] == null
        ? null
        : CommentThread.fromJson(json['commentThread'] as Map<String, dynamic>),
    json['liked'] as bool,
    json['resourceType'] as int,
    json['resourceId'] as int,
    json['commentCount'] as int,
    json['likedCount'] as int,
    json['shareCount'] as int,
    json['threadId'] as String,
  );
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'commentThread': instance.commentThread,
      'liked': instance.liked,
      'resourceType': instance.resourceType,
      'resourceId': instance.resourceId,
      'commentCount': instance.commentCount,
      'likedCount': instance.likedCount,
      'shareCount': instance.shareCount,
      'threadId': instance.threadId,
    };

CommentThread _$CommentThreadFromJson(Map<String, dynamic> json) {
  return CommentThread(
    json['id'] as String,
    json['resourceType'] as int,
    json['commentCount'] as int,
    json['likedCount'] as int,
    json['shareCount'] as int,
    json['hotCount'] as int,
    (json['latestLikedUsers'] as List)
        ?.map((e) => e == null
            ? null
            : LatestLikedUsers.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['resourceId'] as int,
    json['resourceOwnerId'] as int,
  );
}

Map<String, dynamic> _$CommentThreadToJson(CommentThread instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resourceType': instance.resourceType,
      'commentCount': instance.commentCount,
      'likedCount': instance.likedCount,
      'shareCount': instance.shareCount,
      'hotCount': instance.hotCount,
      'latestLikedUsers': instance.latestLikedUsers,
      'resourceId': instance.resourceId,
      'resourceOwnerId': instance.resourceOwnerId,
    };

LatestLikedUsers _$LatestLikedUsersFromJson(Map<String, dynamic> json) {
  return LatestLikedUsers(
    json['s'] as int,
    json['t'] as int,
  );
}

Map<String, dynamic> _$LatestLikedUsersToJson(LatestLikedUsers instance) =>
    <String, dynamic>{
      's': instance.s,
      't': instance.t,
    };
