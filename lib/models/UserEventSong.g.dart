// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserEventSong.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEventSong _$UserEventSongFromJson(Map<String, dynamic> json) {
  return UserEventSong(
    json['msg'] as String,
    json['song'] == null
        ? null
        : Song.fromJson(json['song'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserEventSongToJson(UserEventSong instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'song': instance.song,
    };

Song _$SongFromJson(Map<String, dynamic> json) {
  return Song(
    json['name'] as String,
    json['id'] as int,
    json['position'] as int,
    json['alias'] as List,
    json['status'] as int,
    json['fee'] as int,
    json['copyrightId'] as int,
    json['disc'] as String,
    json['no'] as int,
    (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artists.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['album'] == null
        ? null
        : Album.fromJson(json['album'] as Map<String, dynamic>),
    json['starred'] as bool,
    json['score'] as int,
    json['starredNum'] as int,
    json['duration'] as int,
    json['playedNum'] as int,
    json['dayPlays'] as int,
    json['hearTime'] as int,
    json['copyFrom'] as String,
    json['commentThreadId'] as String,
    json['ftype'] as int,
    json['rtUrls'] as List,
    json['copyright'] as int,
    json['rtype'] as int,
    json['mvid'] as int,
  );
}

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'position': instance.position,
      'alias': instance.alias,
      'status': instance.status,
      'fee': instance.fee,
      'copyrightId': instance.copyrightId,
      'disc': instance.disc,
      'no': instance.no,
      'artists': instance.artists,
      'album': instance.album,
      'starred': instance.starred,
      'score': instance.score,
      'starredNum': instance.starredNum,
      'duration': instance.duration,
      'playedNum': instance.playedNum,
      'dayPlays': instance.dayPlays,
      'hearTime': instance.hearTime,
      'copyFrom': instance.copyFrom,
      'commentThreadId': instance.commentThreadId,
      'ftype': instance.ftype,
      'rtUrls': instance.rtUrls,
      'copyright': instance.copyright,
      'rtype': instance.rtype,
      'mvid': instance.mvid,
    };

Artists _$ArtistsFromJson(Map<String, dynamic> json) {
  return Artists(
    json['name'] as String,
    json['id'] as int,
    json['picId'] as int,
    json['img1v1Id'] as int,
    json['briefDesc'] as String,
    json['picUrl'] as String,
    json['img1v1Url'] as String,
    json['albumSize'] as int,
    json['alias'] as List,
    json['trans'] as String,
    json['musicSize'] as int,
  );
}

Map<String, dynamic> _$ArtistsToJson(Artists instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'picId': instance.picId,
      'img1v1Id': instance.img1v1Id,
      'briefDesc': instance.briefDesc,
      'picUrl': instance.picUrl,
      'img1v1Url': instance.img1v1Url,
      'albumSize': instance.albumSize,
      'alias': instance.alias,
      'trans': instance.trans,
      'musicSize': instance.musicSize,
    };

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album(
    json['name'] as String,
    json['id'] as int,
    json['type'] as String,
    json['size'] as int,
    json['picId'] as int,
    json['blurPicUrl'] as String,
    json['companyId'] as int,
    json['pic'] as int,
    json['picUrl'] as String,
    json['publishTime'] as int,
    json['description'] as String,
    json['tags'] as String,
    json['company'] as String,
    json['briefDesc'] as String,
    json['artist'] == null
        ? null
        : Artist.fromJson(json['artist'] as Map<String, dynamic>),
    json['songs'] as List,
    json['alias'] as List,
    json['status'] as int,
    json['copyrightId'] as int,
    json['commentThreadId'] as String,
    json['img80x80'] as String,
  );
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
      'size': instance.size,
      'picId': instance.picId,
      'blurPicUrl': instance.blurPicUrl,
      'companyId': instance.companyId,
      'pic': instance.pic,
      'picUrl': instance.picUrl,
      'publishTime': instance.publishTime,
      'description': instance.description,
      'tags': instance.tags,
      'company': instance.company,
      'briefDesc': instance.briefDesc,
      'artist': instance.artist,
      'songs': instance.songs,
      'alias': instance.alias,
      'status': instance.status,
      'copyrightId': instance.copyrightId,
      'commentThreadId': instance.commentThreadId,
      'img80x80': instance.img80x80,
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return Artist(
    json['name'] as String,
    json['id'] as int,
    json['picId'] as int,
    json['img1v1Id'] as int,
    json['briefDesc'] as String,
    json['picUrl'] as String,
    json['img1v1Url'] as String,
    json['albumSize'] as int,
    json['alias'] as List,
    json['trans'] as String,
    json['musicSize'] as int,
  );
}

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'picId': instance.picId,
      'img1v1Id': instance.img1v1Id,
      'briefDesc': instance.briefDesc,
      'picUrl': instance.picUrl,
      'img1v1Url': instance.img1v1Url,
      'albumSize': instance.albumSize,
      'alias': instance.alias,
      'trans': instance.trans,
      'musicSize': instance.musicSize,
    };
