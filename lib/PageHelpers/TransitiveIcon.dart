import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:liquid_swipe/Provider/LiquidProvider.dart';

class TransitiveIcon extends StatelessWidget {
  final Widget? fromChild;
  final Widget? toChild;

  TransitiveIcon({
    Key? key,
    this.fromChild = const Icon(Icons.arrow_back_ios),
    this.toChild = const Icon(Icons.add),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading = context.select((LiquidProvider lq) => lq.addingPage);
    if (loading) {
      return Container(
        width: 26,
        height: 26,
        padding: EdgeInsets.all(4.0),
        child: CircularProgressIndicator(strokeWidth: 2.0),
      );
    }

    final secondIconVisible = context.select((LiquidProvider lq) => lq.markForAddSize);
    return Visibility(
      child: fromChild!,
      visible: !secondIconVisible,
      replacement: toChild!,
    );
  }
}
