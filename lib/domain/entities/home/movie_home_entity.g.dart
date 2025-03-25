// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_home_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieHomeEntityAdapter extends TypeAdapter<MovieHomeEntity> {
  @override
  final int typeId = 0;

  @override
  MovieHomeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieHomeEntity(
      fields[0] as int,
      fields[1] as String?,
      fields[2] as String,
      fields[3] as double,
      fields[4] as String,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieHomeEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.movieId)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.year)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.overView);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieHomeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
