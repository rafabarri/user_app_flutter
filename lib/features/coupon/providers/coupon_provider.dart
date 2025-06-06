import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/api_response_model.dart';
import 'package:flutter_restaurant/features/coupon/domain/models/coupon_model.dart';
import 'package:flutter_restaurant/features/coupon/domain/reposotories/coupon_repo.dart';
import 'package:flutter_restaurant/helper/api_checker_helper.dart';
import 'package:flutter_restaurant/main.dart';
import 'package:flutter_restaurant/features/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class CouponProvider extends ChangeNotifier {
  final CouponRepo? couponRepo;
  CouponProvider({required this.couponRepo});

  List<CouponModel>? _couponList;
  CouponModel? _coupon;
  double? _discount = 0.0;
  String? _code = '';
  bool _isLoading = false;

  CouponModel? get coupon => _coupon;
  double? get discount => _discount;
  String? get code => _code;
  bool get isLoading => _isLoading;
  List<CouponModel>? get couponList => _couponList;

  Future<void> getCouponList() async {
    ApiResponseModel apiResponse = await couponRepo!.getCouponList(
      guestId: Provider.of<AuthProvider>(Get.context!, listen: false).getGuestId(),
    );
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {

      _couponList = [];
      apiResponse.response!.data.forEach((category) => _couponList!.add(CouponModel.fromJson(category)));

      notifyListeners();
    } else {
      ApiCheckerHelper.checkApi(apiResponse);
    }
  }

  Future<double?> applyCoupon(String coupon, double amountWithoutVat) async {
    _isLoading = true;
    notifyListeners();
    ApiResponseModel apiResponse = await couponRepo!.applyCoupon(coupon, guestId: Provider.of<AuthProvider>(Get.context!, listen: false).getGuestId(),);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _coupon = CouponModel.fromJson(apiResponse.response!.data);
      _code = _coupon!.code;
      if (_coupon!.minPurchase != null && _coupon!.minPurchase! <= amountWithoutVat) {
        if(_coupon!.discountType == 'percent') {
          if(_coupon!.maxDiscount != null && _coupon!.maxDiscount != 0) {
            _discount = (_coupon!.discount! * amountWithoutVat / 100) < _coupon!.maxDiscount! ? (_coupon!.discount! * amountWithoutVat / 100) : _coupon!.maxDiscount;
          }else {
            _discount = _coupon!.discount! * amountWithoutVat / 100;
          }
        }else {
          if(_coupon!.maxDiscount != null){
            _discount = _coupon!.discount;
          }
          _discount = _coupon!.discount;
        }
      } else {
        _discount = 0.0;
      }
    } else {
      _discount = 0.0;
    }
    _isLoading = false;
    notifyListeners();
    return _discount;
  }

  void removeCouponData(bool notify) {
    _coupon = null;
    _isLoading = false;
    _discount = 0.0;
    _code = '';
    if(notify) {
      notifyListeners();
    }
  }
}