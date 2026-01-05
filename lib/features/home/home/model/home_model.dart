class BookTemplateResponse {
  final bool success;
  final int statusCode;
  final String message;
  final Meta meta;
  final List<BookTemplate> data;

  BookTemplateResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.meta,
    required this.data,
  });

  factory BookTemplateResponse.fromJson(Map<String, dynamic> json) {
    return BookTemplateResponse(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      meta: Meta.fromJson(json['meta'] ?? {}),
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => BookTemplate.fromJson(e))
          .toList(),
    );
  }
}

class Meta {
  final int total;
  final int page;
  final int limit;
  final int totalPage;

  Meta({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'] ?? 0,
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
      totalPage: json['totalPage'] ?? 0,
    );
  }
}

class BookTemplate {
  final String id;
  final String title;
  final String description;
  final String ageRange;
  final String category;
  final String coverImage;
  final List<String> thumbnails;
  final int price;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  BookTemplate({
    required this.id,
    required this.title,
    required this.description,
    required this.ageRange,
    required this.category,
    required this.coverImage,
    required this.thumbnails,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookTemplate.fromJson(Map<String, dynamic> json) {
    return BookTemplate(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      ageRange: json['ageRange'] ?? '',
      category: json['category'] ?? '',
      coverImage: json['coverImage'] ?? '',
      thumbnails: List<String>.from(json['thumbnails'] ?? []),
      price: json['price'] ?? 0,
      isActive: json['isActive'] ?? false,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }
}
