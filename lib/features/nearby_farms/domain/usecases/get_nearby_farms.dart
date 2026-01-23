import 'package:localharvest_canada/features/nearby_farms/domain/entities/farm.dart';
import 'package:localharvest_canada/features/nearby_farms/domain/repositories/nearby_farms_repository.dart';

class GetNearbyFarms {
  final NearbyFarmsRepository repository;

  GetNearbyFarms(this.repository);

  Future<List<Farm>> call({
    required double latitude,
    required double longitude,
    required double radius,
  }) async {
    return await repository.getNearbyFarms(
      latitude: latitude,
      longitude: longitude,
      radius: radius,
    );
  }
}

//The use case is just a wrapper around the repository for business logic.
