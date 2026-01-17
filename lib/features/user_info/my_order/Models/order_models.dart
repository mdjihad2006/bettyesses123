class OrdersResponse {
  final bool success;
  final int statusCode;
  final String message;
  final Meta? meta;
  final List<OrderModel>? data;

  OrdersResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    this.meta,
    this.data,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) => OrdersResponse(
    success: json['success'] ?? false,
    statusCode: json['statusCode'] ?? 0,
    message: json['message'] ?? '',
    meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    data: json['data'] != null
        ? List<OrderModel>.from(
        (json['data'] as List).map((x) => OrderModel.fromJson(x)))
        : [],
  );
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

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    total: json['total'] ?? 0,
    page: json['page'] ?? 1,
    limit: json['limit'] ?? 10,
    totalPage: json['totalPage'] ?? 1,
  );
}

class OrderModel {
  final String id;
  final String userId;
  final String orderNumber;
  final String status;
  final String email;
  final String phone;
  final String country;
  final String firstName;
  final String lastName;
  final String streetAddress;
  final String city;
  final String state;
  final String postalCode;
  final double subtotal;
  final double discountAmount;
  final double total;
  final String? promocodeId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<OrderItem>? orderItems;
  final dynamic payment;

  OrderModel({
    required this.id,
    required this.userId,
    required this.orderNumber,
    required this.status,
    required this.email,
    required this.phone,
    required this.country,
    required this.firstName,
    required this.lastName,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.subtotal,
    required this.discountAmount,
    required this.total,
    this.promocodeId,
    required this.createdAt,
    required this.updatedAt,
    this.orderItems,
    this.payment,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json['id'] ?? '',
    userId: json['userId'] ?? '',
    orderNumber: json['orderNumber'] ?? '',
    status: json['status'] ?? '',
    email: json['email'] ?? '',
    phone: json['phone'] ?? '',
    country: json['country'] ?? '',
    firstName: json['firstName'] ?? '',
    lastName: json['lastName'] ?? '',
    streetAddress: json['streetAddress'] ?? '',
    city: json['city'] ?? '',
    state: json['state'] ?? '',
    postalCode: json['postalCode'] ?? '',
    subtotal: (json['subtotal'] ?? 0).toDouble(),
    discountAmount: (json['discountAmount'] ?? 0).toDouble(),
    total: (json['total'] ?? 0).toDouble(),
    promocodeId: json['promocodeId'],
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
    orderItems: json['orderItems'] != null
        ? List<OrderItem>.from(
        (json['orderItems'] as List)
            .map((x) => OrderItem.fromJson(x)))
        : [],
    payment: json['payment'],
  );
}

class OrderItem {
  final String id;
  final String orderId;
  final String bookId;
  final double price;
  final String format;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Book? book;

  OrderItem({
    required this.id,
    required this.orderId,
    required this.bookId,
    required this.price,
    required this.format,
    required this.createdAt,
    required this.updatedAt,
    this.book,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    id: json['id'] ?? '',
    orderId: json['orderId'] ?? '',
    bookId: json['bookId'] ?? '',
    price: (json['price'] ?? 0).toDouble(),
    format: json['format'] ?? '',
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
    book: json['book'] != null ? Book.fromJson(json['book']) : null,
  );
}

class Book {
  final String id;
  final String userId;
  final String templateId;
  final String childName;
  final int age;
  final String gender;
  final String birthMonth;
  final String? photoUrl;
  final String? aiGeneratedPhotoUrl;
  final List<dynamic>? generatedPages;
  final String generationStatus;
  final int generationProgress;
  final String? generationError;
  final bool isOriginal;
  final String originalBookId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Template? template;

  Book({
    required this.id,
    required this.userId,
    required this.templateId,
    required this.childName,
    required this.age,
    required this.gender,
    required this.birthMonth,
    this.photoUrl,
    this.aiGeneratedPhotoUrl,
    this.generatedPages,
    required this.generationStatus,
    required this.generationProgress,
    this.generationError,
    required this.isOriginal,
    required this.originalBookId,
    required this.createdAt,
    required this.updatedAt,
    this.template,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    id: json['id'] ?? '',
    userId: json['userId'] ?? '',
    templateId: json['templateId'] ?? '',
    childName: json['childName'] ?? '',
    age: json['age'] ?? 0,
    gender: json['gender'] ?? '',
    birthMonth: json['birthMonth'] ?? '',
    photoUrl: json['photoUrl'],
    aiGeneratedPhotoUrl: json['aiGeneratedPhotoUrl'],
    generatedPages: json['generatedPages'] != null
        ? List<dynamic>.from(json['generatedPages'])
        : [],
    generationStatus: json['generationStatus'] ?? '',
    generationProgress: json['generationProgress'] ?? 0,
    generationError: json['generationError'],
    isOriginal: json['isOriginal'] ?? false,
    originalBookId: json['originalBookId'] ?? '',
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
    template: json['template'] != null ? Template.fromJson(json['template']) : null,
  );
}

class Template {
  final String id;
  final String title;
  final String description;
  final String ageRange;
  final String category;
  final String coverImage;
  final List<String>? thumbnails;
  final double price;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  Template({
    required this.id,
    required this.title,
    required this.description,
    required this.ageRange,
    required this.category,
    required this.coverImage,
    this.thumbnails,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Template.fromJson(Map<String, dynamic> json) => Template(
    id: json['id'] ?? '',
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    ageRange: json['ageRange'] ?? '',
    category: json['category'] ?? '',
    coverImage: json['coverImage'] ?? '',
    thumbnails: json['thumbnails'] != null
        ? List<String>.from(json['thumbnails'])
        : [],
    price: (json['price'] ?? 0).toDouble(),
    isActive: json['isActive'] ?? false,
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
  );
}
