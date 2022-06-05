// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:weather/weather.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

WeatherFactory wf = new WeatherFactory("222aa2c28f9353df26b4102e55e38874");

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Location location = new Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData = null;
  String areaname = "";
  String desc = "";
  double tempfeelslike = 0;
  double maxtemp = 0;
  double lowtemp = 0;
  double humidity = 0;
  double pressure = 0;
  double windspeed = 0;
  double temp = 0;

  void check_for_service() async {
    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
  }

  Future get_weather() async {
    Weather w = await wf.currentWeatherByLocation(
        _locationData!.latitude!, _locationData!.longitude!);
    setState(() {
      areaname = w.areaName!;
      desc = w.weatherDescription!;
      humidity = w.humidity!;
      pressure = w.pressure!;
      windspeed = w.windSpeed!;
      temp = w.temperature!.celsius!;
      lowtemp = w.tempMin!.celsius!;
      maxtemp = w.tempMax!.celsius!;
      tempfeelslike = w.tempFeelsLike!.celsius!;
    });
  }

  void get_permission() {
    location.requestPermission().then((PermissionStatus permissionGranted) {
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
      location.getLocation().then((LocationData locationData) {
        setState(() {
          _locationData = locationData;
        });
        get_weather();
      });
    });
  }

  @override
  void initState() {
    check_for_service();
    get_permission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: (areaname == "")
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Getting Location info...",
                      style: GoogleFonts.poppins(),
                    )
                  ],
                )
              : FadeIn(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeIn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        areaname,
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${temp.round()}°C ",
                        style: GoogleFonts.roboto(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${maxtemp.round()}°C | ${lowtemp.round()}°C ",
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "It feels like ${tempfeelslike.round()}°C",
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.grey.shade200,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade800,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.cloud_outlined,
                                  ),
                                  Text(
                                    desc,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade800,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.water,
                                  ),
                                  Text(
                                    "wind ${windspeed.round().toString()} km/h",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade800,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.wb_sunny_outlined,
                                  ),
                                  Text(
                                    "humidity ${humidity.round()}%",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade800,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const BoxedIcon(WeatherIcons.gale_warning),
                                  Text(
                                    "${pressure.round().toString()} hPa",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      )
                    ],
                  ),
                )),
    );
  }
}
