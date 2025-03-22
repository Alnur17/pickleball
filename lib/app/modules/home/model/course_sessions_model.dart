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

  factory CourseSessionsModel.fromJson(Map<String, dynamic> json) {
    return CourseSessionsModel(
      success: json["success"] as bool?,
      statusCode: json["statusCode"] as int?,
      message: json["message"] as String?,
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
  final double? avgRating; // Changed to double? to handle both int and double
  final bool? isDeleted;
  final String? datumId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["_id"] as String?,
      name: json["name"] as String?,
      thumbnail: json["thumbnail"] as String?,
      description: json["description"] as String?,
      location: json["location"] as String?,
      locationLink: json["locationLink"],
      skillLevel: json["skill_level"] as String?,
      coach: json["coach"] == null ? null : Coach.fromJson(json["coach"]),
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      duration: json["duration"] as int?,
      maxParticipants: json["max_participants"] as int?,
      price: json["price"] as int?,
      maxWaitlist: json["max_waitlist"] as int?,
      enableWaitlist: json["enable_waitlist"] as bool?,
      status: json["status"] as String?,
      avgRating: (json["avgRating"] as num?)?.toDouble(), // Safely cast to double
      isDeleted: json["isDeleted"] as bool?,
      datumId: json["id"] as String?,
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
  final double? avgRating; // Already double?, but we'll ensure proper casting
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      id: json["_id"] as String?,
      coachId: json["id"] as String?,
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      experience: json["experience"] as int?,
      bio: json["bio"] as String?,
      achievement: json["achievement"] as String?,
      coachingExpertise: json["coaching_expertise"] == null
          ? []
          : List<String>.from(json["coaching_expertise"]!.map((x) => x as String)),
      skillExpertise: json["skill_expertise"] as String?,
      availability: json["availability"] == null
          ? []
          : List<String>.from(json["availability"]!.map((x) => x as String)),
      startTime: json["start_time"] as String?,
      endTime: json["end_time"] as String?,
      duration: json["duration"] as String?,
      perHourRate: json["per_hour_rate"] as int?,
      avgRating: (json["avgRating"] as num?)?.toDouble(), // Safely cast to double
      isDeleted: json["isDeleted"] as bool?,
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"] as int?,
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"] as String?,
      name: json["name"] as String?,
      email: json["email"] as String?,
      contactNumber: json["contactNumber"] as String?,
      photoUrl: json["photoUrl"] as String?,
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
      page: json["page"] as int?,
      limit: json["limit"] as int?,
      total: json["total"] as int?,
      totalPage: json["totalPage"] as int?,
    );
  }
}