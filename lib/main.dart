import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

const appId = '36054cecfadf41d4b691234bf5db59d7';
String channelName = 'test';
String token =
    '007eJxTYBC1aVC4d2zmvGOrK9adVln/u4fl/Grtw01XSjafcane5yqrwGBsZmBqkpyanJaYkmZimGKSZGZpaGRskpRmmpJkapli7jstIK0hkJHhxHdpRkYGCATxWRhKUotLGBgA184hXw==';
int uid = 2; // uid of the local user

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "36054cecfadf41d4b691234bf5db59d7",
      channelName: "test",
      tempToken: token,
    ),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(client: client),
              AgoraVideoButtons(client: client),
            ],
          ),
        ),
      ),
    );
  }
}
