class UserProfileModel {
  final bool success;
  final int statusCode;
  final String message;
  final UserData? data;

  UserProfileModel({
    required this.success,
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? UserData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'statusCode': statusCode,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class UserData {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? image; // null হতে পারে
  final int profileView;
  final bool isEmailVerified;
  final String role;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.image,
    required this.profileView,
    required this.isEmailVerified,
    required this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      image: json['image'],
      profileView: json['profileView'] ?? 0,
      isEmailVerified: json['isEmailVerified'] ?? false,
      role: json['role'] ?? '',
      status: json['status'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
      'profileView': profileView,
      'isEmailVerified': isEmailVerified,
      'role': role,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
