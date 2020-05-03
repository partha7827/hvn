import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/custom_text_form.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: Text(
          Strings.letsGetSignedUp,
          style: bold20PlayfairWhite,
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CustomTextForm(
                    hint: Strings.name,
                    icon: Icons.person_outline,
                    controller: controller.usernameController,
                    maxLength: 15,
                    validator: (str) =>
                        str.length < 2 && str.isNotEmpty ? "Add a Name" : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: CustomTextForm(
                      hint: Strings.email,
                      icon: Icons.email,
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (str) => EmailValidator.validate(str)
                          ? null
                          : "Invalid Email"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CustomTextForm(
                    hint: Strings.password,
                    isObscure: true,
                    icon: Icons.lock_open,
                    controller: controller.passwordController,
                    validator: (str) => str.length < 8 && str.isNotEmpty
                        ? "Must Contain At Least 8 characters"
                        : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: <Widget>[
                      Observer(
                        builder: (_) => Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                            activeColor: Theme.of(context).accentColor,
                            checkColor: Colors.yellow,
                            value: controller.hasAcceptedTerms,
                            onChanged: (value) {
                              controller.hasAcceptedTerms =
                                  !controller.hasAcceptedTerms;
                            },
                          ),
                        ),
                      ),
                      Text(
                        "I Accept All Terms & Conditions",
                        style: normal14White,
                      ),
                    ],
                  ),
                ),
                Observer(
                  builder: (_) => GradientRaisedButton(
                    label: Strings.signUp,
                    isLoading: controller.inProgress,
                    onPressed: controller.registerUser,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    width: double.maxFinite,
                    child: Text(
                      'or login with your social account',
                      textAlign: TextAlign.center,
                      style: normal14White,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.only(right: 8),
                        child: RaisedButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/ic_facebook.svg'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: const Color(0xFF2B5C93),
                          label: Text(
                            Strings.facebook,
                            style: normal16White,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.only(left: 8),
                        child: RaisedButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/ic_google.svg'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: const Color(0xFFCF4332),
                          label: Text(
                            Strings.google,
                            style: normal16White,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        Strings.alreadyHaveAccount,
                        style: normal16White,
                      ),
                      FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          Strings.signIn,
                          style: normal16Accent,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
