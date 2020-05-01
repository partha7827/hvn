import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/login/widgets/login_button.dart';
import 'package:highvibe/widgets/custom_text_form.dart';
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
    final theme = Theme.of(context);
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
                // child: SafeArea(
                //   child: Image.asset(AssetsHelper.LOGO),
                // ),
              ),
              SizedBox(height: 20),
              CustomTextForm(
                hint: "Name",
                icon: Icons.person_outline,
                controller: controller.usernameController,
                maxLength: 15,
                validator: (str) =>
                    str.length < 2 && str.isNotEmpty ? "Add a Name" : null,
              ),
              SizedBox(height: 8),
              CustomTextForm(
                  hint: "Email",
                  icon: Icons.email,
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (str) =>
                      EmailValidator.validate(str) ? null : "Invalid Email"),
              SizedBox(height: 8),
              CustomTextForm(
                hint: "Password",
                isObscure: true,
                icon: Icons.lock_open,
                controller: controller.passwordController,
                validator: (str) => str.length < 8 && str.isNotEmpty
                    ? "Must Contain At Least 8 characters"
                    : null,
              ),
              ListTile(
                leading: Observer(
                  builder: (_) => Checkbox(
                    activeColor: theme.accentColor,
                    value: controller.hasAcceptedTerms,
                    onChanged: (value) {
                      controller.hasAcceptedTerms =
                          !controller.hasAcceptedTerms;
                    },
                  ),
                ),
                title: Text(
                  "I Accept All Terms & Conditions",
                  style: theme.textTheme.title.copyWith(
                      fontSize: 14, decoration: TextDecoration.underline),
                ),
                //  onTap:
              ),
              SizedBox(height: 10),
              Observer(
                builder: (_) => LoginButton(
                  "SIGN UP",
                  isLoading: controller.inProgress,
                  onTap: controller.registerUser,
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Text(
                  "ALREADY MEMBER?\n Login",
                  style: theme.textTheme.subhead
                      .copyWith(decoration: TextDecoration.underline),
                  textAlign: TextAlign.center,
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
