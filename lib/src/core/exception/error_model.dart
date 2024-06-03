class ErrorModel implements Exception {
  final String? code;
  final String? message;
  final ErrorModelData? data;

  ErrorModel({
    this.code,
    this.message,
    this.data,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        code: json["code"],
        message: json["message"],
        data:
            json["data"] == null ? null : ErrorModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class ErrorModelData {
  final int? status;

  ErrorModelData({
    this.status,
  });

  factory ErrorModelData.fromJson(Map<String, dynamic> json) => ErrorModelData(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
