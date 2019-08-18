import 'package:json_annotation/json_annotation.dart';

part 'UserEventVideo.g.dart';

@JsonSerializable()
class UserEventVideo extends Object {
  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'video')
  Video video;

  UserEventVideo(
    this.msg,
    this.video,
  );

  factory UserEventVideo.fromJson(Map<String, dynamic> srcJson) =>
      _$UserEventVideoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserEventVideoToJson(this);
}

@JsonSerializable()
class Video extends Object {
  @JsonKey(name: 'vid')
  int vid;

  @JsonKey(name: 'coverUrl')
  String coverUrl;

  @JsonKey(name: 'duration')
  int duration;

  @JsonKey(name: 'playTime')
  int playTime;

  @JsonKey(name: 'height')
  int height;

  @JsonKey(name: 'width')
  int width;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'state')
  int state;

  @JsonKey(name: 'coverType')
  int coverType;

  @JsonKey(name: 'videoId')
  String videoId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'creator')
  Creator creator;

  @JsonKey(name: 'videoStatus')
  int videoStatus;

  @JsonKey(name: 'resolutions')
  List<Resolutions> resolutions;

  @JsonKey(name: 'durationms')
  int durationms;

  Video(
    this.vid,
    this.coverUrl,
    this.duration,
    this.playTime,
    this.height,
    this.width,
    this.size,
    this.state,
    this.coverType,
    this.videoId,
    this.title,
    this.creator,
    this.videoStatus,
    this.resolutions,
    this.durationms,
  );

  factory Video.fromJson(Map<String, dynamic> srcJson) =>
      _$VideoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

@JsonSerializable()
class Creator extends Object {
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

  @JsonKey(name: 'avatarImgIdStr')
  String avatarImgIdStr;

  @JsonKey(name: 'backgroundImgIdStr')
  String backgroundImgIdStr;

  Creator(
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
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
  );

  factory Creator.fromJson(Map<String, dynamic> srcJson) =>
      _$CreatorFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CreatorToJson(this);
}

@JsonSerializable()
class Resolutions extends Object {
  @JsonKey(name: 'resolution')
  int resolution;

  @JsonKey(name: 'size')
  int size;

  Resolutions(
    this.resolution,
    this.size,
  );

  factory Resolutions.fromJson(Map<String, dynamic> srcJson) =>
      _$ResolutionsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResolutionsToJson(this);
}
