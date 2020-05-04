import 'package:easy_permission_validator/easy_permission_validator.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/meeting_screen.dart';
import 'package:highvibe/white_page_route.dart';
import 'package:permission_handler/permission_handler.dart';

enum States { initial, granted, denied, microphoneDenied, cameraDenied }

class EnsureMeetingPermission extends StatefulWidget {
  EnsureMeetingPermission();

  @override
  _EnsureMeetingPermissionState createState() =>
      _EnsureMeetingPermissionState();
}

class _EnsureMeetingPermissionState extends State<EnsureMeetingPermission> {
  States currentState = States.initial;

  GlobalKey meetingKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _permissionRequest();
  }

  _permissionRequest() async {
    final permissionValidator = EasyPermissionValidator(
      context: context,
      appName: 'HighVibe',
      customDialog: CameraPermissionPopup(),
    );
    var camera = await permissionValidator.camera();
    var microphone = await permissionValidator.microphone();
    if (camera && microphone) {
      setState(() => currentState = States.granted);

      Navigator.of(context).pushReplacement(
        WhitePageRoute(
          enterPage: MeetingScreen(key: meetingKey),
        )
      );
    } else if (camera) {
      setState(() => currentState = States.microphoneDenied);
    } else if (microphone) {
      setState(() => currentState = States.cameraDenied);
    } else {
      setState(() => currentState = States.denied);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (currentState) {
      case States.initial:
        child = CircularProgressIndicator();
        break;
      case States.granted:
        child = Text('Granted', style: TextStyle(fontSize: 22));
        break;
      case States.denied:
        child = Text('Denied', style: TextStyle(fontSize: 22));
        break;
      case States.cameraDenied:
        child = Text('Camera Denied', style: TextStyle(fontSize: 22));
        break;
      case States.microphoneDenied:
        child = Text('Microphone Denied', style: TextStyle(fontSize: 22));
        break;
    }

    return Scaffold(
      body: Center(child: child),
    );
  }
}

class CameraPermissionPopup extends StatefulWidget {
  @override
  _CameraPermissionPopupState createState() => _CameraPermissionPopupState();
}

class _CameraPermissionPopupState extends State<CameraPermissionPopup> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: SizedBox(
            height: 300.0,
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'High Vibe',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.perm_camera_mic,
                      size: 60.0,
                      color: Colors.red,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FlatButton.icon(
                          icon: Icon(Icons.cancel),
                          onPressed: () => _closePopup(),
                          label: Text('Cancel'),
                        ),
                        FlatButton.icon(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () => _openPermissionSettings(),
                          label: Text('Go To Settings'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _openPermissionSettings() async {
    await openAppSettings();
    _closePopup();
  }

  _closePopup() {
    Navigator.of(context).pop();
  }
}
