class MyMoimDetailModel {
  int? id;
  String? categoryName;
  String? categoryUrl;
  String? moimType;
  String? moimName;
  String? moimThumbnailUrl;
  String? currentMember;
  String? moimFrequency;
  String? moimDescription;
  List<String>? moimTags;
  bool? leader;

  MyMoimDetailModel(
      {this.id,
        this.categoryName,
        this.categoryUrl,
        this.moimType,
        this.moimName,
        this.moimThumbnailUrl,
        this.currentMember,
        this.moimFrequency,
        this.moimDescription,
        this.moimTags,
        this.leader});

  MyMoimDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    categoryUrl = json['categoryUrl'];
    moimType = json['moimType'];
    moimName = json['moimName'];
    moimThumbnailUrl = json['moimThumbnailUrl'];
    currentMember = json['currentMember'];
    moimFrequency = json['moimFrequency'];
    moimDescription = json['moimDescription'];
    moimTags = json['moimTags'].cast<String>();
    leader = json['leader'];
  }

}

