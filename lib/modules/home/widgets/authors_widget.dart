import 'package:built_collection/built_collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/discover/discover_module.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:mobx/mobx.dart';

class AuthorsWidget extends StatefulWidget {
  @override
  _AuthorsWidgetState createState() => _AuthorsWidgetState();
}

class _AuthorsWidgetState extends ModularState<AuthorsWidget, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.loadRecommendedAuthors();
  }
  
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      bool isVisible = controller.authors.status == FutureStatus.fulfilled &&
          controller.authors.value.isNotEmpty;

      return AnimatedOpacity(
        child: isVisible ? buildAuthors(controller.authors.value) : Container(),
        opacity: isVisible ? 1 : 0,
        duration: Duration(seconds: 1),
      );
    });
  }

  Widget buildAuthors(BuiltList<User> authors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: HeaderRow(
            title: Strings.authorsTitle,
            showTrailing: true,
            onPressedTrailing: DiscoverModule.toDiscoverAuthors,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: 140,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: authors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _authorCard(
                    user: authors[index],
                    onPressed: () {
                      ProfileModule.toOtherProfile(authors[index]);
                    });
              },
            ),
          ),
        ),
      ],
    );
  }
}

Widget _authorCard({
  @required User user,
  @required Function onPressed,
}) {
  return Container(
    width: 100,
    height: 140,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: onPressed,
        child: Stack(
          children: <Widget>[
            Hero(
              tag: "author#${user.id}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  imageUrl: user.photoUrl,
                  fit: BoxFit.cover,
                  height: 140,
                  width: 100,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  gradient: darkToTransparentGradient,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  user.name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: normal14White,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
