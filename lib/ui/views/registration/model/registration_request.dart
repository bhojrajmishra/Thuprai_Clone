class RegistrationRequest {
  final String fullname;
  final String email;
  final String password;

  RegistrationRequest({
    required this.fullname,
    required this.email,
    required this.password,
  });

  // Convert a JSON map into a LoginModel object
  factory RegistrationRequest.fromJson(Map<String, dynamic> json) {
    return RegistrationRequest(
      fullname: json['full_name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  // Convert a LoginModel object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'full_name': fullname,
      'email': email,
      'password': password,
    };
  }
}
