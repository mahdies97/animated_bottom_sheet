import 'package:flutter/material.dart';

class CustomBottomSheet {
  static open({
    required BuildContext context,
    required Widget Function(StateSetter) bottomSheetContentBuilder,
    double? height,
    Alignment? alignment,
    Color? backgroundColor,
    bool showDragHandle = false,
    Curve curve = Curves.elasticOut,
    bool useRootNavigator = true,
    bool isDismissable = true,
    bool useSafeArea = true,
    String? barrierLabel,
    Color? barrierColor,
    RouteSettings? routeSettings,
    BorderRadiusGeometry borderRadius = const BorderRadius.vertical(top: Radius.circular(15)),
    Duration duration = const Duration(milliseconds: 700),
  }) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).viewInsets.bottom,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: height != null
                    ? MediaQuery.of(context).size.height * height
                    : null,
                child: AnimatedSize(
                  duration: duration,
                  curve: curve,
                  child: bottomSheetContentBuilder(setModalState),
                ),
              ),
            );
          },
        );
      },
      backgroundColor: backgroundColor ?? Colors.white,
      clipBehavior: Clip.antiAlias,
      sheetAnimationStyle: AnimationStyle(
        curve: Curves.decelerate,
        reverseCurve: Curves.decelerate,
      ),
      showDragHandle: showDragHandle,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      isDismissible: isDismissable,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      isScrollControlled: true,
      useSafeArea: useSafeArea,
      // Optional for full-height sheets
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
    );
  }
}
