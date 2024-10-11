import 'package:flutter/material.dart';
import 'package:project/component/xgrid_view.dart';
import 'package:project/component/xslider.dart';
import 'package:project/core/base/base_builder.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/route.dart';
import 'package:project/feature/health/presentation/home/home_provide.dart';
import 'package:project/feature/health/presentation/home/home_state.dart';
import 'package:project/theme/text_style/text_style.dart';
import 'package:project/theme/theme_provider.dart';
import 'package:project/utils/constant/image_constant.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../../../../component/xtapbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getHomeSlider();
    Provider.of<HomeProvider>(context, listen: false).getHomeGridData();
    _scrollController.addListener(() {
      context.read<HomeProvider>().setOffSet(_scrollController.offset);
    });
    Provider.of<HomeProvider>(context, listen: false)
        .listenPaging(_scrollController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: XPadding.extraLarge),
      child: BaseBuilder<HomeProvider>(
        builder: (provider, child) => Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0.0,
              titleSpacing: 0,
              title: Row(
                children: [
                  Image.asset(
                    ImageConstant.logo_app,
                    height: 30,
                    width: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  XTextExtraLarge(
                    padding: const EdgeInsets.only(left: XPadding.medium),
                    text: "Kilo Health",
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              actions: [
                GestureDetector(
                  onTap: () =>
                      Provider.of<ThemeProvider>(context, listen: false)
                          .chnageTheme(),
                  child: Icon(
                    Icons.dark_mode,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: XPadding.medium,
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(AppRoutes.searchScreen),
                  child: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                )
              ],
            ),
            body: _buildPinHeader(
              homeProvider: provider,
              context: context,
              state: provider.uiState,
            )),
      ),
    );
  }

  // Widget _buildBody({
  //   required HomeProvider homeProvider,
  //   required BuildContext context,
  //   required HomeState state,
  // }) {
  //   return SingleChildScrollView(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const SizedBox(
  //           height: XPadding.large,
  //         ),
  //         _buildSlider(
  //           homeProvider: homeProvider,
  //           context: context,
  //           state: state,
  //         ),
  //         const SizedBox(
  //           height: XPadding.medium,
  //         ),
  //         XTextLarge(
  //           text: "All Category",
  //           color: Theme.of(context).colorScheme.secondary,
  //         ),
  //         const SizedBox(
  //           height: XPadding.medium,
  //         ),
  //         XTabBar(
  //           tabItems: tabItems,
  //           currentIndex: state.currentIndex,
  //           onChangeIndex: (index) {
  //             homeProvider.changeTap(index);
  //           },
  //         ),
  //         const SizedBox(
  //           height: XPadding.medium,
  //         ),
  //         _buildGridView(
  //           context: context,
  //           homeProvider: homeProvider,
  //           state: state,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildSlider({
    required HomeProvider homeProvider,
    required BuildContext context,
    required HomeState state,
  }) {
    final pagecontroller = PageController();
    return XSlider(
      pageController: pagecontroller,
      currentIndex: state.currentPageIndex,
      sliderItems: state.sliderItem.slides,
      onPageChanged: (index) {
        homeProvider.changePage(index);
      },
    );
  }

  Widget _buildGridView({
    required HomeProvider homeProvider,
    required BuildContext context,
    required HomeState state,
  }) {
    return XGridView(
      listItem: state.homeGridItem,
      cardColor: Theme.of(context).cardColor,
      onTapItem: (index) {
        homeProvider.navigatorToDetail(
            context, state.homeGridItem[index].id.toString());
      },
    );
  }

  Widget _buildPinHeader({
    required HomeProvider homeProvider,
    required BuildContext context,
    required HomeState state,
  }) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverFixedExtentList(
          delegate: SliverChildListDelegate([
            //Restaurant
            _buildSlider(
              homeProvider: homeProvider,
              context: context,
              state: state,
            ),
          ]),
          itemExtent: 160.0,
        ),
        SliverToBoxAdapter(
          child: XTextLarge(
            padding: const EdgeInsets.symmetric(vertical: XPadding.medium),
            text: "All Category",
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        MultiSliver(
            pushPinnedChildren: true, //if u have multiple sticky headers
            children: [
              //categories sticky header from sliver_tools package
              SliverPinnedHeader(
                child: Container(
                  margin:
                      const EdgeInsetsDirectional.only(bottom: XPadding.medium),
                  padding: state.offset >= 200
                      ? const EdgeInsets.symmetric(vertical: XPadding.medium)
                      : EdgeInsets.zero,
                  color: state.offset >= 200
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Colors.transparent,
                  child: XTabBar(
                    tabItems: tabItems,
                    currentIndex: state.currentIndex,
                    onChangeIndex: (index) {
                      homeProvider.changeTap(index);
                    },
                  ),
                ),
              ),
              _buildGridView(
                context: context,
                homeProvider: homeProvider,
                state: state,
              ),
            ])
      ],
    );
  }
}
