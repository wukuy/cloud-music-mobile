// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FindBanner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindBanner _$FindBannerFromJson(Map<String, dynamic> json) {
  return FindBanner(
      (json['banners'] as List)
          ?.map((e) =>
              e == null ? null : Banners.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['code'] as int);
}

Map<String, dynamic> _$FindBannerToJson(FindBanner instance) =>
    <String, dynamic>{'banners': instance.banners, 'code': instance.code};

Banners _$BannersFromJson(Map<String, dynamic> json) {
  return Banners(
      json['imageUrl'] as String,
      json['targetId'] as int,
      json['targetType'] as int,
      json['titleColor'] as String,
      json['typeTitle'] as String,
      json['exclusive'] as bool,
      json['encodeId'] as String);
}

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'targetId': instance.targetId,
      'targetType': instance.targetType,
      'titleColor': instance.titleColor,
      'typeTitle': instance.typeTitle,
      'exclusive': instance.exclusive,
      'encodeId': instance.encodeId
    };
