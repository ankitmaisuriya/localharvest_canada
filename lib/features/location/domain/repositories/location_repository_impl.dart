import 'package:geolocator/geolocator.dart';
import 'package:localharvest_canada/features/location/data/services/location_service.dart';
import 'package:localharvest_canada/features/location/domain/entities/user_location.dart';
import 'package:localharvest_canada/features/location/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  LocationService service;

  LocationRepositoryImpl(this.service);

  @override
  Future<UserLocation> getCurrentLocation() async {
    Position position = await service.getCurrentLocation();

    return UserLocation(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
