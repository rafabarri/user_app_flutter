import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/widgets/custom_asset_image_widget.dart';
import 'package:flutter_restaurant/common/widgets/custom_image_widget.dart';
import 'package:flutter_restaurant/features/order/domain/models/order_model.dart';
import 'package:flutter_restaurant/features/splash/providers/splash_provider.dart';
import 'package:flutter_restaurant/helper/responsive_helper.dart';
import 'package:flutter_restaurant/helper/router_helper.dart';
import 'package:flutter_restaurant/localization/app_localization.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/images.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackMapDeliverymanInfo extends StatelessWidget {
  final DeliveryMan? deliveryMan;
  final int? oderId;
  const TrackMapDeliverymanInfo({super.key, this.deliveryMan, this.oderId});

  @override
  Widget build(BuildContext context) {

    final SplashProvider splashProvider = Provider.of<SplashProvider>(context, listen: false);
    double iconSize = ResponsiveHelper.isDesktop(context) ? 22 : 27;

    int ratingCount = deliveryMan?.ratingCount ?? 0;

    return Row(children: [
      ClipOval(child: CustomImageWidget(
        image: '${splashProvider.baseUrls?.deliveryManImageUrl}/${deliveryMan?.image ?? ""}',
        width: 50, height: 50,
      )),
      const SizedBox(width: 10),
      Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: 3,children: [
        Text('${deliveryMan?.fName?.toCapitalized() ?? ""} ${deliveryMan?.lName?.toCapitalized() ?? ""}',
          style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge),
        ),

        if((deliveryMan?.rating?.isNotEmpty ?? false) && (deliveryMan?.rating?.first.average ??  0) > 0)
         Row(
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 16),
            Text('${deliveryMan?.rating?.first.average} (${ratingCount> 2 ? "${ratingCount - 1} +" : ratingCount})'),
          ],
        ),
      ],
      ),
      const Spacer(),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha:0.5), offset: const Offset(0, 5),
            spreadRadius: 5, blurRadius: 15,
          )],
        ),
        child: InkWell(
          onTap: () {
            RouterHelper.getChatRoute(orderId: oderId);
          },
          child: CustomAssetImageWidget(Images.chat, width: iconSize, height: iconSize),
        ),
      ),
      const SizedBox(width: 15),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha:0.5), offset: const Offset(0, 5),
            spreadRadius: 5, blurRadius: 15,
          )],
        ),
        child: InkWell(
          onTap: () => launchUrl(Uri.parse('tel:${deliveryMan?.phone}'), mode: LaunchMode.externalApplication),
          child:  CustomAssetImageWidget(Images.callIcon, width: iconSize, height: iconSize),
        ),
      ),
    ]);
  }
}
