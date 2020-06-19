import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/auth/auto_login/auto_login_controller.dart';
import 'package:highvibe/modules/auth/auto_login/auto_login_page.dart';
import 'package:highvibe/modules/auth/login/login_controller.dart';
import 'package:highvibe/modules/auth/login/login_page.dart';
import 'package:highvibe/modules/auth/register/register_controller.dart';
import 'package:highvibe/modules/auth/register/register_page.dart';
import 'package:highvibe/modules/auth/register/register_with_sms/create_password/create_password.dart';
import 'package:highvibe/modules/auth/register/register_with_sms/create_password/create_password_controller.dart';
import 'package:highvibe/modules/auth/register/register_with_sms/lets_get_you_started/lets_get_you_signed_up_contoller.dart';
import 'package:highvibe/modules/auth/register/register_with_sms/lets_get_you_started/lets_get_you_signed_up.dart';
import 'package:highvibe/modules/auth/register/register_with_sms/register_with_sms.dart';
import 'package:highvibe/modules/auth/register/register_with_sms/register_with_sms_controller.dart';
import 'package:highvibe/modules/auth/register/register_with_sms/verify_otp/verify_otp.dart';
import 'package:highvibe/modules/auth/register/register_with_sms/verify_otp/verify_otp_controller.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';

import 'login/forgot_password_page.dart';
import 'login/thank_you_page.dart';

class AuthModule extends ChildModule {
  static Inject<AuthModule> get to => Inject<AuthModule>.of();

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => AppController()),
        Bind<FirestoreService>((i) => FirestoreService.withFirebase()),
        Bind<AuthService>((i) => AuthService.withFirebase()),
        Bind((i) => AutoLoginController()),
        Bind((i) => LoginController()),
        Bind((i) => RegisterController()),
        Bind((i) => RegisterWithSmsController()),
        Bind((i) => VerifyOtpController()),
        Bind((i) => LetsGetYouSignedUpContoller()),
        Bind((i) => CreatePasswordController()),
      ];

  @override
  List<Router<Object>> get routers => [
        Router('/autologin', child: (_, args) => const AutoLoginPage()),
        Router('/register', child: (_, args) => const RegisterPage()),
        Router('/login', child: (_, args) => const LoginPage()),
        Router(
          '/forgotPassword',
          child: (_, args) => ForgotPasswordPage(email: args.data),
        ),
        Router('/thankYou', child: (_, args) => ThankYouPage(email: args.data)),
        Router('/registerWithSMS', child: (_, args) => RegisterWithSms()),
        Router(
          '/verifyOtp',
          child: (_, args) => VerifyOtpPage(
            phoneNumber: args.data[0],
            countryCode: args.data[1],
          ),
        ),
        Router('/registerWithSMS', child: (_, args) => RegisterWithSms()),
        Router(
          '/letsGetYouSignedUp',
          child: (_, args) => LetsGetYouSignedUp(
            user: args.data,
          ),
        ),
        Router('/createPassword', child: (_, args) => CreatePassword(
          user: args.data,
        )),

      ];

  static Future<Object> toForgotPassword(String email) =>
      Modular.to.pushNamed('/forgotPassword', arguments: email);

  static Future<Object> toLogin() => Modular.to.pushNamed('/login');

  static Future<Object> toRegister() => Modular.to.pushNamed('/register');

  static Future<Object> toRegisterWithSMS() =>
      Modular.to.pushNamed('/registerWithSMS');

  static Future<Object> toVerifyOtp(dynamic args) =>
      Modular.to.pushNamed('/verifyOtp', arguments: args);

  static Future<Object> toLetsGetYouSignedUp(User user) =>
      Modular.to.pushNamed('/letsGetYouSignedUp', arguments: user);

      static Future<Object> toCreatePassword(User user) =>
      Modular.to.pushNamed('/createPassword', arguments: user);

  static Future<Object> toThankYouPage(String args) =>
      Modular.to.pushReplacementNamed('/thankYou', arguments: args);
}
