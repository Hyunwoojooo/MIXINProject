class MoimActivityModel {
  final int activityId;
  final String activityName;
  final String activitySpot;
  final String activityDate;
  final String activityTime;
  final String activityInformation;
  final int activityJoinedMember;
  final String dday;
  final bool userJoined;
  final String moimName;

  MoimActivityModel({
    required this.activityId,
    required this.activityName,
    required this.activitySpot,
    required this.activityDate,
    required this.activityTime,
    required this.activityInformation,
    required this.activityJoinedMember,
    required this.dday,
    required this.userJoined,
    required this.moimName,
  });

  factory MoimActivityModel.fromJson(Map<String, dynamic> json) {
    return MoimActivityModel(
      activityId: json['activityId'],
      activityName: json['activityName'].toString(),
      activitySpot: json['activitySpot'].toString(),
      activityDate: json['activityDate'].toString(),
      activityTime: json['activityTime'].toString(),
      activityInformation: json['activityInformation'].toString(),
      activityJoinedMember: json['activityJoinedMember'],
      dday: json['dday'].toString(),
      userJoined: json['userJoined'],
      moimName: json['moimName'].toString(),
    );
  }
}
