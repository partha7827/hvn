// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/wallet/utils/scanner_utils.dart';
import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'utils/detector_painters.dart';

typedef OnScanned = void Function(String address);

class QRCodeReaderPage extends StatefulWidget {
  QRCodeReaderPage(
      {this.title = '', this.onScanned, this.closeWhenScanned = true});
  final OnScanned onScanned;
  final bool closeWhenScanned;
  final String title;

  @override
  State<StatefulWidget> createState() => _QRCodeReaderPageState();
}

class _QRCodeReaderPageState extends State<QRCodeReaderPage> {
  static final RegExp _basicAddress =
      RegExp(r'^(0x)?[0-9a-f]{40}', caseSensitive: false);
  List<Barcode> _scanResults;
  CameraController _camera;
  bool _isDetecting = false;
  CameraLensDirection _direction = CameraLensDirection.back;

  final BarcodeDetector _barcodeDetector =
      FirebaseVision.instance.barcodeDetector();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    final description = await ScannerUtils.getCamera(_direction);

    _camera = CameraController(
      description,
      defaultTargetPlatform == TargetPlatform.iOS
          ? ResolutionPreset.low
          : ResolutionPreset.medium,
      enableAudio: false,
    );
    await _camera.initialize();

    await _camera.startImageStream((CameraImage image) {
      if (_isDetecting) return;

      _isDetecting = true;

      ScannerUtils.detect(
        image: image,
        detectInImage: _barcodeDetector.detectInImage,
        imageRotation: description.sensorOrientation,
      ).then((dynamic results) => results as List<Barcode>).then(
        (List<Barcode> results) {
          setState(() {
            _scanResults = results
                .where((item) => _basicAddress.hasMatch(item.displayValue))
                .toList();
          });
        },
      ).whenComplete(() {
        if (_scanResults.isNotEmpty) {
          if (widget.onScanned != null) {
            widget.onScanned(_scanResults.first.displayValue);
          }

          if (widget.closeWhenScanned) {
            _isDetecting = true; // stop looping

            Future.delayed(const Duration(seconds: 1), () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            });

            return;
          }
        }
        _isDetecting = false;
      });
    });
  }

  Widget _buildResults() {
    if (_scanResults == null ||
        _camera == null ||
        !_camera.value.isInitialized) {
      return Container();
    }

    final imageSize = Size(
      _camera.value.previewSize.height,
      _camera.value.previewSize.width,
    );

    return CustomPaint(
      painter: BarcodeDetectorPainter(imageSize, _scanResults),
    );
  }

  Widget _buildImage() {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: _camera == null
          ? const Center(
              child: Text('Initialising camera, please wait.'),
            )
          : Stack(
              fit: StackFit.expand,
              children: <Widget>[
                CameraPreview(_camera),
                _buildResults(),
              ],
            ),
    );
  }

  void _toggleCameraDirection() async {
    if (_direction == CameraLensDirection.back) {
      _direction = CameraLensDirection.front;
    } else {
      _direction = CameraLensDirection.back;
    }

    await _camera.stopImageStream();
    await _camera.dispose();

    setState(() {
      _camera = null;
    });

    _initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const ImageIcon(
            AssetImage('assets/images/back.png'),
          ),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bkg1.png'),
                fit: BoxFit.fill,
              ),
            ),
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width,
            child: null,
          ),
          Expanded(
            child: _buildImage(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff515151),
        onPressed: _toggleCameraDirection,
        child: _direction == CameraLensDirection.back
            ? const Icon(Icons.camera_front)
            : const Icon(Icons.camera_rear),
      ),
    );
  }

  @override
  void dispose() {
    _camera.dispose().then((_) {
      _barcodeDetector.close();
    });

    super.dispose();
  }
}
