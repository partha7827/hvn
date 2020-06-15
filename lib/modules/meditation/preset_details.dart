import 'package:flutter/material.dart';
import 'package:highvibe/modules/meditation/starting_bell.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_chip.dart';

class PresetDetails extends StatefulWidget {
  @override
  _PresetDetailsState createState() => _PresetDetailsState();
}

class _PresetDetailsState extends State<PresetDetails> {
  bool isDim = false;
  bool isVibrate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preset Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '20',
                    style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Minute',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF8E8F99),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Deep Breathing',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            _singleLineCard(
                title: 'Starting Bell',
                subtitle: '10 Mins',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<StartingBell>(
                      builder: (_) => StartingBell(),
                    ),
                  );
                }),
            _singleLineCard(title: 'Interval Bell', subtitle: '1 Single'),
            _singleLineCard(title: 'Ambient Sound', subtitle: 'Deep Om'),
            _singleLineCard(title: 'Background Track', subtitle: 'None'),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: GradientChip(
                      label: 'Vibrate',
                      icon: Icons.vibration,
                      onSelected: (value) {
                        print('vibrate: $value');
                        setState(() {
                          isVibrate = value;
                        });
                      },
                      selected: isVibrate,
                    ),
                  ),
                  GradientChip(
                    label: 'Dim Screen',
                    icon: Icons.brightness_4,
                    onSelected: (value) {
                      setState(() {
                        isDim = value;
                      });
                    },
                    selected: isDim,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Container(
          height: 60,
          child: Stack(
            children: <Widget>[
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 40,
                      child: RaisedButton.icon(
                        icon: Image.asset(
                          'assets/ic_edit_outline.png',
                          width: 16,
                          height: 16,
                        ),
                        label: const Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 40,
                      child: RaisedButton.icon(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: _gradientBorderCircularButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _singleLineCard({
    String title,
    String subtitle,
    Function onPressed,
  }) {
    return Container(
      height: 60,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: const Color(0xFF212342),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    const Icon(Icons.chevron_right)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _gradientBorderCircularButton() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          gradient: primaryGradient, borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: const Center(
            child: Text(
              'Start',
              style: TextStyle(
                color: Color(0xFF666CCC),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
