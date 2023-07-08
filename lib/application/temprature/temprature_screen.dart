import 'package:be_smart/application/home/list_and_constants.dart';
import 'package:be_smart/application/temprature/widgets.dart';
import 'package:flutter/material.dart';

class TempratureScreen extends StatelessWidget {
  const TempratureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            children: [
              const TempAppBar(),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Statusbutton(
                    iconname: 'lib/icons/icons8-temperature-24.png',
                    statusbarname: 'Temprature',
                    colour: Colors.white,
                    containercolor: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Statusbutton(
                      iconname: 'lib/icons/icons8-bar-chart-32.png',
                      colour: Colors.black,
                      statusbarname: 'Statistics',
                      containercolor: Colors.white)
                ],
              ),
              SizedBox(
                width: 200.0,
                height: 200.0,
                child: CustomPaint(
                  painter: HalfCirclePainter(),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'current temprature',
                        style: TextStyle(color: kInactiveColour, fontSize: 15),
                      ),
                      TempratureDropdown()
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'current humidity',
                        style: TextStyle(color: kInactiveColour, fontSize: 15),
                      ),
                      HumidityDropDown()
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TempratureControler(
                    tempraturecontrolname: 'Heating',
                    temprature: '22c',
                    containercolor: Colors.black,
                    textcolor: Colors.white,
                  ),
                  TempratureControler(
                    tempraturecontrolname: 'Cooling',
                    temprature: '18c',
                    containercolor: Colors.white,
                    textcolor: Colors.black,
                  ),
                  TempratureControler(
                    tempraturecontrolname: 'AirWave',
                    temprature: '20c',
                    containercolor: Colors.white,
                    textcolor: Colors.black,
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

class TempratureControler extends StatelessWidget {
  const TempratureControler({
    super.key,
    required this.tempraturecontrolname,
    required this.temprature,
    required this.textcolor,
    required this.containercolor,
  });
  final String tempraturecontrolname;
  final String temprature;
  final Color textcolor;
  final Color containercolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          color: containercolor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            tempraturecontrolname,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: textcolor),
          ),
          Text(
            temprature,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: textcolor),
          )
        ],
      ),
    );
  }
}

class Statusbutton extends StatelessWidget {
  const Statusbutton({
    super.key,
    required this.iconname,
    required this.colour,
    required this.statusbarname,
    required this.containercolor,
  });
  final String iconname;
  final Color colour;
  final String statusbarname;
  final Color containercolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 130,
      decoration: BoxDecoration(
          color: containercolor, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Image.asset(
                iconname,
                color: colour,
              ),
            ),
            Text(
              statusbarname,
              // ignore: prefer_const_constructors
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: colour),
            )
          ],
        ),
      ),
    );
  }
}

class TempAppBar extends StatelessWidget {
  const TempAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        const Column(
          children: [
            Text(
              'Temprature',
              style: TextStyle(fontSize: 30),
            ),
            Text('livingroom')
          ],
        ),
        const Icon(Icons.more_vert)
      ],
    );
  }
}
