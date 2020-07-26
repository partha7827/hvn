import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/meditation/meditation_controller.dart';
import 'package:highvibe/modules/meditation/meditation_module.dart';
import '../components/time_slider_card.dart';
import '../utilities/constants.dart';
import '../components/number_selection_card.dart';
import '../screens/breathe_screen.dart';
import 'package:provider/provider.dart';
import '../state/settings.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = 'SettingsScreen';

  final MeditationController settings = Modular.get<MeditationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          'SETTINGS',
          style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 25,
            letterSpacing: 3,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Observer(
                builder: (_) => NumberSelectionCard(
                  value: settings.numRounds,
                  title: 'Rounds',
                  onChanged: (newValue) {
                    settings.setNumRounds(newValue);
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Observer(
                builder: (_) => NumberSelectionCard(
                  value: settings.breathsPerRound,
                  title: 'Breaths',
                  onChanged: (newValue) {
                    print(newValue);
                    settings.setBreathsPerRound(newValue);
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Observer(
                builder: (_) => TimeSliderCard(
                  value: settings.holdTime,
                  onChanged: (newValue) {
                    if (newValue.ceil() != settings.holdTime) {
                      settings.setHoldTime(newValue.ceil());
                    }
                  },
                  title: 'Hold Time',
                  min: 5,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.lightBlueAccent,
                height: 50.0,
                onPressed: MeditationModule.toBreathe,
                child: Text(
                  'GO',
                  style: kTitleTextStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
