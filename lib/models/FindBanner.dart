import 'package:json_annotation/json_annotation.dart'; 
  
part 'FindBanner.g.dart';


@JsonSerializable()
  class FindBanner extends Object {

  @JsonKey(name: 'banners')
  List<Banners> banners;

  FindBanner(this.banners,);

  factory FindBanner.fromJson(Map<String, dynamic> srcJson) => _$FindBannerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FindBannerToJson(this);

}

  
@JsonSerializable()
  class Banners extends Object {

  @JsonKey(name: 'imageUrl')
  String imageUrl;

  @JsonKey(name: 'targetId')
  int targetId;

  @JsonKey(name: 'targetType')
  int targetType;

  @JsonKey(name: 'titleColor')
  String titleColor;

  @JsonKey(name: 'typeTitle')
  String typeTitle;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'exclusive')
  bool exclusive;

  @JsonKey(name: 'encodeId')
  String encodeId;

  @JsonKey(name: 'video')
  String video;

  @JsonKey(name: 'song')
  String song;

  Banners(this.imageUrl,this.targetId,this.targetType,this.titleColor,this.typeTitle,this.url,this.exclusive,this.encodeId,this.video,this.song,);

  factory Banners.fromJson(Map<String, dynamic> srcJson) => _$BannersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannersToJson(this);

}

  
