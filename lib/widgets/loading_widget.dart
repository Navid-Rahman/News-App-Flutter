import 'package:flutter/material.dart';
import 'package:newsapp_flutter/widgets/article_shimmer_effect_widget.dart';

import 'package:newsapp_flutter/services/utils.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  BorderRadius borderRadius = BorderRadius.circular(18);
  late Color baseShimmerColor, highlightShimmerColor, widgetShimmerColor;

  @override
  void didChangeDependencies() {
    var utils = Utils(context);
    baseShimmerColor = utils.baseShimmerColor;
    highlightShimmerColor = utils.highlightShimmerColor;
    widgetShimmerColor = utils.widgetShimmerColor;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return ArticleShimmerEffectWidget(
              baseShimmerColor: baseShimmerColor,
              highlightShimmerColor: highlightShimmerColor,
              widgetShimmerColor: widgetShimmerColor,
              size: size,
              borderRadius: borderRadius);
        },
      ),
    );
  }
}
