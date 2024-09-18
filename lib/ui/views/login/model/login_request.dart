class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  // Convert a JSON map into a LoginModel object
  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  // Convert a LoginModel object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
