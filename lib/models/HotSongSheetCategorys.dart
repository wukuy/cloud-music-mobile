import 'package:json_annotation/json_annotation.dart';

part 'HotSongSheetCategorys.g.dart';

@JsonSerializable()
class HotSongSheetCategorys extends Object {
  @JsonKey(name: 'tags')
  List<Tags> tags;

  @JsonKey(name: 'code')
  int code;

  HotSongSheetCategorys(
    this.tags,
    this.code,
  );

  factory HotSongSheetCategorys.fromJson(Map<String, dynamic> srcJson) =>
      _$HotSongSheetCategorysFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HotSongSheetCategorysToJson(this);
}

@JsonSerializable()
class Tags extends Object {
  @JsonKey(name: 'playlistTag')
  PlaylistTag playlistTag;

  @JsonKey(name: 'activity')
  bool activity;

  @JsonKey(name: 'category')
  int category;

  @JsonKey(name: 'usedCount')
  int usedCount;

  @JsonKey(name: 'createTime')
  int createTime;

  @JsonKey(name: 'hot')
  bool hot;

  @JsonKey(name: 'position')
  int position;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  int type;

  Tags(
    this.playlistTag,
    this.activity,
    this.category,
    this.usedCount,
    this.createTime,
    this.hot,
    this.position,
    this.name,
    this.id,
    this.type,
  );

  factory Tags.fromJson(Map<String, dynamic> srcJson) =>
      _$TagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagsToJson(this);
}

@JsonSerializable()
class PlaylistTag extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'category')
  int category;

  @JsonKey(name: 'usedCount')
  int usedCount;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'position')
  int position;

  @JsonKey(name: 'createTime')
  int createTime;

  @JsonKey(name: 'highQuality')
  int highQuality;

  @JsonKey(name: 'highQualityPos')
  int highQualityPos;

  @JsonKey(name: 'officialPos')
  int officialPos;

  PlaylistTag(
    this.id,
    this.name,
    this.category,
    this.usedCount,
    this.type,
    this.position,
    this.createTime,
    this.highQuality,
    this.highQualityPos,
    this.officialPos,
  );

  factory PlaylistTag.fromJson(Map<String, dynamic> srcJson) =>
      _$PlaylistTagFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PlaylistTagToJson(this);
}
