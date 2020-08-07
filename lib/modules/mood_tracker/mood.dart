class Mood {
  String title;
  String imagePath;
  List<String> tags;
  String notes;
  DateTime dateTime;

  Mood({
    this.title,
    this.imagePath,
    this.tags,
    this.notes,
    this.dateTime,
  });

  @override
  String toString() =>
      'Mood: $title' +
      'Emoji $imagePath' +
      'Tags $tags' +
      'Notes $notes' +
      'DateTime $dateTime';
}
