import 'package:json_annotation/json_annotation.dart';

part 'SongSheetCategorys.g.dart';

@JsonSerializable()
class SongSheetCategorys extends Object {
  @JsonKey(name: 'all')
  All all;

  @JsonKey(name: 'sub')
  List<Sub> sub;

  @JsonKey(name: 'code')
  int code;

  SongSheetCategorys(
    this.all,
    this.sub,
    this.code,
  );

  factory SongSheetCategorys.fromJson(Map<String, dynamic> srcJson) =>
      _$SongSheetCategorysFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SongSheetCategorysToJson(this);
}

@JsonSerializable()
class All extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'resourceCount')
  int resourceCount;

  @JsonKey(name: 'imgId')
  int imgId;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'category')
  int category;

  @JsonKey(name: 'resourceType')
  int resourceType;

  @JsonKey(name: 'hot')
  bool hot;

  @JsonKey(name: 'activity')
  bool activity;

  All(
    this.name,
    this.resourceCount,
    this.imgId,
    this.type,
    this.category,
    this.resourceType,
    this.hot,
    this.activity,
  );

  factory All.fromJson(Map<String, dynamic> srcJson) => _$AllFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AllToJson(this);
}

@JsonSerializable()
class Sub extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'resourceCount')
  int resourceCount;

  @JsonKey(name: 'imgId')
  int imgId;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'category')
  int category;

  @JsonKey(name: 'resourceType')
  int resourceType;

  @JsonKey(name: 'hot')
  bool hot;

  @JsonKey(name: 'activity')
  bool activity;

  Sub(
    this.name,
    this.resourceCount,
    this.imgId,
    this.type,
    this.category,
    this.resourceType,
    this.hot,
    this.activity,
  );

  factory Sub.fromJson(Map<String, dynamic> srcJson) => _$SubFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SubToJson(this);
}
