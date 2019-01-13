import 'package:json_annotation/json_annotation.dart'; 
  
part 'FindBanner.g.dart';


@JsonSerializable()
  class FindBanner extends Object {

  @JsonKey(name: 'banners')
  List<Banners> banners;

  @JsonKey(name: 'code')
  int code;

  FindBanner(this.banners,this.code,);

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

  @JsonKey(name: 'exclusive')
  bool exclusive;

  @JsonKey(name: 'encodeId')
  String encodeId;

  Banners(this.imageUrl,this.targetId,this.targetType,this.titleColor,this.typeTitle,this.exclusive,this.encodeId,);

  factory Banners.fromJson(Map<String, dynamic> srcJson) => _$BannersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannersToJson(this);

}

  
