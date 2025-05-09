import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:sliver_app_bar_builder/sliver_app_bar_builder.dart';
import 'package:vilcom_digital_restaurant/config/screen_sizes_extension.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_card.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_huge_icon.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_tabbed_bar.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_text.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/food_exprole_item.dart';
import 'package:vilcom_digital_restaurant/models/product_model/product_model.dart';
import 'package:vilcom_digital_restaurant/utils/constants/assets.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    Color iconBackground = context.primary.withAlpha(80);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarBuilder(
            barHeight: 50,
            backgroundColorAll: Colors.lime,
            initialBarHeight: 50,
            pinned: true,
            initialContentHeight: 150,
            leadingActionsPadding: const EdgeInsets.symmetric(horizontal: 8),
            collapseTrailingActions: true,
            // collapseLeadingActions: true,
            backgroundColorBar: Colors.transparent,
            // trailingActionsPadding: const EdgeInsets.symmetric(horizontal: 2),
            floating: true,
            stretch: true,
            contentBelowBar: false,

            // debug: true,
            contentBuilder: (
              context,
              expandRatio,
              contentHeight,
              centerPadding,
              overlapsContent,
            ) {
              // final paddingSpace = centerPadding.copyWith(left: 4);

              // Log.i(
              //   'expandRatio: $expandRatio, contentHeight: $contentHeight, overlapsContent: $overlapsContent, centerPadding: $centerPadding',
              // );

              return Stack(
                children: [
                  Container(
                    // alignment: Alignment.bottomLeft,
                    height: contentHeight,
                    // padding: paddingSpace,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(burger),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              );
            },
            leadingActions: [
              (context, expandRatio, barHeight, overlapsContent) => SizedBox(
                height: barHeight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: AnimatedContainer(
                    // padding: const EdgeInsets.symmetric(horizontal: 8),
                    duration: const Duration(milliseconds: 200),
                    width:
                        expandRatio != 1
                            ? context.screenWidth - 140
                            : context.screenWidth - 30,
                    // width: 50,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 5,
                      children: [
                        CustomCard(
                          color: iconBackground,
                          padding: 6,
                          child: CHugeIcon(
                            icon: HugeIcons.strokeRoundedCircleArrowLeft01,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: SearchBar(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.white.withAlpha(200),
                            ),
                            leading: CHugeIcon(
                              icon: HugeIcons.strokeRoundedSearch01,
                            ),
                            hintText: 'Seach your taste',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            trailingActions: [
              (context, expandRatio, barHeight, overlapsContent) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CustomCard(
                  color: iconBackground,
                  padding: 6,
                  child: CHugeIcon(
                    icon: HugeIcons.strokeRoundedShare05,
                    color: Colors.white,
                  ),
                ),
              ),

              (context, expandRatio, barHeight, overlapsContent) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CustomCard(
                  color: iconBackground,
                  padding: 6,
                  child: CHugeIcon(
                    icon: HugeIcons.strokeRoundedFavourite,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SliverAppBarBuilder(
            barHeight: 50,
            backgroundColorAll: Colors.white30,
            initialBarHeight: 50,
            pinned: true,
            initialContentHeight: 100,
            leadingActionsPadding: const EdgeInsets.symmetric(horizontal: 8),
            collapseTrailingActions: true,
            // collapseLeadingActions: true,
            backgroundColorBar: Colors.transparent,
            // trailingActionsPadding: const EdgeInsets.symmetric(horizontal: 2),
            floating: true,
            stretch: true,
            contentBelowBar: false,
            leadingActions: [],

            // debug: true,
            contentBuilder: (
              context,
              expandRatio,
              contentHeight,
              centerPadding,
              overlapsContent,
            ) {
              // final paddingSpace = centerPadding.copyWith(left: 4);

              // Log.i(
              //   'expandRatio: $expandRatio, contentHeight: $contentHeight, overlapsContent: $overlapsContent, centerPadding: $centerPadding',
              // );

              return SizedBox(
                height: contentHeight,

                child: Stack(
                  children: [
                    Positioned(
                      top: contentHeight * 0.05,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CText(
                              text: 'HumBurger',
                              size: 25,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              width: context.screenWidth * 0.95,
                              child: Row(
                                spacing: 3,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CText(
                                    text: '4.8',
                                    size: 17,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  CHugeIcon(icon: HugeIcons.strokeRoundedStar),
                                  CText(
                                    text: '(355+)',
                                    size: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Spacer(),
                                  // Expanded(child: SizedBox.shrink()),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text("See All"),
                                  ),
                                ],
                              ),
                            ),
                            CustomTabbar(
                              tabs: [
                                TabData(label: 'All Item'),
                                TabData(label: 'Popular'),
                                TabData(label: 'Offers'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(alignment: Alignment.bottomCenter),
                  ],
                ),
              );
            },
          ),

          SliverToBoxAdapter(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 6 / 7,
              ),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, indes) {
                return ExploreFooItem(product: ProductModel());
                // return Container(height: 900, color: context.primary);
              },
            ),
          ),
        ],
      ),
    );
  }
}
