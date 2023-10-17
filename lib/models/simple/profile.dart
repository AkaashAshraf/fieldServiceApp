class Profile {
  Profile({
    this.id = 0,
    this.title_1 = '',
    this.title_2 = '',
    this.badgeText = "",
    this.icon_1,
    this.icon_2,
    this.isNextIcon = false,

    // this.isSelected,
  });

  int id;
  // int? isSelected;
  String? title_1;
  String? title_2;
  dynamic icon_1;
  dynamic icon_2;
  bool isNextIcon;
  String badgeText;
}
