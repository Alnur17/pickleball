class PaymentConfirmModel {
  PaymentConfirmModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory PaymentConfirmModel.fromJson(Map<String, dynamic> json){
    return PaymentConfirmModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.modelType,
    required this.account,
    required this.reference,
    required this.transactionId,
    required this.amount,
    required this.status,
    required this.paymentIntentId,
    required this.isPaid,
    required this.isDeleted,
    required this.dataId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? modelType;
  final String? account;
  final String? reference;
  final String? transactionId;
  final int? amount;
  final String? status;
  final String? paymentIntentId;
  final bool? isPaid;
  final bool? isDeleted;
  final String? dataId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["_id"],
      modelType: json["modelType"],
      account: json["account"],
      reference: json["reference"],
      transactionId: json["transaction_id"],
      amount: json["amount"],
      status: json["status"],
      paymentIntentId: json["paymentIntentId"],
      isPaid: json["isPaid"],
      isDeleted: json["isDeleted"],
      dataId: json["id"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}
