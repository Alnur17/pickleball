class WaitlistModel {
  WaitlistModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final bool? success;
  final int? statusCode;
  final String? message;
  final Data? data;

  factory WaitlistModel.fromJson(Map<String, dynamic> json){
    return WaitlistModel(
      success: json["success"],
      statusCode: json["statusCode"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.meta,
    required this.result,
  });

  final Meta? meta;
  final List<Result> result;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
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
    required this.createdAt,
  });

  final String? id;
  final String? name;
  final Coach? coach;
  final DateTime? createdAt;

  factory Session.fromJson(Map<String, dynamic> json){
    return Session(
      id: json["_id"],
      name: json["name"],
      coach: json["coach"] == null ? null : Coach.fromJson(json["coach"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
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
