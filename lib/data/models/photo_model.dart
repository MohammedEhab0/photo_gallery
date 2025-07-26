import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class PhotoModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int width;

  @HiveField(2)
  final int height;

  @HiveField(3)
  final String url;

  @HiveField(4)
  final String photographer;

  @HiveField(5)
  @JsonKey(name: 'photographer_url')
  final String photographerUrl;

  @HiveField(6)
  @JsonKey(name: 'photographer_id')
  final int photographerId;

  @HiveField(7)
  @JsonKey(name: 'avg_color')
  final String avgColor;

  @HiveField(8)
  final SrcModel src;

  @HiveField(9)
  final bool liked;

  @HiveField(10)
  final String alt;

  PhotoModel({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}

@HiveType(typeId: 1)
@JsonSerializable()
class SrcModel {
  @HiveField(0)
  final String original;

  @HiveField(1)
  final String large2x;

  @HiveField(2)
  final String large;

  @HiveField(3)
  final String medium;

  @HiveField(4)
  final String small;

  @HiveField(5)
  final String portrait;

  @HiveField(6)
  final String landscape;

  @HiveField(7)
  final String tiny;

  SrcModel({
    required this.original,
    required this.large2x,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory SrcModel.fromJson(Map<String, dynamic> json) =>
      _$SrcModelFromJson(json);

  Map<String, dynamic> toJson() => _$SrcModelToJson(this);
}
