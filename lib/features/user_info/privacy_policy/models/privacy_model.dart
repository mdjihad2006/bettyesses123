class PolicyResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<PolicyData> data;

  const PolicyResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory PolicyResponseModel.fromJson(Map<String, dynamic> json) {
    return PolicyResponseModel(
      success: json['success'] == true,
      statusCode: json['statusCode'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => PolicyData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class PolicyData {
  final String id;
  final String type;
  final String title;
  final int policyNumber;
  final List<String> features;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const PolicyData({
    required this.id,
    required this.type,
    required this.title,
    required this.policyNumber,
    required this.features,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory PolicyData.fromJson(Map<String, dynamic> json) {
    return PolicyData(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      policyNumber: json['policyNumber'] as int? ?? 0,
      features: (json['features'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      isActive: json['isActive'] == true,
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
    );
  }
}
