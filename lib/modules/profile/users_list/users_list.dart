import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/modules/profile/users_list/user_card.dart';

class UsersList extends StatelessWidget {
  final List<User> users;
  UsersList(this.users);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, index) => UserCard(
        users[index],
        onTap: () => ProfileModule.toOtherProfile(users[index]),
      ),
    );
  }
}

// class DiscoverFollowers extends WidgetModule {
//   final List<String> userIds;
//   DiscoverFollowers(this.userIds);

//   @override
//   Widget get view => Scaffold(
//         appBar: _buildAppBar("Followers"),
//         body: DiscoverAuthorsView(),
//       );

//   @override
//   List<Bind> get binds => [
//         ...commonBinds,
//         Bind((_) => DiscoverAuthorsController(userIds: userIds)),
//       ];
// }

// class DiscoverFollowing extends WidgetModule {
//   final List<String> userIds;
//   DiscoverFollowing(this.userIds);

//   @override
//   Widget get view => Scaffold(
//         appBar: _buildAppBar("Following"),
//         body: DiscoverAuthorsView(),
//       );

//   @override
//   List<Bind> get binds => [
//         ...commonBinds,
//         Bind((_) => DiscoverAuthorsController(userIds: userIds)),
//       ];
// }

// Widget _buildAppBar(String title) => AppBar(
//       title: Text(
//         title,
//         style: bold20PlayfairWhite,
//       ),
//     );
