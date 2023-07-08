import 'dart:math';

import 'package:be_smart/application/cubit/switch_cubit.dart';
import 'package:be_smart/application/home/home_widgets.dart';
import 'package:be_smart/application/home/list_and_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustumAppBar(),
            const UserName(
              name: 'david yesudas',
            ),
            const Text(
              'Smart Devices',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: BlocBuilder<SwitchesCubit, List<SwitchState>>(
                builder: (context, state) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.2,
                    ),
                    itemCount: devicelist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DeviceSwitchBox(
                          deviceicon: devicelist[index].iconimage,
                          devicename: devicelist[index].devicename,
                          switchvalue: state[index] == SwitchState.on,
                          switchbutton: Transform.rotate(
                              angle: -pi / 2,
                              child: Switch(
                                inactiveTrackColor: const Color(0xffDAE2E9),
                                activeTrackColor: Colors.white,
                                inactiveThumbColor: Colors.white,
                                activeColor: Colors.black,
                                value: state[index] == SwitchState.on,
                                onChanged: (_) => context
                                    .read<SwitchesCubit>()
                                    .toggleSwitch(index),
                              )),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}

class DeviceSwitchBox extends StatelessWidget {
  const DeviceSwitchBox({
    super.key,
    required this.deviceicon,
    required this.devicename,
    required this.switchbutton,
    required this.switchvalue,
  });

  final String deviceicon;
  final String devicename;
  final Widget switchbutton;
  final bool switchvalue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchesCubit, List<SwitchState>>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              color: switchvalue ? Colors.black : const Color(0xffF6F8FC),
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'lib/icons/icons8-pendant-light-64.png',
                  color: switchvalue ? Colors.white : Colors.black,
                  height: 50,
                  width: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Smart',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: switchvalue ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          'light',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: switchvalue ? Colors.white : Colors.black,
                          ),
                        )
                      ],
                    ),
                    switchbutton
                  ],
                )
              ],
            ),
          ),
          // height: 140,
          // width: 120,
        );
      },
    );
  }
}
