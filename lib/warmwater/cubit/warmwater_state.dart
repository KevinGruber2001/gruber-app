part of 'warmwater_cubit.dart';

@immutable
abstract class WarmwaterState extends Equatable {}

class WarmWaterInitial extends WarmwaterState {
  @override
  List<Object> get props => [];
}

class WarmWaterLoading extends WarmwaterState {
  @override
  List<Object> get props => [];
}

class WarmWaterRunning extends WarmwaterState {
  @override
  List<Object> get props => [];
}

class WarmWaterStopped extends WarmwaterState {
  @override
  List<Object> get props => [];
}

class WarmWaterError extends WarmwaterState {
  @override
  List<Object> get props => [];
}
