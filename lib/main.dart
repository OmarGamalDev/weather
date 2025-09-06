import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/views/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  runApp(const WeatherApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return BlocProvider(
          create: (_) => WeatherCubit(),
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              final weatherModel = BlocProvider.of<WeatherCubit>(
                context,
              ).weatherModel;
              final color = getThemeColor(weatherModel?.weatherCondation);

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: const HomeScreen(),
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSwatch(primarySwatch: color),
                  appBarTheme: AppBarTheme(
                    backgroundColor: color.shade500,
                    foregroundColor: Colors.white,
                    titleTextStyle: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  textTheme: GoogleFonts.poppinsTextTheme(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

MaterialColor getThemeColor(String? weatherState) {
  if (weatherState == null) return Colors.blue;

  switch (weatherState) {
    case 'Patchy rain nearby':
      return Colors.teal;
    case 'Sunny':
      return Colors.orange;
    case 'Clear':
      return Colors.yellow;
    case 'Clouds':
      return Colors.blueGrey;
    case 'Rain':
      return Colors.blue;
    case 'Drizzle':
    case 'Mist':
      return Colors.indigo;
    case 'Thunderstorm':
      return Colors.deepPurple;
    case 'Snow':
    case 'Hail':
      return Colors.lightBlue;
    case 'Extreme':
      return Colors.red;
    case 'Additional':
      return Colors.purple;
    default:
      return Colors.blue;
  }
}
