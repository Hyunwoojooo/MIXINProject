class MoimData {
  final int moimId;
  final String moimType;
  final String moimName;
  final List<String> moimTags;
  final String moimThumbnailUrl;
  final String categoryUrl;
  final String categoryName;
  final String date;
  final String moimDescription;
  final String currentMember;
  final String totalMember;
  final String dday;
  final String moimPlace;

  MoimData({
    required this.moimId,
    required this.moimType,
    required this.moimName,
    required this.moimTags,
    required this.moimThumbnailUrl,
    required this.categoryUrl,
    required this.categoryName,
    required this.date,
    required this.moimDescription,
    required this.currentMember,
    required this.totalMember,
    required this.dday,
    required this.moimPlace,
  });

  factory MoimData.fromJson(Map<String, dynamic> json) {
    return MoimData(
      moimId: json['moimId'],
      moimType: json['moimType'],
      moimName: json['moimName'],
      moimTags: List<String>.from(json['moimTags']),
      moimThumbnailUrl: json['moimThumbnailUrl'],
      categoryUrl: json['categoryUrl'],
      categoryName: json['categoryName'],
      date: json['date'],
      moimDescription: json['moimDescription'],
      currentMember: json['currentMember'],
      totalMember: json['totalMember'].toString(),
      dday: json['dday'],
      moimPlace: json['moimPlace'],
    );
  }
}

