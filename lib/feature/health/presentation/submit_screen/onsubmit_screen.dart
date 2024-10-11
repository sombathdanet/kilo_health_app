import 'package:flutter/material.dart';
import 'package:project/component/button/xicon_button.dart';
import 'package:project/component/ximage_provider.dart';
import 'package:project/component/xlist_veritical.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/feature/health/presentation/submit_screen/submit_screen_provider.dart';
import 'package:project/feature/health/presentation/search_screen.dart/component/search_textfield.dart';
import 'package:project/theme/text_style/text_style.dart';
import 'package:project/utils/constant/image_constant.dart';
import 'package:provider/provider.dart';

class SubmitSearchScreen extends StatefulWidget {
  final String? qurey;
  const SubmitSearchScreen({super.key, this.qurey});

  @override
  State<SubmitSearchScreen> createState() => _SubmitSearchScreenState();
}

class _SubmitSearchScreenState extends State<SubmitSearchScreen> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<SubmitScreenProvider>(context, listen: false)
        .search(query: widget.qurey);
    setNewString();
  }

  void setNewString() {
    if (widget.qurey != null) {
      textEditingController.text = widget.qurey ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SubmitScreenProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: XPadding.extraLarge,
            ),
            Row(
              children: [
                XIconButton(
                  iconData: Icons.arrow_back,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: XPadding.extraLarge),
                    child: SearchTextField(
                      textEditingController: textEditingController,
                      color: Theme.of(context).cardColor,
                      suffixIcon: const XIconButton(iconData: Icons.mic),
                      onSubMit: (value) {
                        provider.search(query: value);
                      },
                      onChange: (value) {},
                    ),
                  ),
                )
              ],
            ),
            _buildList(provider: provider)
          ],
        ),
      ),
    );
  }

  Widget _buildList({required SubmitScreenProvider provider}) {
    if (provider.uiState.searchLoading) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (provider.uiState.searchItemUi.isEmpty) {
      return _buildEmptySearch();
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: XPadding.extraLarge, vertical: XPadding.medium),
        child: XListVeritical(
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
                        height: XPadding.medium,
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
        ),
      ),
    );
  }

  Widget _buildEmptySearch() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Center(
        child: XImageProvider(
          height: height / 2,
          width: width / 2,
          path: ImageConstant.no_search_found,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
