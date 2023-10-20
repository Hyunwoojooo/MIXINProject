import 'package:image_picker/image_picker.dart';

enum Category {
  it,
  design,
  culture,
  music,
  travel,
  volunteer,
  exercise,
  animal,
  society,
  classes,
  language,
  restaurant,
  cook,
  finance,
  etc
}

enum Type {
  study,
  hobby,
  project,
  thunder,
}

const typeText = {
  Type.hobby: '취미',
  Type.study: '스터디',
  Type.project: '프로젝트',
  Type.thunder: '번개',
};

class MoimCardModel {
  MoimCardModel({
    required this.title,
    required this.memberCount,
    required this.hashTag,
    required this.dDate,
    required this.category,
    required this.type,
    // required this.moimImage,
  });

  final String title;
  final int memberCount;
  final List<String> hashTag;
  final int dDate;
  final Category category;
  final Type type;
  // final XFile moimImage;
}
