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
}
