// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class cameraModule {
  final String cameruid;
  final bool isTalk;
  final bool isFalsLight;
  final bool isSwitch;
  final List usersToCamera;
  cameraModule({
    required this.cameruid,
    required this.isTalk,
    required this.isFalsLight,
    required this.isSwitch,
    required this.usersToCamera,
  });

  cameraModule copyWith({
    String? cameruid,
    bool? isTalk,
    bool? isFalsLight,
    bool? isSwitch,
    List? usersToCamera,
  }) {
    return cameraModule(
      cameruid: cameruid ?? this.cameruid,
      isTalk: isTalk ?? this.isTalk,
      isFalsLight: isFalsLight ?? this.isFalsLight,
      isSwitch: isSwitch ?? this.isSwitch,
      usersToCamera: usersToCamera ?? this.usersToCamera,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cameruid': cameruid,
      'isTalk': isTalk,
      'isFalsLight': isFalsLight,
      'isSwitch': isSwitch,
      'usersToCamera': usersToCamera,
    };
  }

  factory cameraModule.fromMap(Map<String, dynamic> map) {
    return cameraModule(
        cameruid: map['cameruid'] as String,
        isTalk: map['isTalk'] as bool,
        isFalsLight: map['isFalsLight'] as bool,
        isSwitch: map['isSwitch'] as bool,
        usersToCamera: List.from(
          (map['usersToCamera'] as List),
        ));
  }

  @override
  String toString() {
    return 'cameraModule(cameruid: $cameruid, isTalk: $isTalk, isFalsLight: $isFalsLight, isSwitch: $isSwitch, usersToCamera: $usersToCamera)';
  }

  @override
  bool operator ==(covariant cameraModule other) {
    if (identical(this, other)) return true;

    return other.cameruid == cameruid &&
        other.isTalk == isTalk &&
        other.isFalsLight == isFalsLight &&
        other.isSwitch == isSwitch &&
        listEquals(other.usersToCamera, usersToCamera);
  }

  @override
  int get hashCode {
    return cameruid.hashCode ^
        isTalk.hashCode ^
        isFalsLight.hashCode ^
        isSwitch.hashCode ^
        usersToCamera.hashCode;
  }
}
