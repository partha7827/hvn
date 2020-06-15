// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gradient_text/gradient_text.dart';
// import 'package:highvibe/modules/profile/playlist/playlist_controller.dart';
// import 'package:highvibe/utils/utils.dart';
// import 'package:highvibe/values/Strings.dart';
// import 'package:highvibe/values/themes.dart';
// import 'package:highvibe/widgets/gradient_raised_button.dart';

// class PlaylistPage extends StatefulWidget {
//   @override
//   _PlaylistPageState createState() => _PlaylistPageState();
// }

// class _PlaylistPageState
//     extends ModularState<PlaylistPage, PlayListController> {
//   @override
//   void initState() {
//     controller.getItems();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.close, color: Colors.white),
//           onPressed: () => Modular.to.pop(),
//         ),
//         title: Text(
//           Strings.addToPlaylist,
//           style: bold18White,
//         ),
//       ),
//       body: _body(),
//     );
//   }

//   Widget _body() {
//     return Container(
//       color: const Color(0xFF000222),
//       child: Column(
//         children: [
//           _titleHeader(),
//           _searchContainer(),
//           _flatList(),
//           Container(
//             padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
//             child: GradientRaisedButton(
//               label: 'Save',
//               onPressed: () {},
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _titleHeader() {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
//       width: double.infinity,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             Strings.playList,
//             style: bold20PlayfairWhite,
//           ),
//           GestureDetector(
//             onTap: () {},
//             child: GradientText(
//               Strings.newPlayList,
//               gradient: primaryGradient,
//               style: normal18White,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _searchContainer() {
//     return Container(
//       width: screenWidth(context),
//       margin: const EdgeInsets.symmetric(horizontal: 20.0),
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         color: secondaryColor,
//       ),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child:
//                 SvgPicture.asset('assets/ic_search.svg', color: hintTextColor),
//           ),
//           Expanded(
//             child: TextField(
//               style: normal16Hint,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: Strings.search,
//                 hintStyle: normal16Hint,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _flatList() {
//     return Expanded(
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 10.0),
//         child: ListView.builder(
//           shrinkWrap: true,
//           itemBuilder: (context, position) {
//             final item = controller.playLists[position];
//             return GestureDetector(
//               onTap: () {
//                 controller.playLists[position].isChecked = !item.isChecked;
//                 setState(() {});
//               },
//               child: Container(
//                 color: Colors.transparent,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Container(
//                       height: 70,
//                       width: 70,
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 12),
//                       child: Stack(
//                         alignment: AlignmentDirectional.center,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: ColorFiltered(
//                               colorFilter: const ColorFilter.mode(
//                                   Colors.black54, BlendMode.dstATop),
//                               child: Container(
//                                 child: Image.asset(
//                                   item.imageUrl,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 item.count,
//                                 style: bold18White,
//                               ),
//                               Container(
//                                 child:
//                                     SvgPicture.asset('assets/ic_playlist.svg'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                               vertical: 12.0,
//                             ),
//                             child: Text(
//                               item.heading,
//                               style: bold18White,
//                             ),
//                           ),
//                           Padding(
//                             padding:
// const EdgeInsets.symmetric(vertical: 5.0),
//                             child: Text(
//                               item.time,
//                               style: normal14Hint,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: <Widget>[
//                           GestureDetector(
//                             onTap: () {
//                               print('checked changed !!!');
//                               controller.playLists[position].isChecked =
//                                   !item.isChecked;
//                               setState(() {});
//                             },
//                             child: Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: item.isChecked
//                                     ? Image.asset('assets/ic_active.png',
//                                         height: 25, width: 25)
//                                     : SvgPicture.asset(
//                                         'assets/ic_inactive.svg')),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//           itemCount: controller.playLists.length,
//         ),
//       ),
//     );
//   }
// }
