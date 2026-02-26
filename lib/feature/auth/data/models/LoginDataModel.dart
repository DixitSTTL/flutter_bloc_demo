import '../../domain/entities/User.dart';

class LoginDataModel extends User {
  const LoginDataModel({
    required super.name,
    required super.role,
    required super.shopCode,
    required super.userId,
    required super.username,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      name: json['name'],
      role: json['role'],
      shopCode: json['shopCode'],
      userId: json['userId'],
      username: json['username'],
    );
  }
}
