class NotificationResponse {
  final bool success;
  final int statusCode;
  final String message;
  final Meta meta;
  final List<NotificationData> data;

  NotificationResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.meta,
    required this.data,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      meta: Meta.fromJson(json['meta'] ?? {}),
      data: (json['data'] as List?)
          ?.map((item) => NotificationData.fromJson(item))
          .toList() ??
          [],
    );
  }
}

class Meta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  Meta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 10,
      total: json['total'] ?? 0,
      totalPage: json['totalPage'] ?? 1,
    );
  }
}

class NotificationData {
  final String id;
  final String userId;
  final String type;
  final String title;
  final String message;
  final String? orderId;
  final String? bookId;
  final String? reviewId;
  final bool isRead;
  final DateTime createdAt;

  NotificationData({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.message,
    this.orderId,
    this.bookId,
    this.reviewId,
    required this.isRead,
    required this.createdAt,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      type: json['type'] ?? '',
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      orderId: json['orderId'],
      bookId: json['bookId'],
      reviewId: json['reviewId'],
      isRead: json['isRead'] ?? false,
      createdAt: DateTime.parse(
        json['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }

  NotificationData copyWith({
    String? id,
    String? userId,
    String? type,
    String? title,
    String? message,
    String? orderId,
    String? bookId,
    String? reviewId,
    bool? isRead,
    DateTime? createdAt,
  }) {
    return NotificationData(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      title: title ?? this.title,
      message: message ?? this.message,
      orderId: orderId ?? this.orderId,
      bookId: bookId ?? this.bookId,
      reviewId: reviewId ?? this.reviewId,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}