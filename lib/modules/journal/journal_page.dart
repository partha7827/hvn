import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/journal/journal_controller.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
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

  List<dynamic> allImage = [];

  double _opacity = 0.0;
  int selectedCameraIdx;
  int currentPage = 0;
  int lastPage;
  List<Widget> temp = [];

  void logError(String code, String message) =>
      print('Error: $code\nError Message: $message');

  @override
  void initState() {
    super.initState();
    _fetchCameras();
    _fetchGalleryImages();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<Null> _fetchCameras() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    try {
      final cameras = await availableCameras();
      if (_controller == null) {
        _controller = CameraController(cameras[0], ResolutionPreset.veryHigh);
        await _controller.initialize();
        setState(() {
          selectedCameraIdx = 0;
        });
      }
    } on CameraException catch (e) {
      logError(e.code, e.description);
    }
  }

  Future<Null> _fetchGalleryImages() async {
    lastPage = currentPage;
    final result = await PhotoManager.requestPermission();
    if (result) {
      // success
      final albums = await PhotoManager.getAssetPathList(onlyAll: true);
      final media = await albums[0].getAssetListPaged(currentPage, 60);

      temp = [];

      for (var asset in media) {
        temp.add(
          FutureBuilder(
            future: asset.thumbDataWithSize(200, 200),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.memory(
                        snapshot.data,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (asset.type == AssetType.video)
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5, bottom: 5),
                          child: Icon(
                            Icons.videocam,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                );
              }
              return Container();
            },
          ),
        );
      }

      setState(() {
        allImage.addAll(temp);
        currentPage++;
      });
    } else {
      PhotoManager.openSetting();
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  
      /// to open android/ios applicaton's setting to get permission
    }
  }

  void _handleScrollEvent(OverscrollIndicatorNotification scroll) {
    if (currentPage != lastPage) {
      _fetchGalleryImages();
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
          ],
        ),
      ),
    );
  }

  Widget _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      builder: (BuildContext context, ScrollController scrollController) {
        if (scrollController.hasClients) {
          _opacity = _getOpacity(scrollController);
        }

        return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            _handleScrollEvent(overscroll);
            overscroll.disallowGlow();
            return true;
          },
          child: CustomScrollView(
            physics:
                allImage.isEmpty ? const NeverScrollableScrollPhysics() : null,
            controller: scrollController,
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: allImage.isEmpty ? 1 : 1 - _opacity,
                      child: Container(
                        height: screenHeight(context) * 0.8,
                        alignment: Alignment.bottomCenter,
                        child: Stack(
                          children: <Widget>[
                            _cameraBottomView(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverGrid.count(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                children: List.generate(
                  allImage.length,
                  (index) {
                    return Visibility(
                      visible: _opacity != 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
                          child: allImage[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      initialChildSize: 0.8,
      minChildSize: 0.8,
      maxChildSize: 1,
    );
  }

  double _getOpacity(ScrollController scrollController) {
    if (scrollController.position.viewportDimension >
        0.85 * MediaQuery.of(context).size.height) {
      _opacity = 1;
    } else {
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
          Visibility(visible: allImage.isNotEmpty, child: _galleryView()),
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
            icon: const Icon(
              Icons.keyboard_arrow_up,
            ),
            onPressed: () {},
          ),
          Container(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: allImage.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.all(5),
                  child: allImage[index],
                );
              },
            ),
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

  void _toggleCamera() async {
    if (_controller != null) {
      try {
        final cameras = await availableCameras();
        selectedCameraIdx =
            selectedCameraIdx < cameras.length - 1 ? selectedCameraIdx + 1 : 0;
        final selectedCamera = cameras[selectedCameraIdx];
        onNewCameraSelected(selectedCamera);
      } on CameraException catch (e) {
        logError(e.code, e.description);
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
