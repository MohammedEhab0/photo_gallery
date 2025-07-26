// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotoModelAdapter extends TypeAdapter<PhotoModel> {
  @override
  final int typeId = 0;

  @override
  PhotoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotoModel(
      id: fields[0] as int,
      width: fields[1] as int,
      height: fields[2] as int,
      url: fields[3] as String,
      photographer: fields[4] as String,
      photographerUrl: fields[5] as String,
      photographerId: fields[6] as int,
      avgColor: fields[7] as String,
      src: fields[8] as SrcModel,
      liked: fields[9] as bool,
      alt: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PhotoModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.photographer)
      ..writeByte(5)
      ..write(obj.photographerUrl)
      ..writeByte(6)
      ..write(obj.photographerId)
      ..writeByte(7)
      ..write(obj.avgColor)
      ..writeByte(8)
      ..write(obj.src)
      ..writeByte(9)
      ..write(obj.liked)
      ..writeByte(10)
      ..write(obj.alt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SrcModelAdapter extends TypeAdapter<SrcModel> {
  @override
  final int typeId = 1;

  @override
  SrcModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SrcModel(
      original: fields[0] as String,
      large2x: fields[1] as String,
      large: fields[2] as String,
      medium: fields[3] as String,
      small: fields[4] as String,
      portrait: fields[5] as String,
      landscape: fields[6] as String,
      tiny: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SrcModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.original)
      ..writeByte(1)
      ..write(obj.large2x)
      ..writeByte(2)
      ..write(obj.large)
      ..writeByte(3)
      ..write(obj.medium)
      ..writeByte(4)
      ..write(obj.small)
      ..writeByte(5)
      ..write(obj.portrait)
      ..writeByte(6)
      ..write(obj.landscape)
      ..writeByte(7)
      ..write(obj.tiny);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SrcModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel(
      id: (json['id'] as num).toInt(),
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      url: json['url'] as String,
      photographer: json['photographer'] as String,
      photographerUrl: json['photographer_url'] as String,
      photographerId: (json['photographer_id'] as num).toInt(),
      avgColor: json['avg_color'] as String,
      src: SrcModel.fromJson(json['src'] as Map<String, dynamic>),
      liked: json['liked'] as bool,
      alt: json['alt'] as String,
    );

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'photographer': instance.photographer,
      'photographer_url': instance.photographerUrl,
      'photographer_id': instance.photographerId,
      'avg_color': instance.avgColor,
      'src': instance.src,
      'liked': instance.liked,
      'alt': instance.alt,
    };

SrcModel _$SrcModelFromJson(Map<String, dynamic> json) => SrcModel(
      original: json['original'] as String,
      large2x: json['large2x'] as String,
      large: json['large'] as String,
      medium: json['medium'] as String,
      small: json['small'] as String,
      portrait: json['portrait'] as String,
      landscape: json['landscape'] as String,
      tiny: json['tiny'] as String,
    );

Map<String, dynamic> _$SrcModelToJson(SrcModel instance) => <String, dynamic>{
      'original': instance.original,
      'large2x': instance.large2x,
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
      'portrait': instance.portrait,
      'landscape': instance.landscape,
      'tiny': instance.tiny,
    };
