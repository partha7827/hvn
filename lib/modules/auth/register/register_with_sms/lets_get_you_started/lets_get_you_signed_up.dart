import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/auth/register/register_with_sms/lets_get_you_started/lets_get_you_signed_up_contoller.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_rounded_button.dart';
import 'package:highvibe/models/user/user.dart';

class LetsGetYouSignedUp extends StatefulWidget {
  const LetsGetYouSignedUp({
    this.user,
  });

  final User user;

  @override
  _LetsGetYouSignedUpState createState() => _LetsGetYouSignedUpState();
}

class _LetsGetYouSignedUpState
    extends ModularState<LetsGetYouSignedUp, LetsGetYouSignedUpContoller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      Strings.letsGetSignedUp,
                      style: bold30PlayfairWhite,
                    ),
                  ),
                  _textInputField(
                    label: Strings.fullName,
                    controller: controller.fullNameController,
                  ),
                  _textInputField(
                    label: Strings.username,
                    controller: controller.userNameController,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 86),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: GradientRoundedRaisedButton(
                      label: Strings.next,
                      onPressed: () {
                        if (controller.formKey.currentState.validate()) {
                          controller.toPasswordScreen(widget.user);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _textInputField(
      {String label = '', TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            '$label',
            style: normal14Hint,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: TextFormField(
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(
                    0xFF525366,
                  ),
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(
                    0xFF525366,
                  ),
                ),
              ),
            ),
            controller: controller,
            style: normal14White,
            validator: (String input) {
              return input.isEmpty ? 'Invalid $label' : null;
            },
          ),
        ),
      ],
    );
  }
}
