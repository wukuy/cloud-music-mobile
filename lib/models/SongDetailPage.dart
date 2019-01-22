import 'package:json_annotation/json_annotation.dart'; 
  
part 'SongDetailPage.g.dart';


@JsonSerializable()
  class SongDetailPage extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'playlist')
  List<Playlist> playlist;

  @JsonKey(name: 'info')
  Info info;

  SongDetailPage(this.code,this.playlist,this.info,);

  factory SongDetailPage.fromJson(Map<String, dynamic> srcJson) => _$SongDetailPageFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SongDetailPageToJson(this);

}

  
@JsonSerializable()
  class Playlist extends Object {

  @JsonKey(name: 'songId')
  int songId;

  @JsonKey(name: 'singer')
  String singer;

  @JsonKey(name: 'coverPic')
  String coverPic;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'songName')
  String songName;

  Playlist(this.songId,this.singer,this.coverPic,this.url,this.songName,);

  factory Playlist.fromJson(Map<String, dynamic> srcJson) => _$PlaylistFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);

}

  
@JsonSerializable()
  class Info extends Object {

  @JsonKey(name: 'avatarUrl')
  String avatarUrl;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'coverImgUrl')
  String coverImgUrl;

  @JsonKey(name: 'tags')
  String tags;

  Info(this.avatarUrl,this.nickname,this.coverImgUrl,this.tags,);

  factory Info.fromJson(Map<String, dynamic> srcJson) => _$InfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

}

  
