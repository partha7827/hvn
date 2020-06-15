import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/journal/journal_controller.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class JournalPage extends StatefulWidget {
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends ModularState<JournalPage, JournalController>
    with WidgetsBindingObserver {
  CameraController _controller;
  String imagePath;
  VideoPlayerController videoController;
  VoidCallback videoPlayerListener;
  bool enableAudio = true;

  List<CameraDescription> cameras = [];
  bool isRotateClicked = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void logError(String code, String message) =>
      print('Error: $code\nError Message: $message');

  @override
  void initState() {
    super.initState();
    _fetchCameras();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<Null> _fetchCameras() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    try {
      final cameras = await availableCameras();
      if (_controller == null) {
        _controller = CameraController(cameras[0], ResolutionPreset.veryHigh);
        await _controller.initialize();
        setState(() {});
      }
    } on CameraException catch (e) {
      logError(e.code, e.description);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (_controller == null || !_controller.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (_controller != null) {
        onNewCameraSelected(_controller.description);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: Stack(
          overflow: Overflow.visible,
          fit: StackFit.expand,
          children: <Widget>[
            _cameraPreviewWidget(),
            _buildDraggableScrollableSheet(),
            _headerControlWidget(),
            _cameraBottomView(),
          ],
        ),
      ),
    );
  }

  Widget _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                final _opacity = _getOpacity(scrollController);
                return Opacity(
                  opacity: _opacity,
                  child: Container(
                    color: primaryColor,
                    height: 60,
                  ),
                );
              },
            ),
          ),
        );
      },
      initialChildSize: 0.15,
      minChildSize: 0.15,
      maxChildSize: 1,
    );
  }

  double _getOpacity(ScrollController scrollController) {
    var _opacity =
        ((scrollController.position.viewportDimension / 80).round()) / 10;
    if (_opacity > 1.0) {
      _opacity = 1.0;
    } else if (_opacity < 0.25) {
      _opacity = 0;
    }
    return _opacity;
  }

  Widget _cameraPreviewWidget() {
    if (_controller == null || !_controller.value.isInitialized) {
      return const SizedBox();
    } else {
      return CameraPreview(_controller);
    }
  }

  Widget _headerControlWidget() {
    return Positioned(
      top: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 80,
        width: screenWidth(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset('assets/ic_camera_close.svg'),
              onPressed: () => Modular.to.pop(),
            ),
            IconButton(
              icon: SvgPicture.asset('assets/ic_camera_settings.svg'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _cameraBottomView() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        children: [
          _galleryView(),
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: _captureControlRowWidget(),
          ),
          _bottomTextButton(),
        ],
      ),
    );
  }

  Widget _galleryView() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_up,
            ),
            onPressed: () {},
          ),
          Container(
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 12,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 70,
                    height: 70,
                    margin: const EdgeInsets.all(5),
                    child: Image.asset('assets/ic_avatar.jpg'),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _captureControlRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          child: IconButton(
              icon: SvgPicture.asset('assets/ic_flash.svg'), onPressed: () {}),
        ),
        GestureDetector(
          onTap: () {
            onTakePictureButtonPressed();
          },
          child: Container(
            width: 88,
            height: 88,
            child: SvgPicture.asset('assets/ic_capture.svg'),
          ),
        ),
        Container(
          child: IconButton(
            icon: SvgPicture.asset('assets/ic_rotate.svg'),
            onPressed: _toggleCamera,
          ),
        ),
      ],
    );
  }

  void _toggleCamera() {
    if (_controller != null) {
      isRotateClicked = !isRotateClicked;
      if (!isRotateClicked) {
        onNewCameraSelected(CameraDescription(
            name: '0',
            lensDirection: CameraLensDirection.back,
            sensorOrientation: 90));
      } else {
        onNewCameraSelected(CameraDescription(
            name: '1',
            lensDirection: CameraLensDirection.front,
            sensorOrientation: 270));
      }
    }
  }

  Widget _bottomTextButton() {
    return Container(
      color: primaryColor.withOpacity(0.7),
      height: 55,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
                child: Text(
              Strings.create,
              style: normal14White,
            )),
          ),
          Expanded(
            flex: 1,
            child: Center(
                child: Text(
              Strings.normal,
              style: normal14White,
            )),
          ),
        ],
      ),
    );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (_controller != null) {
      await _controller.dispose();
    }
    _controller = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      enableAudio: enableAudio,
    );

    // If the controller is updated then update the UI.
    _controller.addListener(() {
      if (mounted) setState(() {});
      if (_controller.value.hasError) {
        showInSnackBar('Camera error ${_controller.value.errorDescription}');
      }
    });

    try {
      await _controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void onTakePictureButtonPressed() {
    takePicture().then((String filePath) {
      if (mounted) {
        setState(() {
          imagePath = filePath;
          videoController?.dispose();
          videoController = null;
        });
        if (filePath != null) showInSnackBar('Picture saved to $filePath');
      }
    });
  }

  Future<String> takePicture() async {
    if (!_controller.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
    final extDir = await getApplicationDocumentsDirectory();
    final dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final filePath = '$dirPath/${timestamp()}.jpg';

    if (_controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await _controller.takePicture(filePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}
