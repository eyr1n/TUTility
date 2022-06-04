import 'package:json_annotation/json_annotation.dart';
part 'tile_data.g.dart';

@JsonSerializable()
class TileData {
  final String id,
      name,
      area,
      term,
      required,
      units,
      grade,
      staff,
      syllabus,
      room;

  TileData({
    required this.id,
    required this.name,
    required this.area,
    required this.term,
    required this.required,
    required this.units,
    required this.grade,
    required this.staff,
    required this.syllabus,
    required this.room,
  });

  factory TileData.fromJson(Map<String, dynamic> json) =>
      _$TileDataFromJson(json);

  Map<String, dynamic> toJson() => _$TileDataToJson(this);
}
