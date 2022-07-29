
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/Screens/videoCallScreen.dart';
import 'package:zoom_clone/res/jitsi_meeting_methords.dart';

import '../Widgets/homeMeetingButton.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);
  final JitsiMeetMethord _jitsiMeetMethord = JitsiMeetMethord();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethord.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: createNewMeeting,
              icon: (Icons.videocam),
              text: 'New Meeting',
            ),
            HomeMeetingButton(
              onPressed:() =>  joinMeeting(context),
              icon: (Icons.add_box_rounded),
              text: 'join Meeting',
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: (Icons.calendar_today),
              text: 'Schedule Meeting',
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: (Icons.arrow_upward_rounded),
              text: 'Share Screen',
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create /Join Meetings with just a click',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
