import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  //variables
  String city = "";
  String date = DateFormat.yMMMd().format(DateTime.now());

  GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    // TODO: implement initState
    getAddress(globalController.getLatitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  //function for getting address
  getAddress(latitude, longitude) async {
    //getting full detail of lat and long with geocoding
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemark[0];
    //since we are using statefull widget ..remember concept
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: TextStyle(
              fontSize: 35,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.topLeft,
          child: Text(
            date.toString(),
            style: TextStyle(fontSize: 20, color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
