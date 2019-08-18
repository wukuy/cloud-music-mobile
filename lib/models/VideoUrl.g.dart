// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VideoUrl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoUrl _$VideoUrlFromJson(Map<String, dynamic> json) {
  return VideoUrl(
    (json['urls'] as List)
        ?.map(
            (e) => e == null ? null : Urls.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['code'] as int,
  );
}

Map<String, dynamic> _$VideoUrlToJson(VideoUrl instance) => <String, dynamic>{
      'urls': instance.urls,
      'code': instance.code,
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) {
  return Urls(
    json['id'] as String,
    json['url'] as String,
    json['size'] as int,
    json['validityTime'] as int,
    json['needPay'] as bool,
    json['r'] as int,
  );
}

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'size': instance.size,
      'validityTime': instance.validityTime,
      'needPay': instance.needPay,
      'r': instance.r,
    };
