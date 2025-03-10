class TrainersModel {
  TrainersModel({
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
  final List<DatumT> data;

  factory TrainersModel.fromJson(Map<String, dynamic> json){
    return TrainersModel(
      success: json["success"],
      statusCode: json["statusCode"],
      message: json["message"],
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      data: json["data"] == null ? [] : List<DatumT>.from(json["data"]!.map((x) => DatumT.fromJson(x))),
    );
  }

}

class DatumT {
  DatumT({
    required this.id,
    required this.datumId,
    required this.user,
    required this.experience,
    required this.bio,
    required this.achievement,
    required this.coachingExpertise,
    required this.skillExpertise,
    required this.availability,
    required this.startTime,
    required this.endTime,
    required this.duration,
    required this.perHourRate,
    required this.avgRating,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? datumId;
  final User? user;
  final int? experience;
  final String? bio;
  final String? achievement;
  final List<String> coachingExpertise;
  final String? skillExpertise;
  final List<String> availability;
  final String? startTime;
  final String? endTime;
  final String? duration;
  final int? perHourRate;
  final double? avgRating;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory DatumT.fromJson(Map<String, dynamic> json){
    return DatumT(
      id: json["_id"],
      datumId: json["id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      experience: json["experience"],
      bio: json["bio"],
      achievement: json["achievement"],
      coachingExpertise: json["coaching_expertise"] == null ? [] : List<String>.from(json["coaching_expertise"]!.map((x) => x)),
      skillExpertise: json["skill_expertise"],
      availability: json["availability"] == null ? [] : List<String>.from(json["availability"]!.map((x) => x)),
      startTime: json["start_time"],
      endTime: json["end_time"],
      duration: json["duration"],
      perHourRate: json["per_hour_rate"],
      avgRating: (json["avgRating"] is int)
          ? (json["avgRating"] as int).toDouble() // Convert int to double
          : json["avgRating"] as double?,
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}

class User {
  User({
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.photoUrl,
  });

  final String? name;
  final String? email;
  final String? contactNumber;
  final String? photoUrl;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      name: json["name"],
      email: json["email"],
      contactNumber: json["contactNumber"],
      photoUrl: json["photoUrl"],
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
