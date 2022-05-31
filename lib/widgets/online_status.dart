import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:connectivity_plus/connectivity_plus.dart';

class OnlineStatus extends StatefulWidget {
  const OnlineStatus({Key? key}) : super(key: key);

  @override
  _OnlineStatusState createState() => _OnlineStatusState();
}

class _OnlineStatusState extends State<OnlineStatus> {
  dynamic _connection;
  bool _hasNetwork = false;

  @override
  void initState() {
    super.initState();
    _connection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile ||
            result == ConnectivityResult.ethernet) {
          _hasNetwork = true;
        } else {
          _hasNetwork = false;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _connection.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // @Bug: connectivity_plus has limited support for web. Check back in over time:
    // https://pub.dev/packages/connectivity_plus#limitations-on-the-web-platform
    return _hasNetwork == false && !kIsWeb
        ? Container(
            width: double.infinity,
            height: 30,
            color: Colors.red[200],
            child: const Center(
              child: Text('No network connection'),
            ),
          )
        : Container();
  }
}
