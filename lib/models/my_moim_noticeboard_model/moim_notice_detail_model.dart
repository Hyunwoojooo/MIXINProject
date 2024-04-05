class MakedUserModel {
  final int userId;
  final String userNickName;
  final String profilePictureUrl;
  final String userRole;

  MakedUserModel({
    required this.userId,
    required this.userNickName,
    required this.profilePictureUrl,
    required this.userRole,
  });

  factory MakedUserModel.fromJson(Map<String, dynamic> json) {
    return MakedUserModel(
      userId: json['userId'],
      userNickName: json['userNickName'],
      profilePictureUrl: json['profilePictureUrl'],
      userRole: json['userRole'],
    );
  }
}

class MoimNoticeDetailModel {
  final int noticeId;
  // final MakedUserModel makedUser; // 추가된 부분
  final String title;
  final String content;
  final String createAt;
  final int viewCount;
  final int commentCount;
  final List<String> imageUrls;

  MoimNoticeDetailModel({
    required this.noticeId,
    // required this.makedUser,
    required this.title,
    required this.content,
    required this.createAt,
    required this.viewCount,
    required this.commentCount,
    required this.imageUrls,
  });

  factory MoimNoticeDetailModel.fromJson(Map<String, dynamic> json) {
    // makedUser를 JSON 데이터로부터 MakedUserModel로 변환
    // MakedUserModel user = MakedUserModel.fromJson(json['makedUser']);


    return MoimNoticeDetailModel(
      noticeId: json['noticeId'],
      // makedUser: user,
      title: json['title'],
      content: json['content'],
      createAt: json['createAt'],
      viewCount: json['viewCount'],
      commentCount: json['commentCount'],
      imageUrls: List<String>.from(json['imageUrls']),
    );
  }
}
