import 'package:json_annotation/json_annotation.dart';

part 'UserEventSong.g.dart';

@JsonSerializable()
class UserEventSong extends Object {
  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'song')
  Song song;

  UserEventSong(
    this.msg,
    this.song,
  );

  factory UserEventSong.fromJson(Map<String, dynamic> srcJson) =>
      _$UserEventSongFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserEventSongToJson(this);
}

@JsonSerializable()
class Song extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'position')
  int position;

  @JsonKey(name: 'alias')
  List<dynamic> alias;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'fee')
  int fee;

  @JsonKey(name: 'copyrightId')
  int copyrightId;

  @JsonKey(name: 'disc')
  String disc;

  @JsonKey(name: 'no')
  int no;

  @JsonKey(name: 'artists')
  List<Artists> artists;

  @JsonKey(name: 'album')
  Album album;

  @JsonKey(name: 'starred')
  bool starred;

  @JsonKey(name: 'score')
  int score;

  @JsonKey(name: 'starredNum')
  int starredNum;

  @JsonKey(name: 'duration')
  int duration;

  @JsonKey(name: 'playedNum')
  int playedNum;

  @JsonKey(name: 'dayPlays')
  int dayPlays;

  @JsonKey(name: 'hearTime')
  int hearTime;

  @JsonKey(name: 'copyFrom')
  String copyFrom;

  @JsonKey(name: 'commentThreadId')
  String commentThreadId;

  @JsonKey(name: 'ftype')
  int ftype;

  @JsonKey(name: 'rtUrls')
  List<dynamic> rtUrls;

  @JsonKey(name: 'copyright')
  int copyright;

  @JsonKey(name: 'rtype')
  int rtype;

  @JsonKey(name: 'mvid')
  int mvid;

  Song(
    this.name,
    this.id,
    this.position,
    this.alias,
    this.status,
    this.fee,
    this.copyrightId,
    this.disc,
    this.no,
    this.artists,
    this.album,
    this.starred,
    this.score,
    this.starredNum,
    this.duration,
    this.playedNum,
    this.dayPlays,
    this.hearTime,
    this.copyFrom,
    this.commentThreadId,
    this.ftype,
    this.rtUrls,
    this.copyright,
    this.rtype,
    this.mvid,
  );

  factory Song.fromJson(Map<String, dynamic> srcJson) =>
      _$SongFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SongToJson(this);
}

@JsonSerializable()
class Artists extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'picId')
  int picId;

  @JsonKey(name: 'img1v1Id')
  int img1v1Id;

  @JsonKey(name: 'briefDesc')
  String briefDesc;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'img1v1Url')
  String img1v1Url;

  @JsonKey(name: 'albumSize')
  int albumSize;

  @JsonKey(name: 'alias')
  List<dynamic> alias;

  @JsonKey(name: 'trans')
  String trans;

  @JsonKey(name: 'musicSize')
  int musicSize;

  Artists(
    this.name,
    this.id,
    this.picId,
    this.img1v1Id,
    this.briefDesc,
    this.picUrl,
    this.img1v1Url,
    this.albumSize,
    this.alias,
    this.trans,
    this.musicSize,
  );

  factory Artists.fromJson(Map<String, dynamic> srcJson) =>
      _$ArtistsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArtistsToJson(this);
}

@JsonSerializable()
class Album extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'picId')
  int picId;

  @JsonKey(name: 'blurPicUrl')
  String blurPicUrl;

  @JsonKey(name: 'companyId')
  int companyId;

  @JsonKey(name: 'pic')
  int pic;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'tags')
  String tags;

  @JsonKey(name: 'company')
  String company;

  @JsonKey(name: 'briefDesc')
  String briefDesc;

  @JsonKey(name: 'artist')
  Artist artist;

  @JsonKey(name: 'songs')
  List<dynamic> songs;

  @JsonKey(name: 'alias')
  List<dynamic> alias;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'copyrightId')
  int copyrightId;

  @JsonKey(name: 'commentThreadId')
  String commentThreadId;

  @JsonKey(name: 'img80x80')
  String img80x80;

  Album(
    this.name,
    this.id,
    this.type,
    this.size,
    this.picId,
    this.blurPicUrl,
    this.companyId,
    this.pic,
    this.picUrl,
    this.publishTime,
    this.description,
    this.tags,
    this.company,
    this.briefDesc,
    this.artist,
    this.songs,
    this.alias,
    this.status,
    this.copyrightId,
    this.commentThreadId,
    this.img80x80,
  );

  factory Album.fromJson(Map<String, dynamic> srcJson) =>
      _$AlbumFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}

@JsonSerializable()
class Artist extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'picId')
  int picId;

  @JsonKey(name: 'img1v1Id')
  int img1v1Id;

  @JsonKey(name: 'briefDesc')
  String briefDesc;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'img1v1Url')
  String img1v1Url;

  @JsonKey(name: 'albumSize')
  int albumSize;

  @JsonKey(name: 'alias')
  List<dynamic> alias;

  @JsonKey(name: 'trans')
  String trans;

  @JsonKey(name: 'musicSize')
  int musicSize;

  Artist(
    this.name,
    this.id,
    this.picId,
    this.img1v1Id,
    this.briefDesc,
    this.picUrl,
    this.img1v1Url,
    this.albumSize,
    this.alias,
    this.trans,
    this.musicSize,
  );

  factory Artist.fromJson(Map<String, dynamic> srcJson) =>
      _$ArtistFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}
