import 'package:flutter/material.dart';
import 'package:project/component/appbar/xapp_bar.dart';
import 'package:project/component/xlist_veritical.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/data/fake_data.dart';
import 'package:project/feature/notification/component/notification_trending.dart';
import 'package:project/theme/text_style/text_style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildBody(
        context: context,
      ),
    );
  }

  XNavAppBar _appBar(context) {
    return XNavAppBar(
      padding: const EdgeInsets.symmetric(horizontal: XPadding.extraLarge),
      backgroundColor: Theme.of(context).primaryColor,
      isNavBack: false,
      titleColor: Colors.white,
      title: "Notification",
      actions: const [
        XTextLarge(
          text: "Clear all",
          color: Colors.white,
        )
      ],
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return XListVeritical(
      items: FakeData.notificationItesm,
      margin: EdgeInsets.zero,
      content: (context, it, index) => NotificationTrending(
        items: it,
      ),
    );
  }
}
