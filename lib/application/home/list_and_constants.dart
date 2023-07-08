import 'package:be_smart/application/home/device_entity.dart';
import 'package:flutter/material.dart';

List<DeviceEntity> devicelist = [
  DeviceEntity('lib/icons/icons8-pendant-light-64.png', 'Light', true),
  DeviceEntity('lib/icons/icons8-air-conditioner-50.png', 'Ac', false),
  DeviceEntity('lib/icons/icons8-smart-tv-24.png', 'Tv', false),
  DeviceEntity('lib/icons/icons8-fan-speed-32.png', 'Fan', false),
];

const kInactiveColour = Color(0xffA1A1AC);
