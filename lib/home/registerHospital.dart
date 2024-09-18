import 'package:flutter/material.dart';

class RegisterHospital extends StatefulWidget {
  const RegisterHospital({super.key});

  @override
  State<RegisterHospital> createState() => _RegisterHospitalState();
}

class _RegisterHospitalState extends State<RegisterHospital> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ลงทะเบียนเพื่อเลืกสถานพยาบาล',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/332211.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
