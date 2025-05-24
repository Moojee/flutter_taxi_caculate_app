import 'package:flutter/material.dart';

class TaxiResultUI extends StatefulWidget {
  final double distance;
  final double trafficTime;
  final double totalFare;

  const TaxiResultUI({
    super.key,
    required this.distance,
    required this.trafficTime,
    required this.totalFare,
  });

  @override
  State<TaxiResultUI> createState() => _TaxiResultUIState();
}

class _TaxiResultUIState extends State<TaxiResultUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'คำนวณค่า Taxi',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.0,
            ),
            Image.asset(
              'assets/images/Taxi2.png',
              width: 200.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'ค่า Taxi',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'ระยะทาง: ${widget.distance.toStringAsFixed(2)} กิโลเมตร',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'เวลารถติด: ${widget.trafficTime.toStringAsFixed(0)} นาที',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'รวมทั้งหมด: ${widget.totalFare.toStringAsFixed(2)} บาท',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}
