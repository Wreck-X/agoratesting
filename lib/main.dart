import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

const appId = '36054cecfadf41d4b691234bf5db59d7';
String channelName = 'test';
String token =
    '007eJxTYDharqi4eNG1U8L7WfnDTXe4s7zdNoXrKufJbO/TmjmnDxYpMBibGZiaJKcmpyWmpJkYppgkmVkaGhmbJKWZpiSZWqaYm01MTWsIZGS437yKgREKQXwWhpLU4hIGBgAXxh9B';
int uid = 1;

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
      appId: appId,
      channelName: channelName,
      tempToken: token,
      uid: uid,
    ),
    agoraChannelData: AgoraChannelData(
      channelProfileType: ChannelProfileType.channelProfileLiveBroadcasting,
      clientRoleType: ClientRoleType.clientRoleAudience,
    ),
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  //Build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Agora Testing'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.floating,
                enableHostControls: true,
              ),
              AgoraVideoButtons(
                client: client,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
