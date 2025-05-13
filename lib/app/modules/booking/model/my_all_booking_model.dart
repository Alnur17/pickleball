class MyAllBookingModel {
  MyAllBookingModel({
    required this.success,
    required this.message,
    required this.meta,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Meta? meta;
  final List<Datum> data;

  factory MyAllBookingModel.fromJson(Map<String, dynamic> json){
    return MyAllBookingModel(
      success: json["success"],
      message: json["message"],
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

}

class Datum {
  Datum({
    required this.id,
    required this.user,
    required this.session,
    required this.slot,
    required this.credit,
    required this.paymentStatus,
    required this.status,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final User? user;
  final Session? session;
  final Slot? slot;
  final int? credit;
  final String? paymentStatus;
  final String? status;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["_id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      session: json["session"] == null ? null : Session.fromJson(json["session"]),
      slot: json["slot"] == null ? null : Slot.fromJson(json["slot"]),
      credit: json["credit"],
      paymentStatus: json["paymentStatus"],
      status: json["status"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
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
    required this.credit,
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
  final dynamic coach;
  final DateTime? startDate;
  final int? duration;
  final int? maxParticipants;
  final int? credit;
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
      coach: json["coach"],
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      duration: json["duration"],
      maxParticipants: json["max_participants"],
      credit: json["credit"],
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

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      contactNumber: json["contactNumber"],
      photoUrl: json["photoUrl"],
      age: json["age"],
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
