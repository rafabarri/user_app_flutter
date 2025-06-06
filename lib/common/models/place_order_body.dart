

import 'package:flutter_restaurant/features/address/domain/models/address_model.dart';

class PlaceOrderBody {
  List<Cart>? _cart;
  double? _couponDiscountAmount;
  double? _bringChangeAmount;
  String? _couponDiscountTitle;
  double? _orderAmount;
  String? _orderType;
  int? _deliveryAddressId;
  AddressModel ? _deliveryAddress;
  String? _paymentMethod;
  String? _orderNote;
  String? _couponCode;
  String? _deliveryTime;
  String? _deliveryDate;
  int? _branchId;
  double? _distance;
  String? _transactionReference;
  OfflinePaymentInfo? _paymentInfo;
  String? _isPartial;
  String? _isCutleryRequired;
  int? _selectedDeliveryArea;

  PlaceOrderBody copyWith({String? paymentMethod, String? transactionReference}) {
    _paymentMethod = paymentMethod;
    _transactionReference = transactionReference;
    return this;
  }

  PlaceOrderBody(
      {required List<Cart> cart,
        required double? couponDiscountAmount,
        required String? couponDiscountTitle,
        required String? couponCode,
        required double orderAmount,
        required int? deliveryAddressId,
        required String? orderType,
        required String paymentMethod,
        required int? branchId,
        required String deliveryTime,
        required String deliveryDate,
        required String orderNote,
        required double distance,
        required String isPartial,
        String? transactionReference,
        OfflinePaymentInfo? paymentInfo,
        String? isCutleryRequired,
        int? selectedDeliveryArea,
        double? bringChangeAmount,
        AddressModel?  deliveryAddress,
      }) {
    _cart = cart;
    _couponDiscountAmount = couponDiscountAmount;
    _couponDiscountTitle = couponDiscountTitle;
    _orderAmount = orderAmount;
    _orderType = orderType;
    _deliveryAddressId = deliveryAddressId;
    _deliveryAddress = deliveryAddress;
    _paymentMethod = paymentMethod;
    _orderNote = orderNote;
    _couponCode = couponCode;
    _deliveryTime = deliveryTime;
    _deliveryDate = deliveryDate;
    _branchId = branchId;
    _distance = distance;
    _transactionReference = transactionReference;
    _paymentInfo = paymentInfo;
    _isPartial = isPartial;
    _isCutleryRequired = isCutleryRequired;
    _selectedDeliveryArea = selectedDeliveryArea;
    _bringChangeAmount = bringChangeAmount;
  }

  List<Cart>? get cart => _cart;
  double? get couponDiscountAmount => _couponDiscountAmount;
  String? get couponDiscountTitle => _couponDiscountTitle;
  double? get orderAmount => _orderAmount;
  String? get orderType => _orderType;
  int? get deliveryAddressId => _deliveryAddressId;
  String? get paymentMethod => _paymentMethod;
  String? get orderNote => _orderNote;
  String? get couponCode => _couponCode;
  String? get deliveryTime => _deliveryTime;
  String? get deliveryDate => _deliveryDate;
  int? get branchId => _branchId;
  double? get distance => _distance;
  String? get transactionReference => _transactionReference;
  OfflinePaymentInfo? get paymentInfo => _paymentInfo;
  AddressModel? get deliveryAddress => _deliveryAddress;
  String? get isPartial => _isPartial;
  String? get isCutleryRequired => _isCutleryRequired;
  int? get selectedDeliveryArea => _selectedDeliveryArea;
  double? get bringChangeAmount => _bringChangeAmount;

  PlaceOrderBody.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      _cart = [];
      json['cart'].forEach((v) {
        _cart!.add(Cart.fromJson(v));
      });
    }
    _couponDiscountAmount = json['coupon_discount_amount'];
    _couponDiscountTitle = json['coupon_discount_title'];
    _orderAmount = json['order_amount'];
    _orderType = json['order_type'];
    _deliveryAddressId = json['delivery_address_id'];
    _paymentMethod = json['payment_method'];
    _orderNote = json['order_note'];
    _couponCode = json['coupon_code'];
    _deliveryTime = json['delivery_time'];
    _deliveryDate = json['delivery_date'];
    _selectedDeliveryArea = json['selected_delivery_area'];
    _branchId = json['branch_id'];
    _distance = json['distance'];
    if(json['payment_info'] != null){
      _paymentInfo = json['payment_info'];
    }
    if(json['delivery_address'] != null){
      _deliveryAddress = AddressModel.fromJson(json['delivery_address']);
    }
    _isPartial = json['is_partial'];
    _isCutleryRequired = json['is_cutlery_required'];
    _bringChangeAmount = json['bring_change_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_cart != null) {
      data['cart'] = _cart!.map((v) => v.toJson()).toList();
    }
    data['coupon_discount_amount'] = _couponDiscountAmount;
    data['coupon_discount_title'] = _couponDiscountTitle;
    data['order_amount'] = _orderAmount;
    data['order_type'] = _orderType;
    data['delivery_address_id'] = _deliveryAddressId;
    data['payment_method'] = _paymentMethod;
    data['order_note'] = _orderNote;
    data['coupon_code'] = _couponCode;
    data['delivery_time'] = _deliveryTime;
    data['delivery_date'] = _deliveryDate;
    data['branch_id'] = _branchId;
    data['distance'] = _distance;
    data['selected_delivery_area'] = selectedDeliveryArea;
    if(_transactionReference != null) {
      data['transaction_reference'] = _transactionReference;
    }
    if(_paymentInfo != null){
      data['payment_info'] = _paymentInfo?.toJson();
    }
    if(_deliveryAddress != null){
      data['delivery_address'] = _deliveryAddress?.toJson();
    }
    data['is_partial'] = _isPartial;
    data['is_cutlery_required'] = _isCutleryRequired;
    data['bring_change_amount'] = _bringChangeAmount;
    return data;
  }
}

class Cart {
  String? _productId;
  String? _price;
  List<String>? _variant;
  List<OrderVariation>? _variation;
  double? _discountAmount;
  int? _quantity;
  double? _taxAmount;
  List<int?>? _addOnIds;
  List<int?>? _addOnQtys;

  Cart(
      String productId,
        String price,
        List<String> variant,
        List<OrderVariation> variation,
        double? discountAmount,
        int? quantity,
        double? taxAmount,
        List<int?> addOnIds,
        List<int?> addOnQtys) {
    _productId = productId;
    _price = price;
    _variant = variant;
    _variation = variation;
    _discountAmount = discountAmount;
    _quantity = quantity;
    _taxAmount = taxAmount;
    _addOnIds = addOnIds;
    _addOnQtys = addOnQtys;
  }

  String? get productId => _productId;
  String? get price => _price;
  List<String>? get variant => _variant;
  List<OrderVariation>? get variation => _variation;
  double? get discountAmount => _discountAmount;
  int? get quantity => _quantity;
  double? get taxAmount => _taxAmount;
  List<int?>? get addOnIds => _addOnIds;
  List<int?>? get addOnQtys => _addOnQtys;

  Cart.fromJson(Map<String, dynamic> json) {
    _productId = json['product_id'];
    _price = json['price'];
    if(_variant != null) {
      _variant = json['variant'];
    }

    if (json['variations'] != null) {
      _variation = [];
      json['variations'].forEach((v) {
        _variation!.add(OrderVariation.fromJson(v));
      });
    }
    _discountAmount = json['discount_amount'];
    _quantity = json['quantity'];
    _taxAmount = json['tax_amount'];
    _addOnIds = json['add_on_ids'].cast<int>();
    _addOnQtys = json['add_on_qtys'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = _productId;
    data['price'] = _price;
    data['variant'] = _variant;
    if (_variation != null) {
      data['variations'] = _variation!.map((v) => v.toJson()).toList();
    }
    data['discount_amount'] = _discountAmount;
    data['quantity'] = _quantity;
    data['tax_amount'] = _taxAmount;
    data['add_on_ids'] = _addOnIds;
    data['add_on_qtys'] = _addOnQtys;
    return data;
  }
}

class OrderVariation {
  String? name;
  OrderVariationValue? values;

  OrderVariation({this.name, this.values});

  OrderVariation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    values =
    json['values'] != null ? OrderVariationValue.fromJson(json['values']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (values != null) {
      data['values'] = values!.toJson();
    }
    return data;
  }
}
class OrderVariationValue {
  List<String?>? label;

  OrderVariationValue({this.label});

  OrderVariationValue.fromJson(Map<String, dynamic> json) {
    label = json['label'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    return data;
  }
}

class OfflinePaymentInfo{
  final String? paymentName;
  final String? paymentNote;
  final List<Map<String, dynamic>?>? methodFields;
  final List<Map<String, String>>? methodInformation;

  OfflinePaymentInfo(
      {this.paymentName,
        this.paymentNote,
        this.methodFields,
        this.methodInformation});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_name'] = paymentName;
    data['method_fields'] = methodFields;
    data['payment_note'] = paymentNote;
    data['method_information'] = methodInformation;
    return data;
  }
}
