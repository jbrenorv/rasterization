import 'polygon.dart';
import 'resolution.dart';
import 'segment.dart';

class ImageEntity {
  final int color;
  final int backgroundColor;
  final Resolution resolution;
  final List<Segment> segments;
  final List<Polygon> polygons;

  const ImageEntity({
    this.backgroundColor = 0x000000,
    this.color = 0xFFFFC107,
    this.resolution = const Resolution(300, 300),
    this.segments = const [],
    this.polygons = const [],
  });

  factory ImageEntity.fromMap(Map<String, dynamic> map) {
    final segments = map['segments'] != null
        ? (map['segments'] as List).map((e) => Segment.fromMap(e)).toList()
        : <Segment>[];

    final polygons = map['polygons'] != null
        ? (map['polygons'] as List).map((e) => Polygon.fromMap(e)).toList()
        : <Polygon>[];
    
    final resolution = map['resolution'] != null
        ? Resolution.fromMap(map['resolution'])
        : const Resolution(300, 300);

    return ImageEntity(
      backgroundColor: map['backgroundColor'] ?? 0x000000,
      color: map['color'] ?? 0xFFFFC107,
      resolution: resolution,
      segments: segments,
      polygons: polygons,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'backgroundColor': backgroundColor,
      'color': color,
      'resolution': resolution.toMap(),
      'segments': segments.map((e) => e.toMap()).toList(),
      'polygons': polygons.map((e) => e.toMap()).toList(),
    };
  }

  ImageEntity copyWith({
    int? color,
    int? backgroundColor,
    Resolution? resolution,
    List<Segment>? segments,
    List<Polygon>? polygons,
  }) {
    return ImageEntity(
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      resolution: resolution ?? this.resolution,
      segments: segments ?? this.segments,
      polygons: polygons ?? this.polygons,
    );
  }

  int get nObjects => segments.length + polygons.length;
  int get nSegments => segments.length;
  int get nPolygons => polygons.length;
}
