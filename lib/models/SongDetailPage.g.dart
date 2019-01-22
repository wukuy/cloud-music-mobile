// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SongDetailPage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongDetailPage _$SongDetailPageFromJson(Map<String, dynamic> json) {
  return SongDetailPage(
      json['code'] as int,
      (json['playlist'] as List)
          ?.map((e) =>
              e == null ? null : Playlist.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>));
}

Map<String, dynamic> _$SongDetailPageToJson(SongDetailPage instance) =>
    <String, dynamic>{
      'code': instance.code,
      'playlist': instance.playlist,
      'info': instance.info
    };

Playlist _$PlaylistFromJson(Map<String, dynamic> json) {
  return Playlist(
      json['songId'] as int,
      json['singer'] as String,
      json['coverPic'] as String,
      json['url'] as String,
      json['songName'] as String);
}

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'songId': instance.songId,
      'singer': instance.singer,
      'coverPic': instance.coverPic,
      'url': instance.url,
      'songName': instance.songName
    };

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(json['avatarUrl'] as String, json['nickname'] as String,
      json['coverImgUrl'] as String, json['tags'] as String);
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'avatarUrl': instance.avatarUrl,
      'nickname': instance.nickname,
      'coverImgUrl': instance.coverImgUrl,
      'tags': instance.tags
    };
