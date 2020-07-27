import 'package:flutter/material.dart';
import 'package:highvibe/modules/wallet/resources/app_colors.dart';
import 'package:highvibe/modules/wallet/pages/auth/passcode/passcode_page.dart';

class FacePage extends StatefulWidget {
  @override
  FacePageState createState() => FacePageState();
}

class FacePageState extends State<FacePage> {
  @override
  void initState() {
    super.initState();
  }

  void onPassCode() {
    Navigator.push(
      context,
      MaterialPageRoute<PassCodePage>(builder: (context) => PassCodePage()),
    );
  }

  Widget buildMain() {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: height * 0.10),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const CircularProgressIndicator(),
          // Image.asset(
          //   'assets/icons/faceid.png',
          //   width: 63,
          //   height: 63,
          // ),
          const Padding(
            padding: EdgeInsets.only(top: 34),
            child: Text(
              'Authorize to continue',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 24),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'HV Wallet',
              style: TextStyle(color: AppColors.textGrey, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: const BackButton(color: Colors.white),
          ),
          buildMain()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FlatButton(
        onPressed: onPassCode,
        child: const Text(
          'Use Passcode',
          style: TextStyle(color: AppColors.textBlue, fontSize: 18),
        ),
      ),
    );
  }
}
