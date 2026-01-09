class AddressResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<AddressModel> data;

  AddressResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) {
    return AddressResponseModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => AddressModel.fromJson(e))
          .toList(),
    );
  }
}

class AddressModel {
  final String id;
  final String userId;
  final String addressType;
  final String firstName;
  final String lastName;
  final String streetAddress;
  final String aptBuilding;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String phone;
  final bool isDefault;
  final DateTime createdAt;
  final DateTime updatedAt;

  AddressModel({
    required this.id,
    required this.userId,
    required this.addressType,
    required this.firstName,
    required this.lastName,
    required this.streetAddress,
    required this.aptBuilding,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    required this.phone,
    required this.isDefault,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      addressType: json['addressType'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      streetAddress: json['streetAddress'] ?? '',
      aptBuilding: json['aptBuilding'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      zipCode: json['zipCode'] ?? '',
      country: json['country'] ?? '',
      phone: json['phone'] ?? '',
      isDefault: json['isDefault'] ?? false,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }
}
