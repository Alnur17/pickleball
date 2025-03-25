class MyWaitlistModel {
  MyWaitlistModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory MyWaitlistModel.fromJson(Map<String, dynamic> json){
    return MyWaitlistModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.data,
    required this.meta,
  });

  final List<Result> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<Result>.from(json["data"]!.map((x) => Result.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class Result {
  Result({
    required this.id,
    required this.user,
    required this.session,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? user;
  final Session? session;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Result.fromJson(Map<String, dynamic> json){
    return Result(
      id: json["_id"],
      user: json["user"],
      session: json["session"] == null ? null : Session.fromJson(json["session"]),
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
