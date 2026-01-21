import 'package:localharvest_canada/features/location/domain/entities/user_location.dart';
import 'package:localharvest_canada/features/location/domain/repositories/location_repository.dart';

class GetCurrentLocation {
  final LocationRepository locationRepository;

  GetCurrentLocation(this.locationRepository);

  Future<UserLocation> call() async {
    return await locationRepository.getCurrentLocation();
  }
}
