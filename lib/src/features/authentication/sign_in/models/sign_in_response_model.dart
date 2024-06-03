class SignInResponseModel {
  final String? token;
  final String? userEmail;
  final String? userNicename;
  final String? userDisplayName;

  SignInResponseModel({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
        token: json["token"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userDisplayName: json["user_display_name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_email": userEmail,
        "user_nicename": userNicename,
        "user_display_name": userDisplayName,
      };
}
