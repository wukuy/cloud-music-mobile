// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SongSheetCategorys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongSheetCategorys _$SongSheetCategorysFromJson(Map<String, dynamic> json) {
  return SongSheetCategorys(
    json['all'] == null
        ? null
        : All.fromJson(json['all'] as Map<String, dynamic>),
    (json['sub'] as List)
        ?.map((e) => e == null ? null : Sub.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['code'] as int,
  );
}

Map<String, dynamic> _$SongSheetCategorysToJson(SongSheetCategorys instance) =>
    <String, dynamic>{
      'all': instance.all,
      'sub': instance.sub,
      'code': instance.code,
    };

All _$AllFromJson(Map<String, dynamic> json) {
  return All(
    json['name'] as String,
    json['resourceCount'] as int,
    json['imgId'] as int,
    json['type'] as int,
    json['category'] as int,
    json['resourceType'] as int,
    json['hot'] as bool,
    json['activity'] as bool,
  );
}

Map<String, dynamic> _$AllToJson(All instance) => <String, dynamic>{
      'name': instance.name,
      'resourceCount': instance.resourceCount,
      'imgId': instance.imgId,
      'type': instance.type,
      'category': instance.category,
      'resourceType': instance.resourceType,
      'hot': instance.hot,
      'activity': instance.activity,
    };

Sub _$SubFromJson(Map<String, dynamic> json) {
  return Sub(
    json['name'] as String,
    json['resourceCount'] as int,
    json['imgId'] as int,
    json['type'] as int,
    json['category'] as int,
    json['resourceType'] as int,
    json['hot'] as bool,
    json['activity'] as bool,
  );
}

Map<String, dynamic> _$SubToJson(Sub instance) => <String, dynamic>{
      'name': instance.name,
      'resourceCount': instance.resourceCount,
      'imgId': instance.imgId,
      'type': instance.type,
      'category': instance.category,
      'resourceType': instance.resourceType,
      'hot': instance.hot,
      'activity': instance.activity,
    };
