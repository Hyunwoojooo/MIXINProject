class Moims {
  final int moimId;
  final String moimName;
  final List<String> moimTags;
  final String moimThumbnailUrl;
  final String currentMember;
  final String totalMember;
  final String userRole;

  Moims({
    required this.moimId,
    required this.moimName,
    required this.moimTags,
    required this.moimThumbnailUrl,
    required this.currentMember,
    required this.totalMember,
    required this.userRole,
  });

  factory Moims.fromJson(Map<String, dynamic> json) {
    return Moims(
      moimId: json['moimId'],
      moimName: json['moimName'],
      moimTags: List<String>.from(json['moimTags']),
      moimThumbnailUrl: json['moimThumbnailUrl'],
      currentMember: json['currentMember'],
      totalMember: json['totalMember'],
      userRole: json['userRole'],
    );
  }
}

class Activities {
  final int activityId;
  final String activityDate;
  final String activityTime;
  final String activityName;
  final String activitySpot;
  final String status;

  Activities({
    required this.activityId,
    required this.activityDate,
    required this.activityTime,
    required this.activityName,
    required this.activitySpot,
    required this.status,
  });

  factory Activities.fromJson(Map<String, dynamic> json) {
    return Activities(
      activityId: json['activityId'],
      activityDate: json['activityDate'],
      activityTime: json['activityTime'],
      activityName: json['activityName'],
      activitySpot: json['activitySpot'],
      status: json['status'],
    );
  }
}
