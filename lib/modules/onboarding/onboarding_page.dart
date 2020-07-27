import 'package:flutter/material.dart';
import 'package:highvibe/modules/onboarding/onboarding_controller.dart';
import 'package:highvibe/values/themes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class OnboardingUserOptions extends StatefulWidget {
  const OnboardingUserOptions();
  @override
  _OnboardingUserOptionsState createState() => _OnboardingUserOptionsState();
}

class _OnboardingUserOptionsState extends ModularState<OnboardingUserOptions,
    OnboardingUserOptionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _title(),
            _gridButtons(),
            _button(),
          ],
        ),
      ),
    );
  }

  Container _button() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: GradientRaisedButton(
        label: 'Next',
        onPressed: () {},
      ),
    );
  }

  Container _title() {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        top: 25,
        bottom: 40,
      ),
      child: Text('Which areas would you\nlike to grow?',
          style: bold24PlayfairWhite),
    );
  }

  Expanded _gridButtons() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 0.85,
          children: List.generate(
            controller.optionsList.length,
            (index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      controller.optionsList[index].isSelected =
                          !controller.optionsList[index].isSelected;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white10,
                          width: 2,
                        ),
                        color: controller.optionsList[index].isSelected
                            ? Colors.white12
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(30),
                              child: Image.asset(
                                  controller.optionsList[index].imagePath)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                controller.optionsList[index].title,
                                style: normal12White,
                              ),
                              Opacity(
                                opacity:
                                    controller.optionsList[index].isSelected
                                        ? 1
                                        : 0,
                                child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset('assets/ic_active.png')),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
