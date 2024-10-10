import 'package:flutter/material.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/feature/profile/component/option_profile.dart';
import 'package:project/feature/profile/component/profile_section.dart';
import 'package:project/utils/constant/image_constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProfile(),
        const SizedBox(
          height: XPadding.large,
        ),
        _buildMainSection(),
        const SizedBox(
          height: XPadding.large,
        ),
        _buildListOption(),
      ],
    ));
  }

  Widget _buildProfile() {
    return const CircleAvatar(
      radius: 50.0,
      backgroundImage: NetworkImage(
        "https://i.pinimg.com/564x/50/6c/53/506c5346548c2ced6d320b85a851ba4e.jpg",
      ),
    );
  }

  Widget _buildMainSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: XPadding.medium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileSection(
            iconPath: ImageConstant.ic_heart_rate,
            title: "Heart rate",
            subtitle: "215bpm",
          ),
          SizedBox(
            width: XPadding.extraLarge,
          ),
          SizedBox(
            height: 50,
            child: VerticalDivider(
              thickness: 1,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(
            width: XPadding.extraLarge,
          ),
          ProfileSection(
            iconPath: ImageConstant.ic_calories,
            title: "Calories",
            subtitle: "716 cal",
          ),
          SizedBox(
            width: XPadding.extraLarge,
          ),
          SizedBox(
            height: 50,
            child: VerticalDivider(
              thickness: 1,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(
            width: XPadding.extraLarge,
          ),
          ProfileSection(
            iconPath: ImageConstant.ic_weight,
            title: "Weight",
            subtitle: "215lbs",
          )
        ],
      ),
    );
  }

  Widget _buildListOption() {
    return const Column(
      children: [
        OptionProfile(
          iconPath: ImageConstant.ic_heart,
          title: "My Saves",
        ),
        OptionProfile(
          iconPath: ImageConstant.ic_document,
          title: "My Saves",
        ),
        OptionProfile(
          iconPath: ImageConstant.ic_wallet,
          title: "My Saves",
        ),
        OptionProfile(
          iconPath: ImageConstant.ic_chat,
          title: "My Saves",
        ),
        OptionProfile(
          iconPath: ImageConstant.ic_logout,
          title: "My Saves",
        )
      ],
    );
  }
}
