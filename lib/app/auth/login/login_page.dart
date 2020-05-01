import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/auth_module.dart';
import 'package:highvibe/app/auth/login/widgets/login_button.dart';
import 'package:highvibe/app/auth/login/widgets/reset_password_widget.dart';
import 'package:highvibe/widgets/custom_text_form.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: controller.scaffoldKey,
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height / 3,
                child: SafeArea(
                  child: Container(
                      color: Colors.purple), // Image.asset(AssetsHelper.LOGO),
                ),
              ),
              SizedBox(height: 10),
              CustomTextForm(
                hint: 'Email',
                icon: Icons.email,
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (str) {
                  if (!EmailValidator.validate(str)) return 'Invalid Email';
                  return null;
                },
              ),
              SizedBox(height: 10),
              CustomTextForm(
                  hint: 'Password',
                  isObscure: true,
                  icon: Icons.lock_open,
                  controller: controller.passwordController,
                  validator: (str) {
                    if (str.length < 8 && str.isNotEmpty) {
                      return 'Must Contain At Least 8 characters';
                    }
                    return null;
                  }),
              Align(
                alignment: Alignment.topRight,
                child: FlatButton(
                  onPressed: () => showResetPasswordDialog(
                      context, controller.emailController),
                  child: Text(
                    'Forgot Password?',
                    // style: GoogleFonts.basic().copyWith(
                    //     fontSize: 16, decoration: TextDecoration.underline),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Observer(
                builder: (_) => LoginButton(
                  'Login',
                  isLoading: controller.inProgress,
                  onTap: controller.loginUser,
                ),
              ),
              SizedBox(height: 10),
              FlatButton(
                onPressed: AuthModule.toRegister,
                child: Text(
                  'SIGN UP',
                  // style: GoogleFonts.basic().copyWith(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
