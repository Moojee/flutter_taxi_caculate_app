// ignore_for_file: sort_child_properties_last, prefer_final_fields, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_taxi_calculate_app/views/taxi_result_ui.dart';
import 'package:flutter/services.dart';

class TaxiHomeUI extends StatefulWidget {
  const TaxiHomeUI({super.key});

  @override
  State<TaxiHomeUI> createState() => _TaxiHomeUIState();
}

class _TaxiHomeUIState extends State<TaxiHomeUI> {
  //สร้างตัวแปรควบคุม textfilde
  TextEditingController _carKmCtrl = TextEditingController();
  TextEditingController _carMinCtrl = TextEditingController();

  _warniingDialog(msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'คำเตือน',
        ),
        content: Text(
          msg,
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
            ),
          ),
        ],
      ),
    );
  }

  // สร้่างเมธตอด Dialog แจ้งเตือน

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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 50.0,
              right: 50.0,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 25.0,
                ),
                Image.asset(
                  'assets/images/Taxi2.png',
                  width: 200.0,
                ),
                SizedBox(
                  height: 70.0,
                ),
                TextField(
                  controller: _carKmCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d{0,2}')),
                  ],
                  decoration: InputDecoration(
                    labelText: 'ระยะทาง (กิโลเมตร)',
                    hintText: 'ป้อนระยะทาง',
                    suffixText: 'กิโลเมตร',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextField(
                  controller: _carMinCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d{0,2}')),
                  ],
                  decoration: InputDecoration(
                    labelText: 'เวลารถติด (นาที)',
                    hintText: 'ป้อนเวลารถติด (ไม่มีป้อน 0)',
                    suffixText: 'นาที',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 70.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate UI หากมีปัญหา ให้แสดง Dialg แจ้งเตือน
                    if (_carKmCtrl.text.isEmpty) {
                      _warniingDialog('ป้อนระยะทางด้วย!');
                    } else if (_carMinCtrl.text.isEmpty) {
                      _warniingDialog('ป้อนเวลารถติดด้วย!');
                    } else {
                      // พร้อมคำณวน

                      //แปลง text เป็นตัวเลข
                      double carKm = double.parse(_carKmCtrl.text);
                      double carMin = double.parse(_carMinCtrl.text);

                      // 1 กิโลเมตรแรก = กิโลละ 35 บาท กิโลเมตรต่อไป กิโลเมตรละ 5.50 // รถติดคิดเพิ่มนาทีละ 0.50
                      // - 1 กม. แรก = 35 บาท
                      // - กม. ถัดไป = 5.50 บาท/กม.
                      // - รถติด คิดเพิ่มนาทีละ 0.50 บาท
                      double fare = 0;
                      if (carKm <= 1) {
                        fare = 35;
                      } else {
                        fare = 35 + ((carKm - 1) * 5.5);
                      }
                      fare += carMin * 0.5;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaxiResultUI(
                            distance: carKm,
                            trafficTime: carMin,
                            totalFare: fare,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'คำนวณ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      55,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _carKmCtrl.clear();
                      _carMinCtrl.clear();
                    });
                  },
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      55,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
