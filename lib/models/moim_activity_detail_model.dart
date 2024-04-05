// 변수 타입 확인 완료 11/30

// activityMemberList 누락되있음

// 모임 활동 자세히 보기
// {{url}}/api/moim/activityInfo?activityId=1


class MoimActivityDetailModel {
  final int moimId;
  final String activityName;
  final String activitySpot;
  final String activityDate;
  final String activityTime;
  final String activityInformation;
  final bool userJoined;
  final bool writer;

  MoimActivityDetailModel({
    required this.moimId,
    required this.activityName,
    required this.activitySpot,
    required this.activityDate,
    required this.activityTime,
    required this.activityInformation,
    required this.userJoined,
    required this.writer,
  });

  factory MoimActivityDetailModel.fromJson(Map<String, dynamic> json) {
    return MoimActivityDetailModel(
      moimId: json['moimId'],
      activityName: json['activityName'],
      activitySpot: json['activitySpot'],
      activityDate: json['activityDate'],
      activityTime: json['activityTime'],
      activityInformation: json['activityInformation'],
      userJoined: json['userJoined'],
      writer: json['writer'],
    );
  }
}
