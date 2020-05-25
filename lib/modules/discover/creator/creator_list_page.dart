import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/discover/creator/creator_card.dart';
import 'package:highvibe/modules/discover/discover_controller.dart';
import 'package:highvibe/widgets/splash_widget.dart';
import 'package:mobx/mobx.dart';

class CreatorListPage extends StatefulWidget {
  @override
  _CreatorListPageState createState() => _CreatorListPageState();
}

class _CreatorListPageState extends State<CreatorListPage> {
  final controller = Modular.get<DiscoverController>();

  @override
  void initState() { 
    super.initState();
    controller.loadCreators();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.creators.status == FutureStatus.fulfilled) {
        return ListView(
          padding: const EdgeInsets.only(bottom: 40),
          children: [
            ...controller.creators.value.map((item) => CreatorCard(item)),
          ],
        );
      } else {
        return SplashWidget();
      }
    });
  }
}
