import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/res/auth_meth.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/res/firestore_methords.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JitsiMeetMethord {
  final AuthMeth _authMeth = AuthMeth();
  final FirestoreMethods _firestoreMethords = FirestoreMethods();
  void createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      String userName = '',
      required isVideoMuted}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name;
      if (userName == '') {
        name = _authMeth.user.displayName!;
      } else {
        name = userName;
      }

      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userEmail = _authMeth.user.email
        ..userAvatarURL = _authMeth.user.photoURL // or .png
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
      _firestoreMethords.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }
}
