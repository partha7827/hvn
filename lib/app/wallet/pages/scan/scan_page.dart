import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/app/wallet/resources/app_colors.dart';

class ScanPage extends StatefulWidget {

  @override
  ScanPageState createState() => ScanPageState();
}

class ScanPageState extends State<ScanPage> {
  CameraController cameraController;

  @override
  void initState() {
    super.initState();
    // availableCameras().then((res) {
    //   setState(() {
    //     cameraController = CameraController(res[0], ResolutionPreset.medium);        
    //   });
    // });
  }

  void onCancel() {
    Navigator.pop(context);
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundDarkBlue,
      title: Text('Scan QR Code'),
    );
  }

  Widget buildScan() {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(40),
      child: Image.asset('assets/images/camera_frame.png',
        width: width,
        height: width,
      ),
    );
    // if (cameraController != null && cameraController.value.isInitialized) {
    //   return Container(
    //     child: CameraPreview(cameraController)
        
    //   );
    // } else {
    //   return Container();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      appBar: buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.only(top:20),
            child: Text('Point at HighVibe QR Code to Send',
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: 16
              ),
            )
          ),
          buildScan(),
          FlatButton(
            onPressed: onCancel,
            child: Column(
              children: [
                Text('Cancel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2)
                  ),
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(top: 15, bottom: 10),
                  child: Icon(Icons.close, color: Colors.white),
                ),
              ]
            )
          ),
        ],
      ),
    );
  }
}