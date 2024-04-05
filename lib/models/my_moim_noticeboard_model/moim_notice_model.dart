class MoimNoticeModel {
  final int noticeId;
  final String title;
  final String createAt;
  final int viewCount;
  final int commentCount;
  final bool checked;

  MoimNoticeModel({
    required this.noticeId,
    required this.title,
    required this.createAt,
    required this.viewCount,
    required this.commentCount,
    required this.checked,
  });

  factory MoimNoticeModel.fromJson(Map<String, dynamic> json) {
    return MoimNoticeModel(
      noticeId: json['noticeId'],
      title: json['title'],
      createAt: json['createAt'],
      viewCount: json['viewCount'],
      commentCount: json['commentCount'],
      checked: json['checked']
    );
  }
}

