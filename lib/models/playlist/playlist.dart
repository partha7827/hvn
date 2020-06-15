class PlaylistModel {
  String heading;
  String time;
  bool isChecked;
  String count;
  String imageUrl;

  PlaylistModel({
    this.heading,
    this.time,
    this.isChecked,
    this.count,
    this.imageUrl,
  });

  void changeIsChecked(bool value) {
    isChecked = value;
  }
}