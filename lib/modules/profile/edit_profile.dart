import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/values/themes.dart';
import 'current_user/current_user_controller.dart';
import 'widgets/profile_input_field.dart';

final String imgUrl =
    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80';

class EditProfile extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController(),
      _userNameController = TextEditingController(),
      _aboutController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Modular.to.pop()),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                printUserData();
                Modular.to.pop();
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 42),
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Image.network(
                            imgUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          CurrentUserController().changeProfilePic();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: primaryGradient,
                          ),
                          alignment: Alignment.center,
                          height: 36,
                          width: 36,
                          child: SvgPicture.asset('assets/ic_camera.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
                InputTextWidget(
                  title: 'Full Name',
                  hintText: 'Enter your full name',
                  controller: _fullNameController,
                  validator: (String input) {
                    return input != null && input.isNotEmpty
                        ? null
                        : 'Please enter full name';
                  },
                ),
                InputTextWidget(
                  title: 'Username',
                  hintText: 'Enter your username',
                  controller: _userNameController,
                  validator: (String input) {
                    return input != null && input.isNotEmpty
                        ? null
                        : 'Please enter user name';
                  },
                ),
                InputTextWidget(
                  title: 'About',
                  hintText: 'Enter about information',
                  controller: _aboutController,
                  maxLines: 4,
                  validator: (String input) {
                    return input != null && input.isNotEmpty
                        ? null
                        : 'Please enter about information';
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void printUserData() {
    print('Full name = ${_fullNameController.text}');
    print('User name = ${_userNameController.text}');
    print('About = ${_aboutController.text}');
  }
}
