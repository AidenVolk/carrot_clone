import 'package:carrot_clone/common/common.dart';
import 'package:carrot_clone/common/dart/extension/num_duration_extension.dart';
import 'package:carrot_clone/common/widget/animated_height_collapse.dart';
import 'package:carrot_clone/screen/main/fab/w_floating_daangn_button_riverpod.dart';
import 'package:carrot_clone/screen/main/s_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class FloatingDaangnButton extends ConsumerWidget {
  static const double height = 100;

  FloatingDaangnButton({super.key});

  final duration = 300.ms;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final floatingButtonState = ref.watch(floatingButtonStateProvider);
    final isExpanded = floatingButtonState.isExpanded;
    final isSmall = floatingButtonState.isSmall;

    return Stack(
      children: [
        IgnorePointer(
          ignoring: !isExpanded,
          child: AnimatedContainer(
            duration: duration,
            color: isExpanded
                ? Colors.black.withOpacity(0.4)
                : Colors.transparent,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedOpacity(
                opacity: isExpanded
                    ? 1
                    : 0 ,
                duration: duration,
                child: Container(
                  width: 160,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(right: 16, bottom: 10),
                  decoration: BoxDecoration(
                    color: context.appColors.floatingActionLayer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFloatItem(title: "알바", imagePath: "$basePath/fab/fab_01.png"),
                      _buildFloatItem(title: "과외/클래스", imagePath: "$basePath/fab/fab_02.png"),
                      _buildFloatItem(title: "농수산물", imagePath: "$basePath/fab/fab_03.png"),
                      _buildFloatItem(title: "부동산", imagePath: "$basePath/fab/fab_04.png"),
                      _buildFloatItem(title: "중고차", imagePath: "$basePath/fab/fab_05.png"),
                    ],
                  ),
                ),
              ),
              Tap(
                onTap: () { 
                  ref.read(floatingButtonStateProvider.notifier).toggleMenu();
                },
                child: AnimatedContainer(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  duration: duration,
                  decoration: BoxDecoration(
                    color: isExpanded
                        ? context.appColors.floatingActionLayer
                        : const Color(0xffff791f),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedRotation(
                        turns:  isExpanded
                            ? 0.125
                            : 0,
                        duration: duration,
                        child: const Icon(Icons.add, color: Colors.white ,),
                      ),
                      AnimatedWidthCollapse(
                        visible: !isSmall,
                        duration: duration,
                        child: '글쓰기'.text.color(Colors.white).make(),
                      )
                    ],
                  ),
                ),
              ).pOnly(
                bottom: 60 + context.viewPaddingBottom + 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Row _buildFloatItem({required String title, required String imagePath}){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          width: 30,
        ),
        const Width(8),
        title.text.color(Colors.white).make(),
      ],
    );
  }
}
