class UserProfileCreate{
  final String userPosition;
  final List<String> userPersonalitys;
  final String userValues;
  final String userNickName;
  final String userIntroduceText;

  UserProfileCreate({
    required this.userPosition,
    required this.userPersonalitys,
    required this.userValues,
    required this.userNickName,
    required this.userIntroduceText,
});

  factory UserProfileCreate.fromJson(Map<String, dynamic> json) {
    return UserProfileCreate(
      userPosition: json['userPosition'],
      userPersonalitys: json['userPersonalitys'],
      userValues: json['userValues'],
      userNickName: json['userNickName'],
      userIntroduceText: json['userIntroduceText'],
    );
  }
}
