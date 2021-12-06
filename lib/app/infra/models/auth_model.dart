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

class RegisterResponseModel {
  final String token;
  RegisterResponseModel({required this.token});

  factory RegisterResponseModel.fromMap(Map<String, dynamic> map) {
    return RegisterResponseModel(
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

class RegisterRequestModel {
  String name;
  String email;
  String password;
  String document;
  String phone;
  String provider;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.document,
    required this.phone,
    required this.provider,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name.trim(),
      'email': email.trim(),
      'password': password.trim(),
      'document_id': document.trim(),
      'phone': phone.trim(),
      'provider': provider.trim(),
    };
    return map;
  }
}
