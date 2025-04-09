// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart'as http;
//
// class WeatherApp extends StatefulWidget {
//   const WeatherApp({super.key});
//
//   @override
//   State<WeatherApp> createState() => _WeatherAppState();
// }
//
// class _WeatherAppState extends State<WeatherApp> {
//
//   //위도 경도 저장용 변수
//   var lat;
//   var lon;
//
//   final LocationSettings locationSettings = LocationSettings(
//     accuracy: LocationAccuracy.high,
//     distanceFilter: 100,
//   );
//   void getLocation() async{
//     // 내 폰 위치 정보 획득 가능한지 확인
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//
//     if(!serviceEnabled){
//       return Future.error('위치정보 동의 확인 필요');
//     }
//     //위치 추적 퍼미션 확인
//     LocationPermission permission = await Geolocator.checkPermission();
//
//     if(permission == LocationPermission.denied){
//       permission = await Geolocator.requestPermission();
//       if(permission == LocationPermission.denied) {
//         return Future.error('위치 추적 거부당함');
//       }
//     }
//
//     // script : promise == dart : Future
//     Position position = await Geolocator.getCurrentPosition(
//         locationSettings: locationSettings
//     );
//
//     //위경도 변수에 저장하기
//     setState(() {
//       lat = position.latitude.toString();
//       print('lat=$lat');
//       lon = position.longitude.toString();
//       print('lon=$lon');
//     });
//     fetchData();
//   }
//
//   void fetchData()async{
//     print('fetchData stat');
//     //위경도 가져오기
//     if(!(lat == null && lon == null)) {
//       String apikey = 'a6a34fc8155daee0d7a4842e81c53ff5';
//       String url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey';
//       http.Response response = await http.get(Uri.parse(url));
//       if(response.statusCode == 200){
//         var weatherData = jsonDecode(response.body);
//         String description = weatherData['weather'][0]['description'];
//         print('Weather Description: $description');
//       }else{
//         print('Weather data fetch failed: ${response.statusCode}');
//       }
//       print('fetchData stat end');
//
//     }
//
//
//   }
//   //리엑트에 useEffect랑 똘같은아이
//   @override
//   void initState() {
//     super.initState();
//     //위경도 가져오기
//     getLocation();
//     // 날씨정보 얻어오기
//     // fetchData();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       appBar: AppBar(
//         title: Text('Weather App',
//         style: TextStyle(color: Colors.white),),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: Center(
//         child: ElevatedButton(
//             onPressed: (){
//               null;
//               // getLocation();
//             },
//             child: Text('Get My Location',
//             style: TextStyle(color: Colors.black),
//             ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weatherIcon.dart';


class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  var lat;
  var lon;
  var desc; //날씨
  var temp; //온도
  var myCity; // 도시
  var code; // 날씨 코드
  Widget? icon;
  WeatherIcon weatherIcon = WeatherIcon();

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  void getLocation() async{
    print("getLocation start");
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    // 위치 정보 획득 가능한지 확인
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // 위치 추적 퍼미션 확인
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('permissions are denied');
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);

      setState(() {
        lat = position.latitude.toString();
        print('lat = $lat');
        lon = position.longitude.toString();
        print('lon = $lon');
      });
      fetchData();
      print(position);
    } catch (e) {
      print('인터넷이 연결되지 않았습니다.');
    }
    print("getLocation end");
  }


  void fetchData() async{
    print("fetchData start");

    String apiKey = '677e05f3e8d30f9a9b7a20fa3fb8825c';
    String url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';
    // String url =
    //     'https://api.openweathermap.org/data/2.5/weather?lat=37.5502617&lon=126.9970817&appid=677e05f3e8d30f9a9b7a20fa3fb8825c';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var weatherData = jsonDecode(response.body);
      String description = weatherData['weather'][0]['description'];
      int condition = weatherData['weather'][0]['id'];
      double temperature = weatherData['main']['temp'];
      String cityName = weatherData['name'];
      // 날씨 정보 활용
      print(weatherData.toString());
      print(description);
      print(temperature);
      print(cityName);
      print('condition = ${condition}');

      setState(() {
        desc = description;
        temp = (temperature - 273.15).toStringAsFixed(1); ;
        myCity = cityName;
        code = condition;
        icon = weatherIcon.getWeatherIcon(code);
      });
    } else {
      // 에러 처리
      print('오류 남.');
    }
    print("fetchData end");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (myCity == null || temp == null || desc == null)
                  ? CircularProgressIndicator()
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(myCity.toString(),
                    style: TextStyle(fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),),
                  SizedBox(height: 20,),
                  Text('${temp.toString()}\u2103', style: TextStyle(fontSize: 85,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),),
                  SizedBox(height: 20,),
                  icon != null? icon as Widget : Text("데이터 없음"),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ Navigator.pop(context); },
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(50)
            )
        ),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}