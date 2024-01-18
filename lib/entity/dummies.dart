// Product ===========================================================================
import 'package:carrot_clone/common/common.dart';
import 'package:carrot_clone/entity/post/vo_product_post.dart';
import 'package:carrot_clone/entity/product/product_status.dart';
import 'package:carrot_clone/entity/product/vo_product.dart';
import 'package:carrot_clone/entity/user/vo_address.dart';
import 'package:carrot_clone/entity/user/vo_user.dart';

String picSum({required int id}) {
  return "https://picsum.photos/id/$id/200/200";
}

final user1 = User(
  id: 1,
  nickName: "홍길동",
  profileUrl: picSum(id: 1010),
  temperature: 36.5,
);

final user2 = User(
  id: 2,
  nickName: "바다",
  profileUrl: picSum(id: 900),
  temperature: 36.5,
);

final user3 =
    User(id: 3, nickName: "파토", profileUrl: picSum(id: 700), temperature: 36.5);
final product1 = Product(
    user: user1,
    name: "아이폰13",
    price: 700000,
    description: "깨끗하게 잘 쓰던 물건이에요",
    status: ProductStatus.normal,
    images: [picSum(id: 100), picSum(id: 101), picSum(id: 103)]);
final product2 = Product(
    user: user1,
    name: "맥북",
    price: 1500000,
    description: "잔기스 없는 S급 상태에요",
    status: ProductStatus.normal,
    images: [picSum(id: 300), picSum(id: 302), picSum(id: 303)]);

final product3 = Product(
    user: user1,
    name: "스마트 티비",
    price: 500000,
    description: "화질이 아주 좋아요",
    status: ProductStatus.normal,
    images: [
      picSum(id: 501),
      picSum(id: 501),
      picSum(id: 502),
      picSum(id: 305)
    ]);

final post1 = ProductPost(
  user: product1.user,
  product: product1,
  content: "글의 내용입니다. 서울시 어쩌구 저쩌구",
  address: const Address(
    fullAddress: "서울시 어딘가 특별한 장소",
    simpleAddress: "플러터동"
  ),
  chatCount: 3,
  likeCount: 2,
  createdTime: DateTime.now().subtract(30.minutes),
);
final post2 = ProductPost(
  user: product2.user,
  product: product2,
  content: "글의 내용입니다. 서울시 어쩌구 저쩌구",
  address: const Address(
      fullAddress: "서울시 어딘가 특별한 장소",
      simpleAddress: "다트시"
  ),
  chatCount: 30,
  likeCount: 120,
  createdTime: DateTime.now().subtract(5.minutes),
);
final post3 = ProductPost(
  user: product3.user,
  product: product3,
  content: "글의 내용입니다. 서울시 어쩌구 저쩌구",
  address: const Address(
      fullAddress: "서울시 어딘가 특별한 장소",
      simpleAddress: "앱동"
  ),
  chatCount: 33,
  likeCount: 22,
  createdTime: DateTime.now().subtract(10.seconds),
);

final postList = [post1, post2, post3, post1, post2, post3];
