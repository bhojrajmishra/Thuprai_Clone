class RegistrationResponse {
  final String fullName;
  final String email;
  final String password;

  RegistrationResponse({
    required this.fullName,
    required this.email,
    required this.password,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      fullName: json['full_name'],
      email: json['email'],
      password: json['password'],
    );
  }
}
