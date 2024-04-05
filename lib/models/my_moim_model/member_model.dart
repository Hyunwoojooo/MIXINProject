class Member {
  int userId;
  String userNickName;
  String profilePictureUrl;

  Member({
    required this.userId,
    required this.userNickName,
    required this.profilePictureUrl,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      userId: json['userId'],
      userNickName: json['userNickName'].toString(),
      profilePictureUrl: json['profilePictureUrl'].toString(),
    );
  }
}
