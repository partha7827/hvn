import 'package:flutter/material.dart';
import 'package:highvibe/app/wallet/resources/app_colors.dart';
import 'package:highvibe/app/wallet/pages/scan/scan_page.dart';
import 'package:highvibe/app/wallet/pages/send/send_page.dart';
import 'package:highvibe/app/wallet/pages/widgets/containers/user_container.dart';

class UsersPage extends StatefulWidget {

  @override
  UsersPageState createState() => UsersPageState();
}

class UsersPageState extends State<UsersPage> {


  @override
  void initState() {
    super.initState();
  }

  void onBack() {
    Navigator.pop(context);
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundDarkBlue,
      title: Text('Transfer token'),
    );
  }

  void onQr() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScanPage()
      ),
    );
  }

  void onUser() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SendPage()
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: 48,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: AppColors.backgroundLightBlue,
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  isDense: false,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(),
                    child: Icon(Icons.search, color: AppColors.textGrey),
                  ),
                  focusedBorder: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: AppColors.textGrey
                  )
                ),
                
              )
            ) 
          ),
          InkWell(
            onTap: onQr,
            child: Container(
              height: 48,
              width: 48,
              alignment: Alignment.center,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: AppColors.buttonGradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              child: Image.asset('assets/icons/qr.png')
            )
          )
        ]
      )
    );
  }

  Widget buildUsers() {
    return Expanded(
      child: ListView(
        children: List.generate(30, 
          (index) {
            return UserContainer(
              margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
              onPressed: onUser,
            );
          }
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSearch(),
          buildUsers()
        ],
      ),
    );
  }
}