import 'package:be_smart/application/cubit/switch_cubit.dart';
import 'package:be_smart/application/home/list_and_constants.dart';
import 'package:be_smart/application/temprature/temprature_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios)),
                  const Icon(Icons.more_vert)
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Devices',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'connected',
                        style: TextStyle(fontSize: 18, color: kInactiveColour),
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<SwitchesCubit, List<SwitchState>>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: devicelist.length,
                      itemBuilder: (context, index) {
                        if (devicelist[index] == devicelist.first) {
                          return DeviceSwitchRow(
                            deviceicon: devicelist[index].iconimage,
                            devicename: devicelist[index].devicename,
                            switchvalue: state[index] == SwitchState.on,
                            roomdata: const RoomDataRow(
                              roomname: ['bedroom', 'livingroom'],
                              colour: kInactiveColour,
                            ),
                            devicecount: Text(
                              '2',
                              style: TextStyle(
                                  color: state[index] == SwitchState.on
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                            switchbutton: Switch(
                              activeColor: Colors.white,
                              activeTrackColor: Colors.black,
                              inactiveTrackColor: kInactiveColour,
                              inactiveThumbColor: Colors.white,
                              value: state[index] == SwitchState.on,
                              onChanged: (_) => context
                                  .read<SwitchesCubit>()
                                  .toggleSwitch(index),
                            ),
                          );
                        }
                        return DeviceSwitchRow(
                          deviceicon: devicelist[index].iconimage,
                          devicename: devicelist[index].devicename,
                          switchvalue: state[index] == SwitchState.on,
                          switchbutton: Switch(
                            activeColor: Colors.white,
                            activeTrackColor: Colors.black,
                            inactiveTrackColor: kInactiveColour,
                            inactiveThumbColor: Colors.white,
                            value: state[index] == SwitchState.on,
                            onChanged: (_) => context
                                .read<SwitchesCubit>()
                                .toggleSwitch(index),
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DeviceSwitchRow extends StatelessWidget {
  const DeviceSwitchRow({
    super.key,
    required this.switchbutton,
    required this.deviceicon,
    required this.devicename,
    required this.switchvalue,
    this.roomdata,
    this.devicecount,
  });
  final Widget switchbutton;
  final String deviceicon;
  final String devicename;
  final bool switchvalue;
  final Widget? roomdata;
  final Widget? devicecount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: switchvalue ? Colors.black : Colors.white),
              height: 100,
              width: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      deviceicon,
                      height: 40,
                      color: switchvalue ? Colors.white : Colors.black,
                    ),
                    devicecount ?? const Text('')
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  switchvalue ? 'connected' : 'not connected',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                Text(
                  "Smart $devicename",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                roomdata ??
                    const RoomDataRow(
                      roomname: ['', ''],
                      colour: Colors.white,
                    )
              ],
            ),
            switchbutton,
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: kInactiveColour,
        )
      ],
    );
  }
}

class RoomDataRow extends StatelessWidget {
  const RoomDataRow({
    super.key,
    required this.roomname,
    required this.colour,
  });
  final List<String> roomname;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Room(
          roomname: roomname[0],
          colour: colour,
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TempratureScreen())),
          child: Room(
            roomname: roomname[1],
            colour: colour,
          ),
        )
      ],
    );
  }
}

class Room extends StatelessWidget {
  const Room({
    super.key,
    required this.roomname,
    required this.colour,
  });
  final String roomname;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 75,
      decoration:
          BoxDecoration(color: colour, borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        roomname,
        style: const TextStyle(fontSize: 12),
      )),
    );
  }
}
