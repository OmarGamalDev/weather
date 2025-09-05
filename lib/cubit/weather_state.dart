part of 'weather_cubit.dart';
abstract class WeatherState {
  const WeatherState();
  @override
  List<Object> get props => [];
}
class WeatherInitial extends WeatherState {}
class WeatherLoadingState extends WeatherState {}
class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;
  const WeatherSuccessState({required this.weatherModel});
}
class WeatherFailureState extends WeatherState {}
