class ConditionsModel {
  ConditionsModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final bool? success;
  final int? statusCode;
  final String? message;
  final Data? data;

  factory ConditionsModel.fromJson(Map<String, dynamic> json){
    return ConditionsModel(
      success: json["success"],
      statusCode: json["statusCode"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.aboutUs,
    required this.termsAndConditions,
    required this.privacyPolicy,
    required this.supports,
    required this.faq,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? aboutUs;
  final String? termsAndConditions;
  final String? privacyPolicy;
  final String? supports;
  final String? faq;
  final dynamic createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["_id"],
      aboutUs: json["aboutUs"],
      termsAndConditions: json["termsAndConditions"],
      privacyPolicy: json["privacyPolicy"],
      supports: json["supports"],
      faq: json["faq"],
      createdBy: json["createdBy"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}
