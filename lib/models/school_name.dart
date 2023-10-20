import 'dart:convert';

class SchoolName {


  String? campusName;
  String? collegeinfourl;
  String? schoolType;
  String? link;
  String? schoolGubun;
  String? adres;
  String? schoolName;
  String? region;
  String? totalCount;
  String? estType;
  String? seq;

  SchoolName({
    this.campusName,
    this.collegeinfourl,
    this.schoolType,
    this.link,
    this.schoolGubun,
    this.adres,
    this.schoolName,
    this.region,
  });

  factory SchoolName.fromJson(Map<String, dynamic> json) => SchoolName(
    campusName : json["campusName"],
    collegeinfourl : json["collegeinfourl"],
    schoolType : json["schoolType"],
    link : json["link"],
    schoolGubun : json["schoolGubun"],
    adres : json["adres"],
    schoolName : json["schoolName"],
    region : json["region"],
  );
}

class SchoolNameList {
  final List<SchoolName>? schoolName;
  SchoolNameList({this.schoolName});

  factory SchoolNameList.fromJson(String jsonString) {
    List<dynamic> listFromJson = json.decode(jsonString);
    List<SchoolName> schoolName = <SchoolName>[];

    schoolName = listFromJson.map((schoolName) => SchoolName.fromJson(schoolName)).toList();
    return SchoolNameList(schoolName: schoolName);
  }
}