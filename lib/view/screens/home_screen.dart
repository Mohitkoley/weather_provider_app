import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/routes/route_names.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_app/view/screens/weather_screen.dart';
import 'package:weather_app/view_model/Theme/theme_view_model.dart';
import 'package:weather_app/view_model/weather_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 700), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MultiProvider(providers: [
            ChangeNotifierProvider(create: (_) => ThemeViewModel()),
          ], child: const WeatherScreen()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeInImage(
          height: context.h * 0.4,
          width: context.w * 0.8,
          image: const AssetImage(
            "assets/images/weather.png",
          ),
          placeholder: const NetworkImage(
              "https://media.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif"),
        ),
      ),
    );
  }
}
