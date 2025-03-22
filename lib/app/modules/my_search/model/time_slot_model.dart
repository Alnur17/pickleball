class TimeSlotModel {
  TimeSlotModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.meta,
    required this.data,
  });

  final bool? success;
  final int? statusCode;
  final String? message;
  final Meta? meta;
  final List<DatumSlot> data;

  factory TimeSlotModel.fromJson(Map<String, dynamic> json){
    return TimeSlotModel(
      success: json["success"],
      statusCode: json["statusCode"],
      message: json["message"],
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      data: json["data"] == null ? [] : List<DatumSlot>.from(json["data"]!.map((x) => DatumSlot.fromJson(x))),
    );
  }

}

class DatumSlot {
  DatumSlot({
    required this.id,
    required this.session,
    required this.startTime,
    required this.endTime,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? session;
  final String? startTime;
  final String? endTime;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory DatumSlot.fromJson(Map<String, dynamic> json){
    return DatumSlot(
      id: json["_id"],
      session: json["session"],
      startTime: json["startTime"],
      endTime: json["endTime"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

}

class Meta {
  Meta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  final int? page;
  final int? limit;
  final int? total;
  final int? totalPage;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      page: json["page"],
      limit: json["limit"],
      total: json["total"],
      totalPage: json["totalPage"],
    );
  }

}
