import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localharvest_canada/features/nearby_farms/presentation/cubit/nearby_farms_state.dart';
import '../../domain/usecases/get_nearby_farms.dart';

class NearbyFarmsCubit extends Cubit<NearbyFarmState> {
  final GetNearbyFarms getNearbyFarms;

  NearbyFarmsCubit({required this.getNearbyFarms}) : super(NearbyFarmInitial());

  Future<void> fetchNearbyFarms({
    required double latitude,
    required double longitude,
    double radius = 200, // km
  }) async {
    emit(NearbyFarmLoading());

    try {
      final farms = await getNearbyFarms(
        latitude: latitude,
        longitude: longitude,
        radius: radius,
      );

      emit(NearbyFarmLoaded(farms));
    } catch (e) {
      emit(NearbyFarmError(e.toString()));
    }
  }
}
