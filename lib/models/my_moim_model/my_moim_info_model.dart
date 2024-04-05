class MyMoimInfoModel {
  final int id;
  final String moimType;
  final String moimName;
  final List<String> moimTags;
  final String moimThumbnailUrl;
  final String categoryUrl;
  final String categoryName;
  final String currentMember;
  final String totalMember;

  MyMoimInfoModel({
    required this.id,
    required this.moimType,
    required this.moimName,
    required this.moimTags,
    required this.moimThumbnailUrl,
    required this.categoryUrl,
    required this.categoryName,
    required this.currentMember,
    required this.totalMember,
  });

  factory MyMoimInfoModel.fromJson(Map<String, dynamic> json) {
    return MyMoimInfoModel(
      id: json['id'],
      moimType: json['moimType'],
      moimName: json['moimName'],
      moimTags: json['moimTags'],
      moimThumbnailUrl: json['moimThumbnailUrl'],
      categoryUrl: json['categoryUrl'],
      categoryName: json['categoryName'],
      currentMember: json['currentMember'],
      totalMember: json['totalMember'],
    );
  }
}
