import 'package:dio/dio.dart';
import 'package:localharvest_canada/core/network/api_endpoints.dart';
import 'package:localharvest_canada/features/nearby_farms/data/datasources/nearby_farms_remote_datasource.dart';
import 'package:localharvest_canada/features/nearby_farms/data/models/farm_model.dart';

class NearbyFarmsRemoteDatasourceImpl implements NearbyFarmsRemoteDatasource {
  final Dio dio;

  NearbyFarmsRemoteDatasourceImpl(this.dio);

  @override
  Future<List<FarmModel>> getNearbyFarms({
    required double latitude,
    required double longitude,
    required double radius,
  }) async {
    final response = await dio.post(
      ApiEndpoints.nearbyFarms,
      data: {"latitude": latitude, "longitude": longitude, "radius": radius},
    );

    return (response.data as List).map((e) => FarmModel.fromJson(e)).toList();
  }
}
