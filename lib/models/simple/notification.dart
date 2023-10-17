class Notificationn {
  int id;
  int userId;
  String title;
  String body;
  String data;
  int isOpen;
  String createdAt;
  String updatedAt;
  String titleAr;
  String bodyAr;
  String number;
  int orderStatus;
  String userType;

  Notificationn({
    this.id = 0,
    this.userId = 0,
    this.title = "",
    this.body = "",
    this.data = "",
    this.isOpen = 0,
    this.createdAt = "",
    this.updatedAt = "",
    this.titleAr = "",
    this.bodyAr = "",
    this.number = "",
    this.orderStatus = 0,
    this.userType = "customer",
  });

  factory Notificationn.fromJson(Map<String, dynamic> json) => Notificationn(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? 0,
        title: json["title"] ?? "",
        body: json["body"] ?? "",
        data: json["data"] ?? "",
        isOpen: json["is_open"] ?? 0,
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        titleAr: json["title_ar"] ?? "",
        bodyAr: json["body_ar"] ?? "",
        number: json["number"] ?? "",
        orderStatus: json["order_status"] ?? 0,
        userType: json["user_type"] ?? "customer",
      );
}
