class TermsResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<TermsData> data;

  TermsResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory TermsResponseModel.fromJson(Map<String, dynamic> json) {
    return TermsResponseModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => TermsData.fromJson(e))
          .toList(),
    );
  }
}

class TermsData {
  final String id;
  final String type;
  final String title;
  final int policyNumber;
  final List<String> features;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TermsData({
    required this.id,
    required this.type,
    required this.title,
    required this.policyNumber,
    required this.features,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory TermsData.fromJson(Map<String, dynamic> json) {
    return TermsData(
      id: json['id'] ?? '',
      type: json['type'] ?? '',
      title: json['title'] ?? '',
      policyNumber: json['policyNumber'] ?? 0,
      features: List<String>.from(json['features'] ?? []),
      isActive: json['isActive'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }
}
