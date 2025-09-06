part of 'weather_cubit.dart';
abstract class WeatherState {
  const WeatherState();
  List<Object> get props => [];
}
class WeatherInitialState extends WeatherState {}
class WeatherLoadingState extends WeatherState {}
class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;
  const WeatherSuccessState({required this.weatherModel});
}
class WeatherFailureState extends WeatherState {
  final String? errorMessage;
  const WeatherFailureState({this.errorMessage});
}