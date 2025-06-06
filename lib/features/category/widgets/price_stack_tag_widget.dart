import 'package:flutter/material.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class PriceStackTagWidget extends StatelessWidget {
  final String value;
  const PriceStackTagWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            //color: Theme.of(context).textTheme.bodyText1?.color?.withValues(alpha:0.4),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5),
            ),
            gradient: LinearGradient(colors: [
              Colors.black.withValues(alpha:0.7),
              Colors.black.withValues(alpha:0.35),
            ]),
          ),

          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Text(value,
              style: robotoRegular.copyWith(
                fontSize: Dimensions.fontSizeDefault, color: Colors.white,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
