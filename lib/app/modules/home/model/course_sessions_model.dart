class CourseSessionsModel {
  CourseSessionsModel({
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
  final List<Datum> data;

  factory CourseSessionsModel.fromJson(Map<String, dynamic> json){
    return CourseSessionsModel(
      success: json["success"],
      statusCode: json["statusCode"],
      message: json["message"],
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.description,
    required this.location,
    required this.locationLink,
    required this.skillLevel,
    required this.coach,
    required this.startDate,
    required this.duration,
    required this.maxParticipants,
    required this.price,
    required this.maxWaitlist,
    required this.enableWaitlist,
    required this.status,
    required this.avgRating,
    required this.isDeleted,
    required this.datumId,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? name;
  final String? thumbnail;
  final String? description;
  final String? location;
  final dynamic locationLink;
  final String? skillLevel;
  final Coach? coach;
  final DateTime? startDate;
  final int? duration;
  final int? maxParticipants;
  final int? price;
  final int? maxWaitlist;
  final bool? enableWaitlist;
  final String? status;
  final int? avgRating;
  final bool? isDeleted;
  final String? datumId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["_id"],
      name: json["name"],
      thumbnail: json["thumbnail"],
      description: json["description"],
      location: json["location"],
      locationLink: json["locationLink"],
      skillLevel: json["skill_level"],
      coach: json["coach"] == null ? null : Coach.fromJson(json["coach"]),
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      duration: json["duration"],
      maxParticipants: json["max_participants"],
      price: json["price"],
      maxWaitlist: json["max_waitlist"],
      enableWaitlist: json["enable_waitlist"],
      status: json["status"],
      avgRating: json["avgRating"],
      isDeleted: json["isDeleted"],
      datumId: json["id"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

}

class Coach {
  Coach({
    required this.id,
    required this.coachId,
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
  final String? coachId;
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

  factory Coach.fromJson(Map<String, dynamic> json){
    return Coach(
      id: json["_id"],
      coachId: json["id"],
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
      avgRating: json["avgRating"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.photoUrl,
  });

  final String? id;
  final String? name;
  final String? email;
  final String? contactNumber;
  final String? photoUrl;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["_id"],
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
