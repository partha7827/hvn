import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/header_row.dart';

class AuthorsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: HeaderRow(
            title: 'Explore Authors',
            showTrailing: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: 140,
            child: FutureBuilder(
                future: Modular.get<HomeController>().getAuthors(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _authorCard(
                            user: snapshot.data[index],
                            onPressed: () {
                              ProfileModule.toOtherProfile(snapshot.data[index].id);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => CreatorsProfile(),
                              //   ),
                              // );
                            });
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
        ),
      ],
    );
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  imageUrl: user.photoUrl,
                  fit: BoxFit.cover,
                  height: 140,
                  width: 100,
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
}
