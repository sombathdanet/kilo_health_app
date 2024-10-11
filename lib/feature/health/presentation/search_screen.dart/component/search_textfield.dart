import 'package:flutter/material.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/theme/text_style/xfont_size.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? textEditingController;
  final Widget? suffixIcon;
  final Function(String)? onChange;
  final Function(String)? onSubMit;
  final Color? color;
  const SearchTextField(
      {super.key,
      this.hintText = "Search",
      this.textEditingController,
      this.suffixIcon,
      this.onChange,
      this.onSubMit,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 0),
            spreadRadius: 1.0,
            blurRadius: 5.0,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: onChange,
        controller: textEditingController,
        showCursor: true,
        cursorColor: Colors.grey,
        onSubmitted: onSubMit,
        style: TextStyle(
          fontSize: XFontSize.medium,
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: XFontSize.medium,
          ),
          isDense: true,
          fillColor: color ?? Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: XPadding.medium,
            vertical: XPadding.large,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
