import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/values/themes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileAvatar extends StatefulWidget {
  final String photoUrl;

  const ProfileAvatar(this.photoUrl);

  @override
  _ProfileAvatarState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  String _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        gradient: primaryGradient,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Container(
          width: 105,
          height: 105,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: GestureDetector(
            onTap: () {
              _pickImage();
            },
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: _getImageView(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getImageView() {
    if (_selectedImage == null) {
      if (widget.photoUrl == null) {
        return Image.asset(
          "placeholder",
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        );
      } else {
        return CachedNetworkImage(
          imageUrl: widget.photoUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        );
      }
    } else {
      return Image.file(
        File(_selectedImage),
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    }
  }

  _pickImage() {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return CupertinoActionSheet(
              cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancle',
                ),
              ),
              actions: <Widget>[
                CupertinoButton(
                  child: Text(
                    'Camera',
                  ),
                  onPressed: () {
                    _checkCameraPermission();
                  },
                ),
                CupertinoButton(
                  child: Text('Gallery'),
                  onPressed: () {
                    _checkGalleryPermission();
                  },
                ),
              ],
            );
          });
    } else {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Center(
                  child: Text(
                    'Camera',
                  ),
                ),
                onTap: () {
                  _checkCameraPermission();
                },
              ),
              Divider(height: 1),
              ListTile(
                title: Center(
                  child: Text(
                    'Gallery',
                  ),
                ),
                onTap: () {
                  _checkGalleryPermission();
                },
              ),
            ],
          );
        },
      );
    }
  }

  _checkCameraPermission() async {
    Navigator.pop(context);
    PermissionStatus status = await _getPermissionForCamera();
    switch (status) {
      case PermissionStatus.granted:
        _openImagePicker(ImageSource.camera);
        break;
      case PermissionStatus.denied:
        if (Platform.isIOS) {
          _enablePermission();
        } else if (Platform.isAndroid) {
          _disAllowPermission();
        }
        break;
      case PermissionStatus.undetermined:
        _disAllowPermission();
        break;
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.restricted:
        _enablePermission();
        break;
      default:
        break;
    }
  }

  Future<PermissionStatus> _getPermissionForCamera() async {
    Permission permission = Permission.camera;
    PermissionStatus status = await permission.status;

    if (status == PermissionStatus.undetermined ||
        status == PermissionStatus.denied) {
      return await permission.request();
    } else {
      return status;
    }
  }

  _disAllowPermission() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Permisson disallow"),
          content: Text("You have disable your permission."),
          actions: [
            FlatButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: Text('Cancle'),
            ),
          ],
        );
      },
    );
  }

  _enablePermission() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enable permission"),
          content: Text(
              "Go to setting and enable your camera and gallery permission."),
          actions: [
            FlatButton(
              onPressed: () async {
                openAppSettings();
              },
              child: Text('Setting'),
            ),
            FlatButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: Text('Cancle'),
            ),
          ],
        );
      },
    );
  }

  _checkGalleryPermission() async {
    Navigator.pop(context);
    PermissionStatus status = await _getPermissionForGallery();
    switch (status) {
      case PermissionStatus.granted:
        _openImagePicker(ImageSource.gallery);
        break;
      case PermissionStatus.denied:
        if (Platform.isIOS) {
          _enablePermission();
        } else if (Platform.isAndroid) {
          _disAllowPermission();
        }
        break;
      case PermissionStatus.undetermined:
        _disAllowPermission();
        break;
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.restricted:
        _enablePermission();
        break;
      default:
        break;
    }
  }

  Future<PermissionStatus> _getPermissionForGallery() async {
    Permission permission =
        Platform.isAndroid ? Permission.storage : Permission.photos;
    PermissionStatus status = await permission.status;

    if (status == PermissionStatus.undetermined ||
        status == PermissionStatus.denied) {
      return await permission.request();
    } else {
      return status;
    }
  }

  _openImagePicker(ImageSource sorce) async {
    PickedFile selctedFile = await ImagePicker().getImage(source: sorce);
    if (selctedFile != null) {
      setState(() {
        _selectedImage = selctedFile.path;
      });
    }
  }
}
