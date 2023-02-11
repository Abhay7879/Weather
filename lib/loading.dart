import 'package:flutter/material.dart';
import 'package:weather_app/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var city = "Bangalore";
  var temp;
  var humidity;
  var air_speed;
  var des;
  var main;
  var loc;
  var icon;

  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();

    temp = instance.temp;
    humidity = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    loc = instance.location;
    icon = instance.icon;

    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": humidity,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "icon_value": icon,
        "city_value": city,
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    Map search = ModalRoute.of(context)?.settings.arguments as Map;

    if (search?.isNotEmpty ?? false) {
      city = search['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/mousam.png",
              height: 250,
              width: 250,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Weather App",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Made by Abhay",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 40,
            ),
            const SpinKitSpinningLines(
              color: Colors.black,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
