import 'package:flutter/material.dart';
import 'package:hvn/modules/meditation/preset_details.dart';

class YourPresets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _presets = [
      'Deep Breathing',
      'Yoga',
      'Mindfulness Meditation',
      'Zen Meditation',
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32),
      child: ListView.builder(
        itemCount: _presets.length,
        itemBuilder: (context, index) {
          return Container(
            height: 60,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: const Color(0xFF212342),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PresetDetails(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _presets[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '10 mins',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
