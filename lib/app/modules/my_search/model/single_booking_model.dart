class SingleBookingModel {
  SingleBookingModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final bool? success;
  final int? statusCode;
  final String? message;
  final Data? data;

  factory SingleBookingModel.fromJson(Map<String, dynamic> json){
    return SingleBookingModel(
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
    required this.user,
    required this.session,
    required this.slot,
    required this.amount,
    required this.paymentStatus,
    required this.status,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final DataUser? user;
  final Session? session;
  final Slot? slot;
  final int? amount;
  final String? paymentStatus;
  final String? status;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["_id"],
      user: json["user"] == null ? null : DataUser.fromJson(json["user"]),
      session: json["session"] == null ? null : Session.fromJson(json["session"]),
      slot: json["slot"] == null ? null : Slot.fromJson(json["slot"]),
      amount: json["amount"],
      paymentStatus: json["paymentStatus"],
      status: json["status"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}

class Session {
  Session({
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
    required this.sessionId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
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
  final String? sessionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Session.fromJson(Map<String, dynamic> json){
    return Session(
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
      sessionId: json["id"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
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
  final CoachUser? user;
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

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      id: json["_id"],
      coachId: json["id"],
      user: json["user"] == null ? null : CoachUser.fromJson(json["user"]),
      experience: json["experience"],
      bio: json["bio"],
      achievement: json["achievement"],
      coachingExpertise: json["coaching_expertise"] == null
          ? []
          : List<String>.from(json["coaching_expertise"]!.map((x) => x)),
      skillExpertise: json["skill_expertise"],
      availability: json["availability"] == null
          ? []
          : List<String>.from(json["availability"]!.map((x) => x)),
      startTime: json["start_time"],
      endTime: json["end_time"],
      duration: json["duration"],
      perHourRate: json["per_hour_rate"],
      // Convert avgRating to double if it's an int, or keep it null if absent
      avgRating: json["avgRating"] != null
          ? (json["avgRating"] is int
          ? (json["avgRating"] as int).toDouble()
          : json["avgRating"] as double?)
          : null,
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class CoachUser {
  CoachUser({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;

  factory CoachUser.fromJson(Map<String, dynamic> json){
    return CoachUser(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      photoUrl: json["photoUrl"],
    );
  }

}

class Slot {
  Slot({
    required this.id,
    required this.session,
    required this.startTime,
    required this.endTime,
    required this.isDeleted,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? session;
  final String? startTime;
  final String? endTime;
  final bool? isDeleted;
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Slot.fromJson(Map<String, dynamic> json){
    return Slot(
      id: json["_id"],
      session: json["session"],
      startTime: json["startTime"],
      endTime: json["endTime"],
      isDeleted: json["isDeleted"],
      v: json["__v"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

}

class DataUser {
  DataUser({
    required this.id,
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.photoUrl,
    required this.age,
  });

  final String? id;
  final String? name;
  final String? email;
  final String? contactNumber;
  final dynamic photoUrl;
  final dynamic age;

  factory DataUser.fromJson(Map<String, dynamic> json){
    return DataUser(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      contactNumber: json["contactNumber"],
      photoUrl: json["photoUrl"],
      age: json["age"],
    );
  }

}
