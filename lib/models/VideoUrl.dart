import 'package:json_annotation/json_annotation.dart';

part 'VideoUrl.g.dart';

@JsonSerializable()
class VideoUrl extends Object {
  @JsonKey(name: 'urls')
  List<Urls> urls;

  @JsonKey(name: 'code')
  int code;

  VideoUrl(
    this.urls,
    this.code,
  );

  factory VideoUrl.fromJson(Map<String, dynamic> srcJson) =>
      _$VideoUrlFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoUrlToJson(this);
}

@JsonSerializable()
class Urls extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'validityTime')
  int validityTime;

  @JsonKey(name: 'needPay')
  bool needPay;

  @JsonKey(name: 'r')
  int r;

  Urls(
    this.id,
    this.url,
    this.size,
    this.validityTime,
    this.needPay,
    this.r,
  );

  factory Urls.fromJson(Map<String, dynamic> srcJson) =>
      _$UrlsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
