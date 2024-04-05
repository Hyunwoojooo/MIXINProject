class MyHomeMyActivityModel {
  final int activityId;
  final String activityName;
  final String activitySpot;
  final String activityDate;
  final String moimName;

  MyHomeMyActivityModel({
    required this.activityId,
    required this.activityName,
    required this.activitySpot,
    required this.activityDate,
    required this.moimName,
  });

  factory MyHomeMyActivityModel.fromJson(Map<String, dynamic> json) {
    return MyHomeMyActivityModel(
      activityId: json['activityId'],
      activityName: json['activityName'].toString(),
      activitySpot: json['activitySpot'].toString(),
      activityDate: json['activityDate'].toString(),
      moimName: json['moimName'].toString(),
    );
  }
}
