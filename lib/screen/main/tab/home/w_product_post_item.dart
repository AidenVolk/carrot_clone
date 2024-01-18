import 'package:cached_network_image/cached_network_image.dart';
import 'package:carrot_clone/common/common.dart';
import 'package:carrot_clone/entity/post/vo_product_post.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;





class ProductPostItem extends StatelessWidget {
  const ProductPostItem(this.post, {Key? key}) : super(key: key);

  final ProductPost post;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10 ),
              child: CachedNetworkImage(
                imageUrl: post.product.images[0],
                width: 150,
              ),
            ),
            const Width(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  post.content.text.size(17).bold.make(),
                  Row(
                    children: [
                      post.address.simpleAddress.text.color(context.appColors.lessImportantColor).make(),
                      "•".text.color(context.appColors.lessImportantColor).make(),
                      timeago.format(
                        post.createdTime,
                        locale: context.locale.languageCode,
                      ).text.color(context.appColors.lessImportantColor) .make(),
                    ],
                  ),
                  post.product.price.toWon().text.bold.make(),
                ],
              ),
            ),
          ],
        ).p(15),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("$basePath/home/chat_count.png"),
                post.chatCount.text.make(),
                Image.asset("$basePath/home/post_heart_off.png"),
                post.likeCount.text.make(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
