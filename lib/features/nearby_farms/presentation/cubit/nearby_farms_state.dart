import 'package:equatable/equatable.dart';
import '../../domain/entities/farm.dart';

abstract class NearbyFarmState extends Equatable {
  // <- NearbyFarm here
  const NearbyFarmState();

  @override
  List<Object?> get props => [];
}

class NearbyFarmInitial extends NearbyFarmState {}

class NearbyFarmLoading extends NearbyFarmState {}

class NearbyFarmLoaded extends NearbyFarmState {
  final List<Farm> nearbyFarms;

  const NearbyFarmLoaded(this.nearbyFarms);

  @override
  List<Object?> get props => [nearbyFarms];
}

class NearbyFarmError extends NearbyFarmState {
  final String message;

  const NearbyFarmError(this.message);

  @override
  List<Object?> get props => [message];
}
