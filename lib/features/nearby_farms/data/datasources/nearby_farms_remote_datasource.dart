import 'package:localharvest_canada/features/nearby_farms/data/models/farm_model.dart';

abstract class NearbyFarmsRemoteDatasource {
  Future<List<FarmModel>> getNearbyFarms({
    required double latitude,
    required double longitude,
    required double radius,
  });
}
