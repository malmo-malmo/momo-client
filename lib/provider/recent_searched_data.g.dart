// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_searched_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentSearchedDataAdapter extends TypeAdapter<_$_RecentSearchedData> {
  @override
  final int typeId = 2;

  @override
  _$_RecentSearchedData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_RecentSearchedData(
      words: (fields[0] as List).cast<String>(),
      groupIds: (fields[1] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_RecentSearchedData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.words)
      ..writeByte(1)
      ..write(obj.groupIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentSearchedDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
