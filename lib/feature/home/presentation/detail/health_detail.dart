import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:project/component/appbar/xapp_bar.dart';
import 'package:project/component/xslider.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/feature/home/presentation/detail/health_detail_provider.dart';
import 'package:project/theme/text_style/text_style.dart';
import 'package:project/theme/text_style/xfont_size.dart';
import 'package:provider/provider.dart';

class HeathDetail extends StatefulWidget {
  final String? id;
  const HeathDetail({super.key, this.id});

  @override
  State<HeathDetail> createState() => _HeathDetailState();
}

class _HeathDetailState extends State<HeathDetail> {
  @override
  void initState() {
    super.initState();
    Provider.of<HealthDetailProvider>(context, listen: false)
        .getGridDetail(widget.id ?? "0");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XNavAppBar(
        backgroundColor: Theme.of(context).primaryColor,
        titleColor: Colors.white,
        title: "Health Detail Screen",
        onPressed: () => Navigator.of(context).pop(),
        isNavBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: XPadding.extraLarge),
        child: _buildLoad(context),
      ),
    );
  }

  Widget _buildLoad(context) {
    final provider = Provider.of<HealthDetailProvider>(context);
    if (provider.uiState.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    final provider = Provider.of<HealthDetailProvider>(context);
    final pagecontroller = PageController();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: XPadding.large,
          ),
          XSlider(
            pageController: pagecontroller,
            sliderItems: [provider.uiState.homeGridDetialModel.thumbnail],
          ),
          const SizedBox(
            height: XPadding.medium,
          ),
          XTextLarge(
            text: provider.uiState.homeGridDetialModel.name,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(
            height: XPadding.medium,
          ),
          XTextSmall(
            text: provider.uiState.homeGridDetialModel.description,
            color: Theme.of(context).colorScheme.secondary,
            overflow: null,
          ),
          Html(
            data: provider.uiState.homeGridDetialModel.content,
            style: {
              "head": Style(
                fontSize: FontSize(XFontSize.large),
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.justify,
                color: Theme.of(context).colorScheme.secondary,
              ),
              "body": Style(
                fontSize: FontSize(XFontSize.medium),
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.justify,
                color: Theme.of(context).colorScheme.secondary,
              )
            },
          ),
        ],
      ),
    );
  }
}
