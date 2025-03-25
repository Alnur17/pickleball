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
    required this.amount,
    required this.paymentStatus,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? user;
  final Session? session;
  final Slot? slot;
  final int? amount;
  final String? paymentStatus;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["_id"],
      user: json["user"],
      session: json["session"] == null ? null : Session.fromJson(json["session"]),
      slot: json["slot"] == null ? null : Slot.fromJson(json["slot"]),
      amount: json["amount"],
      paymentStatus: json["paymentStatus"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

}

class Session {
  Session({
    required this.id,
    required this.name,
    required this.coach,
    required this.startDate,
    required this.duration,
  });

  final String? id;
  final String? name;
  final Coach? coach;
  final DateTime? startDate;
  final int? duration;

  factory Session.fromJson(Map<String, dynamic> json){
    return Session(
      id: json["_id"],
      name: json["name"],
      coach: json["coach"] == null ? null : Coach.fromJson(json["coach"]),
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      duration: json["duration"],
    );
  }

}

class Coach {
  Coach({
    required this.id,
    required this.user,
  });

  final String? id;
  final User? user;

  factory Coach.fromJson(Map<String, dynamic> json){
    return Coach(
      id: json["_id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
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
    required this.startTime,
    required this.endTime,
  });

  final String? id;
  final String? startTime;
  final String? endTime;

  factory Slot.fromJson(Map<String, dynamic> json){
    return Slot(
      id: json["_id"],
      startTime: json["startTime"],
      endTime: json["endTime"],
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
