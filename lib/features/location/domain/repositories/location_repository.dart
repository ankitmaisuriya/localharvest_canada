import 'package:localharvest_canada/features/location/domain/entities/user_location.dart';

abstract class LocationRepository {
  Future<UserLocation> getCurrentLocation();
}
