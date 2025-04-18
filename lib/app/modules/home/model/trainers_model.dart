class TrainersModel {
  TrainersModel({
    required this.success,
    required this.message,
    required this.meta,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Meta? meta;
  final List<DatumT> data;

  factory TrainersModel.fromJson(Map<String, dynamic> json){
    return TrainersModel(
      success: json["success"],
      message: json["message"],
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      data: json["data"] == null ? [] : List<DatumT>.from(json["data"]!.map((x) => DatumT.fromJson(x))),
    );
  }

}

class DatumT {
  DatumT({
    required this.id,
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.photoUrl,
    required this.location,
    required this.experience,
    required this.bio,
    required this.achievement,
    required this.coachingExpertise,
    required this.skillExpertise,
    required this.perHourRate,
    required this.avgRating,
    required this.isDeleted,
    required this.datumId,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? name;
  final String? email;
  final String? contactNumber;
  final String? photoUrl;
  final String? location;
  final int? experience;
  final String? bio;
  final String? achievement;
  final List<String> coachingExpertise;
  final String? skillExpertise;
  final int? perHourRate;
  final double? avgRating;
  final bool? isDeleted;
  final String? datumId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory DatumT.fromJson(Map<String, dynamic> json){
    return DatumT(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      contactNumber: json["contactNumber"],
      photoUrl: json["photoUrl"],
      location: json["location"],
      experience: json["experience"],
      bio: json["bio"],
      achievement: json["achievement"],
      coachingExpertise: json["coaching_expertise"] == null ? [] : List<String>.from(json["coaching_expertise"]!.map((x) => x)),
      skillExpertise: json["skill_expertise"],
      perHourRate: json["per_hour_rate"],
      avgRating: (json["avgRating"] is int)
          ? (json["avgRating"] as int).toDouble()
          : json["avgRating"] as double?,
      isDeleted: json["isDeleted"],
      datumId: json["id"],
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
