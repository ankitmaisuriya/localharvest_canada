import 'package:localharvest_canada/features/nearby_farms/domain/entities/farm.dart';

class FarmModel extends Farm {
  FarmModel({
    required super.farmId,
    required super.farmName,
    required super.rating,
    required super.imageUrl,
    required super.latitude,
    required super.longitude,
    required super.distance,
    required super.categories,
  });

  factory FarmModel.fromJson(Map<String, dynamic> json) {
    return FarmModel(
      farmId: json['farm_id'],
      farmName: json['farm_name'],
      rating: double.parse(json['rating'].toString()),
      imageUrl: json['imageurl'],
      latitude: double.parse(json['latitude'].toString()),
      longitude: double.parse(json['longitude'].toString()),
      distance: double.parse(json['distance'].toString()),
      categories: (json['categories'].toString())
          .split(',')
          .map((e) => e.trim())
          .toList(),
    );
  }
}
