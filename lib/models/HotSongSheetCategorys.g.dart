// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HotSongSheetCategorys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotSongSheetCategorys _$HotSongSheetCategorysFromJson(
    Map<String, dynamic> json) {
  return HotSongSheetCategorys(
    (json['tags'] as List)
        ?.map(
            (e) => e == null ? null : Tags.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['code'] as int,
  );
}

Map<String, dynamic> _$HotSongSheetCategorysToJson(
        HotSongSheetCategorys instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'code': instance.code,
    };

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return Tags(
    json['playlistTag'] == null
        ? null
        : PlaylistTag.fromJson(json['playlistTag'] as Map<String, dynamic>),
    json['activity'] as bool,
    json['category'] as int,
    json['usedCount'] as int,
    json['createTime'] as int,
    json['hot'] as bool,
    json['position'] as int,
    json['name'] as String,
    json['id'] as int,
    json['type'] as int,
  );
}

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'playlistTag': instance.playlistTag,
      'activity': instance.activity,
      'category': instance.category,
      'usedCount': instance.usedCount,
      'createTime': instance.createTime,
      'hot': instance.hot,
      'position': instance.position,
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
    };

PlaylistTag _$PlaylistTagFromJson(Map<String, dynamic> json) {
  return PlaylistTag(
    json['id'] as int,
    json['name'] as String,
    json['category'] as int,
    json['usedCount'] as int,
    json['type'] as int,
    json['position'] as int,
    json['createTime'] as int,
    json['highQuality'] as int,
    json['highQualityPos'] as int,
    json['officialPos'] as int,
  );
}

Map<String, dynamic> _$PlaylistTagToJson(PlaylistTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'usedCount': instance.usedCount,
      'type': instance.type,
      'position': instance.position,
      'createTime': instance.createTime,
      'highQuality': instance.highQuality,
      'highQualityPos': instance.highQualityPos,
      'officialPos': instance.officialPos,
    };
