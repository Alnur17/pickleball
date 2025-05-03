class CreditModel {
  CreditModel({
    required this.success,
    required this.message,
    required this.meta,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Meta? meta;
  final List<Datum> data;

  factory CreditModel.fromJson(Map<String, dynamic> json) {
    return CreditModel(
      success: json["success"],
      message: json["message"],
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  Datum({
    required this.id,
    required this.credits,
    required this.price,
    required this.popularity,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.description,
  });

  final String? id;
  final int? credits;
  final double? price;
  final int? popularity;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? title;
  final String? description;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["_id"],
      credits: json["credits"],
      price: (json["price"] is int)
        ? (json["price"] as int).toDouble()
        : json["price"] as double?,
      popularity: json["popularity"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      title: json["title"],
      description: json["description"],
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

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: json["page"],
      limit: json["limit"],
      total: json["total"],
      totalPage: json["totalPage"],
    );
  }
}
