class TagItemInterface {
  final int index;
  final String title;
  final bool active;
  final Object customData;

  const TagItemInterface({
    this.index,
    this.title,
    this.active,
    this.customData,
  });

  @override
  String toString() {
    return 'id:$index, title: $title, active: $active, customData: $customData';
  }
}
