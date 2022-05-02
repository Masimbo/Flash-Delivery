/// message : "Order placed successfully!"

class OrderModel {
  OrderModel({
      String? message,}){
    _message = message;
}

  OrderModel.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
OrderModel copyWith({  String? message,
}) => OrderModel(  message: message ?? _message,
);
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}