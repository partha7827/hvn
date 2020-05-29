import 'package:flutter/material.dart';
import 'package:hvn/modules/wallet/resources/app_colors.dart';
import 'package:hvn/modules/wallet/pages/auth/face/face_page.dart';
import 'package:hvn/modules/wallet/pages/wallet/wallet_page.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';


class PassCodePage extends StatefulWidget {

  @override
  PassCodePageState createState() => PassCodePageState();
}

class PassCodePageState extends State<PassCodePage> {

  String text = '';

  @override
  void initState() {
    super.initState();
  }

  void onFaceId() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FacePage()
      ),
    );
  }
  
  void onBack() {
    Navigator.pop(context);
  }

  void onKey(VirtualKeyboardKey key) {
    if (key.action == VirtualKeyboardKeyAction.Backspace) {
      if (text.length > 0) {
        setState(() {
          text = text.substring(0, text.length - 1);
        });
      }
    } else {
      setState(() {
        text += key.text;
      });
    }
    if (text.length >= 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WalletPage()
        ),
      );
    }
  }

  Widget buildMain() {
    return Column(
      children: <Widget>[
        Text('Authorize to continue',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 24
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text('HV Wallet',
            style: TextStyle(
              color: AppColors.textGrey,
              fontSize: 18
            ),
          )
        ),
      ]
    );
  }

  Widget buildDots() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, 
          (index) { 
            if (index  == text.length) {
              return Container(
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: AppColors.buttonGradient,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.backgroundDarkBlue
                  ),
                ),
              );
            } else {
              return Container(
                width: 27,
                height: 27,
                alignment: Alignment.center,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < text.length ? AppColors.textBlue : AppColors.textGrey
                  ),
                )
              );
            }
          }
        )
      ),
    );
  }

  Widget buildKeyboard() {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 25),
          child: FlatButton(
            onPressed: onFaceId,
            child: Text('Use Face ID',
              style: TextStyle(
                color: AppColors.textBlue,
                fontSize: 18
              ),
            ),
          )
        ),
        VirtualKeyboard(
          height: height * 0.3,
          fontSize: 25,
          textColor: Colors.white,
          type: VirtualKeyboardType.Numeric,
          onKeyPress: onKey
        ),
      ]
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
            child: BackButton(
              color: Colors.white,
              onPressed: onBack,
            )
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildMain(),
                buildDots(),
                buildKeyboard(),
              ],
            )
          )
        ],
      ),
    );
  }
}