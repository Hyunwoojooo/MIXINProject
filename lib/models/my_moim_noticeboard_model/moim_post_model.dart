class MoimPostModel {
  final int boardId;
  final String title;
  final String createAt;
  final int viewCount;
  final int commentCount;

  MoimPostModel({
    required this.boardId,
    required this.title,
    required this.createAt,
    required this.viewCount,
    required this.commentCount,
  });

  factory MoimPostModel.fromJson(Map<String, dynamic> json) {
    return MoimPostModel(
        boardId: json['boardId'],
        title: json['title'],
        createAt: json['createAt'],
        viewCount: json['viewCount'],
        commentCount: json['commentCount'],
    );
  }
}

