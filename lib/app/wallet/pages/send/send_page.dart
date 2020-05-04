import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:highvibe/app/wallet/resources/app_colors.dart';
import 'package:highvibe/app/wallet/pages/auth/face/face_page.dart';
import 'package:highvibe/app/wallet/pages/wallet/wallet_page.dart';
import 'package:highvibe/app/wallet/pages/widgets/buttons/main_button.dart';
import 'package:highvibe/app/wallet/pages/widgets/buttons/outline_button.dart' as o;
import 'package:highvibe/app/wallet/pages/widgets/containers/user_container.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';


class SendPage extends StatefulWidget {

  @override
  SendPageState createState() => SendPageState();
}

class SendPageState extends State<SendPage> {

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

  void onCancel() {
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
      if (text.length < 5) {
        setState(() {
          text += key.text;
        });
      }
    }
  }

  void onSend() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return buildConfirm();
      }
    );
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundDarkBlue,
      title: Text('Sending to '),
    );
  }

  Widget buildConfirm() {
    final width = MediaQuery.of(context).size.width;
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 100),
          padding: EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildText(color: Colors.black),
              buildUser(textColor: Colors.black),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: AppColors.textGrey,
                    ),
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.red.withOpacity(0.8)
                    ),
                    child: Icon(Icons.arrow_upward,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
              buildUser(textColor: Colors.black),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: o.OutlineButton(
                        title: 'Cancel',
                        icon: Icon(Icons.close,
                          color: AppColors.textBlue,
                        ),
                        onPressed: onCancel,
                      )
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Expanded(
                      child: MainButton(
                        title: 'Confirm',
                        icon: Icon(Icons.check,
                          color: Colors.white,
                        ),
                        onPressed: onCancel,
                      )
                    )
                  ],
                ),
              )
            ],
          )
        )
      )
    );
  }

  Widget buildUser({Color textColor = Colors.white}) {
    return UserContainer(
      margin: EdgeInsets.only(bottom: 20, right: 20, left: 20, top: 20), 
      textColor: textColor
    );
  }

  Widget buildText({Color color = Colors.white}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(text.length > 0 ? text : '0.0', 
            style: TextStyle(
              color: text.length > 0 ? color : AppColors.textGrey,
              fontSize: 60
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10, left: 10),
            child: Text('HVN', 
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: 18
              ),
            )
          )
        ],
      )
    );
  }

  Widget buildKeyboard() {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        text.length > 0 ?
        MainButton(
          title: 'Send',
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
          icon: Icon(Icons.check, color: Colors.white),
          onPressed: onSend,
        ) : 
        Container(height: 78),
        Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: VirtualKeyboard(
            height: height * 0.3,
            fontSize: 25,
            textColor: Colors.white,
            type: VirtualKeyboardType.Numeric,
            onKeyPress: onKey
          )
        ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildUser(),
                buildText(),
                buildKeyboard(),
              ],
            )
          )
        ],
      ),
    );
  }
}