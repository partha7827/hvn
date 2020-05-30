import 'package:flutter/material.dart';
import 'package:highvibe/modules/wallet/resources/app_colors.dart';
import 'package:highvibe/modules/wallet/pages/widgets/buttons/outline_button.dart'
    as o;

class ReceivePage extends StatefulWidget {
  @override
  ReceivePageState createState() => ReceivePageState();
}

class ReceivePageState extends State<ReceivePage> {
  final TextEditingController textController =
      TextEditingController(text: '18923353cX3452399S');

  @override
  void initState() {
    super.initState();
  }

  void onCancel() {
    Navigator.pop(context);
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundDarkBlue,
      title: const Text('Receive HVN Token'),
    );
  }

  Widget buildQr() {
    return Container(
      margin: const EdgeInsets.all(50),
      child: Image.network(
        'https://qrcode.tec-it.com/API/QRCode?data=18923353cX3452399S&backcolor=%23000222&color=%23ffffff&size=large',
      ),
    );
  }

  Widget buildCode() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: textController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: 'Your Wallet Address',
            labelStyle: TextStyle(color: AppColors.textGrey),
            contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.textGrey, width: 3)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundDarkBlue,
        appBar: buildAppBar(),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildQr(),
            buildCode(),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Text(
                '''Receive Token by providing your unique HighVibe address or QR code to others.''',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Row(children: [
            Expanded(
                child: o.OutlineButton(
              title: 'Download',
              icon: Icon(
                Icons.file_download,
                size: 20,
                color: AppColors.textBlue,
              ),
            )),
            const Padding(padding: EdgeInsets.only(left: 20)),
            Expanded(
                child: o.OutlineButton(
              title: 'Share',
              icon: Icon(
                Icons.share,
                size: 20,
                color: AppColors.textBlue,
              ),
            ))
          ]),
        ));
  }
}
