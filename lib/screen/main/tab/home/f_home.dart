import 'package:carrot_clone/common/common.dart';
import 'package:carrot_clone/common/widget/w_line.dart';
import 'package:carrot_clone/entity/dummies.dart';
import 'package:carrot_clone/screen/main/fab/w_floating_daangn_button.dart';
import 'package:carrot_clone/screen/main/fab/w_floating_daangn_button_riverpod.dart';
import 'package:carrot_clone/screen/main/tab/home/w_product_post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeFragment extends ConsumerStatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<HomeFragment> {

  final scrollController = ScrollController();

  String title = "플러터동";

  @override
  void initState() {
    scrollController.addListener(() {
      final floatingState = ref.read(floatingButtonStateProvider);

      if (scrollController.position.pixels > 100 && !floatingState.isSmall) {
        ref.read(floatingButtonStateProvider.notifier).changeButtonSize(true);
      } else if (scrollController.position.pixels < 100 && floatingState.isSmall) {
        ref.read(floatingButtonStateProvider.notifier).changeButtonSize(false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: PopupMenuButton<String>(
            onSelected: (value){
              setState(() {
                title = value;
              });
            },
            itemBuilder: (BuildContext context) => ["다트동", "앱동"].map((e) => PopupMenuItem(
              value: e,
              child: e.text.make(),
            ),
          ).toList(),
            child: Text(title),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: FloatingDaangnButton.height),
            controller: scrollController,
            itemCount: postList.length,
            itemBuilder: (BuildContext context, int index) => ProductPostItem(postList[index]),
            separatorBuilder: (BuildContext context, int index) => const Line().pSymmetric(h: 15),
          ),
        ),
      ],
    );
  }
}
