class RecommendedTrainersModel {
  RecommendedTrainersModel({
    required this.success,
    required this.message,
    required this.meta,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Meta? meta;
  final List<RecommendedDatum> data;

  factory RecommendedTrainersModel.fromJson(Map<String, dynamic> json){
    return RecommendedTrainersModel(
      success: json["success"],
      message: json["message"],
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      data: json["data"] == null ? [] : List<RecommendedDatum>.from(json["data"]!.map((x) => RecommendedDatum.fromJson(x))),
    );
  }

}

class RecommendedDatum {
  RecommendedDatum({
    required this.id,
    required this.datumId,
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
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? datumId;
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
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory RecommendedDatum.fromJson(Map<String, dynamic> json){
    return RecommendedDatum(
      id: json["_id"],
      datumId: json["id"],
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
