import 'package:localharvest_canada/features/nearby_farms/data/datasources/nearby_farms_remote_datasource.dart';
import 'package:localharvest_canada/features/nearby_farms/domain/entities/farm.dart';
import 'package:localharvest_canada/features/nearby_farms/domain/repositories/nearby_farms_repository.dart';

class NearbyFarmsRepositoryImpl implements NearbyFarmsRepository {
  final NearbyFarmsRemoteDatasource nearbyFarmsRemoteDatasource;

  NearbyFarmsRepositoryImpl(this.nearbyFarmsRemoteDatasource);

  @override
  Future<List<Farm>> getNearbyFarms({
    required double latitude,
    required double longitude,
    required double radius,
  }) async {
    return await nearbyFarmsRemoteDatasource.getNearbyFarms(
      latitude: latitude,
      longitude: longitude,
      radius: radius,
    );
  }
}
