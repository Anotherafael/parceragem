class LoginResponseModel {
  final String token;

  LoginResponseModel({
    required this.token,
  });

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      token: map['access_token'] ?? '',
    );
  }
}

class LoginRequestModel {
  String email;
  String password;
  String provider;

  LoginRequestModel({
    required this.email,
    required this.password,
    required this.provider,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
      'provider': provider.trim()
    };

    return map;
  }
}
