import 'package:json_annotation/json_annotation.dart';

part 'UserEvent.g.dart';

@JsonSerializable()
class UserEvent extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'more')
  bool more;

  @JsonKey(name: 'event')
  List<Event> event;

  @JsonKey(name: 'lasttime')
  int lasttime;

  UserEvent(
    this.code,
    this.more,
    this.event,
    this.lasttime,
  );

  factory UserEvent.fromJson(Map<String, dynamic> srcJson) =>
      _$UserEventFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserEventToJson(this);
}

@JsonSerializable()
class Event extends Object {
  @JsonKey(name: 'forwardCount')
  int forwardCount;

  @JsonKey(name: 'rcmdInfo')
  RcmdInfo rcmdInfo;

  @JsonKey(name: 'json')
  String json;

  @JsonKey(name: 'pics')
  List<dynamic> pics;

  @JsonKey(name: 'showTime')
  int showTime;

  @JsonKey(name: 'tmplId')
  int tmplId;

  @JsonKey(name: 'actId')
  int actId;

  @JsonKey(name: 'eventTime')
  int eventTime;

  @JsonKey(name: 'user')
  User user;

  @JsonKey(name: 'expireTime')
  int expireTime;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'topEvent')
  bool topEvent;

  @JsonKey(name: 'insiteForwardCount')
  int insiteForwardCount;

  @JsonKey(name: 'info')
  Info info;

  Event(
    this.forwardCount,
    this.rcmdInfo,
    this.json,
    this.pics,
    this.showTime,
    this.tmplId,
    this.actId,
    this.eventTime,
    this.user,
    this.expireTime,
    this.id,
    this.type,
    this.topEvent,
    this.insiteForwardCount,
    this.info,
  );

  factory Event.fromJson(Map<String, dynamic> srcJson) =>
      _$EventFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class RcmdInfo extends Object {
  @JsonKey(name: 'reason')
  String reason;

  @JsonKey(name: 'alg')
  String alg;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'scene')
  String scene;

  @JsonKey(name: 'userReason')
  String userReason;

  RcmdInfo(
    this.reason,
    this.alg,
    this.type,
    this.scene,
    this.userReason,
  );

  factory RcmdInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$RcmdInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RcmdInfoToJson(this);
}

@JsonSerializable()
class User extends Object {
  @JsonKey(name: 'defaultAvatar')
  bool defaultAvatar;

  @JsonKey(name: 'province')
  int province;

  @JsonKey(name: 'authStatus')
  int authStatus;

  @JsonKey(name: 'followed')
  bool followed;

  @JsonKey(name: 'avatarUrl')
  String avatarUrl;

  @JsonKey(name: 'accountStatus')
  int accountStatus;

  @JsonKey(name: 'gender')
  int gender;

  @JsonKey(name: 'city')
  int city;

  @JsonKey(name: 'birthday')
  int birthday;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'userType')
  int userType;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'signature')
  String signature;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'detailDescription')
  String detailDescription;

  @JsonKey(name: 'avatarImgId')
  int avatarImgId;

  @JsonKey(name: 'backgroundImgId')
  int backgroundImgId;

  @JsonKey(name: 'backgroundUrl')
  String backgroundUrl;

  @JsonKey(name: 'authority')
  int authority;

  @JsonKey(name: 'mutual')
  bool mutual;

  @JsonKey(name: 'djStatus')
  int djStatus;

  @JsonKey(name: 'vipType')
  int vipType;

  @JsonKey(name: 'backgroundImgIdStr')
  String backgroundImgIdStr;

  @JsonKey(name: 'avatarImgIdStr')
  String avatarImgIdStr;

  @JsonKey(name: 'urlAnalyze')
  bool urlAnalyze;

  @JsonKey(name: 'followeds')
  int followeds;

  User(
    this.defaultAvatar,
    this.province,
    this.authStatus,
    this.followed,
    this.avatarUrl,
    this.accountStatus,
    this.gender,
    this.city,
    this.birthday,
    this.userId,
    this.userType,
    this.nickname,
    this.signature,
    this.description,
    this.detailDescription,
    this.avatarImgId,
    this.backgroundImgId,
    this.backgroundUrl,
    this.authority,
    this.mutual,
    this.djStatus,
    this.vipType,
    this.backgroundImgIdStr,
    this.avatarImgIdStr,
    this.urlAnalyze,
    this.followeds,
  );

  factory User.fromJson(Map<String, dynamic> srcJson) =>
      _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Info extends Object {
  @JsonKey(name: 'commentThread')
  CommentThread commentThread;

  @JsonKey(name: 'liked')
  bool liked;

  @JsonKey(name: 'resourceType')
  int resourceType;

  @JsonKey(name: 'resourceId')
  int resourceId;

  @JsonKey(name: 'commentCount')
  int commentCount;

  @JsonKey(name: 'likedCount')
  int likedCount;

  @JsonKey(name: 'shareCount')
  int shareCount;

  @JsonKey(name: 'threadId')
  String threadId;

  Info(
    this.commentThread,
    this.liked,
    this.resourceType,
    this.resourceId,
    this.commentCount,
    this.likedCount,
    this.shareCount,
    this.threadId,
  );

  factory Info.fromJson(Map<String, dynamic> srcJson) =>
      _$InfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class CommentThread extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'resourceType')
  int resourceType;

  @JsonKey(name: 'commentCount')
  int commentCount;

  @JsonKey(name: 'likedCount')
  int likedCount;

  @JsonKey(name: 'shareCount')
  int shareCount;

  @JsonKey(name: 'hotCount')
  int hotCount;

  @JsonKey(name: 'latestLikedUsers')
  List<LatestLikedUsers> latestLikedUsers;

  @JsonKey(name: 'resourceId')
  int resourceId;

  @JsonKey(name: 'resourceOwnerId')
  int resourceOwnerId;

  CommentThread(
    this.id,
    this.resourceType,
    this.commentCount,
    this.likedCount,
    this.shareCount,
    this.hotCount,
    this.latestLikedUsers,
    this.resourceId,
    this.resourceOwnerId,
  );

  factory CommentThread.fromJson(Map<String, dynamic> srcJson) =>
      _$CommentThreadFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommentThreadToJson(this);
}

@JsonSerializable()
class LatestLikedUsers extends Object {
  @JsonKey(name: 's')
  int s;

  @JsonKey(name: 't')
  int t;

  LatestLikedUsers(
    this.s,
    this.t,
  );

  factory LatestLikedUsers.fromJson(Map<String, dynamic> srcJson) =>
      _$LatestLikedUsersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LatestLikedUsersToJson(this);
}
