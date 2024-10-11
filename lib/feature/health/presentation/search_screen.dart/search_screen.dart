import 'package:flutter/material.dart';
import 'package:project/component/button/xicon_button.dart';
import 'package:project/component/ximage_provider.dart';
import 'package:project/component/xlist_veritical.dart';
import 'package:project/core/base/base_builder.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/feature/health/presentation/submit_screen/onsubmit_screen.dart';
import 'package:project/feature/health/presentation/search_screen.dart/search_screen_provider.dart';
import 'package:project/feature/health/presentation/search_screen.dart/component/search_textfield.dart';
import 'package:project/feature/health/presentation/search_screen.dart/component/tab_bar_search_screen.dart';
import 'package:project/theme/text_style/text_style.dart';
import 'package:project/utils/constant/image_constant.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SearchScreenProvider>(context, listen: false).search(
      query: null,
    );
    Provider.of<SearchScreenProvider>(context, listen: false).getCateogryItem();
    Provider.of<SearchScreenProvider>(context, listen: false).listenPaging();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
      ),
      body: BaseBuilder<SearchScreenProvider>(
        builder: (provider, child) => provider.uiState.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _buildBody(provider: provider),
      ),
    );
  }

  Widget _buildBody({
    required SearchScreenProvider provider,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: XPadding.extraLarge),
      child: Column(
        children: [
          SearchTextField(
            textEditingController: provider.textEditingController,
            color: Theme.of(context).cardColor,
            suffixIcon: const XIconButton(iconData: Icons.mic),
            onSubMit: (value) {
              provider.search(query: value);
              if (value.isNotEmpty) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SubmitSearchScreen(
                      qurey: value,
                    ),
                  ),
                );
              }
            },
          ),
          Expanded(
            child: XSearchTabBar(
              categoryItem: provider.uiState.categoryItem,
              currentIndex: provider.uiState.currentIndex,
              color: Theme.of(context).colorScheme.primaryContainer,
              onChangeIndex: (index) {
                provider.changeTap(index);
              },
              isLoading: provider.uiState.filterLoading,
              listener: (index) {
                provider
                    .filterCategory(provider.uiState.categoryItem[index].name);
              },
              content: Padding(
                padding: const EdgeInsets.only(top: XPadding.large),
                child: _buildList(provider: provider),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildList({required SearchScreenProvider provider}) {
    if (provider.uiState.searchItemUi.isEmpty) {
      return _buildEmptySearch();
    }
    return XListVeritical(
      scrollController: provider.scrollController,
      items: provider.uiState.searchItemUi,
      margin: const EdgeInsets.only(bottom: XPadding.large),
      content: (context, it, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XTextMedium(
                    text: it.title,
                    overflow: null,
                    maxLine: 2,
                  ),
                  const SizedBox(
                    height: XPadding.large,
                  ),
                  XTextMedium(
                    text: it.subtitle,
                    overflow: null,
                    fontWeight: FontWeight.w400,
                    maxLine: 2,
                  )
                ],
              ),
            ),
            Container(
              height: 80,
              width: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(it.thumnail),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildEmptySearch() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: XImageProvider(
        height: height / 2,
        width: width / 2,
        path: ImageConstant.no_search_found,
        fit: BoxFit.contain,
      ),
    );
  }
}
