// import 'package:flutter/material.dart';
// import 'package:project/component/button/xicon_button.dart';
// import 'package:project/component/xlist_veritical.dart';
// import 'package:project/core/view/padding.dart';
// import 'package:project/data/model.dart';
// import 'package:project/feature/search_screen/component/search_textfield.dart';
// import 'package:project/feature/search_screen/search_screen_provider.dart';
// import 'package:project/theme/text_style/text_style.dart';

// class SubmitSearchScreen extends StatelessWidget {
//   final List<SearchModel> searchItemUi;
//   final TextEditingController textEditingController;
//   final SearchScreenProvider provider;
//   const SubmitSearchScreen(
//       {super.key,
//       required this.searchItemUi,
//       required this.textEditingController,
//       required this.provider});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const SizedBox(
//             height: XPadding.extraLarge,
//           ),
//           Row(
//             children: [
//               XIconButton(
//                 iconData: Icons.arrow_back,
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: XPadding.extraLarge),
//                   child: SearchTextField(
//                     textEditingController: textEditingController,
//                     color: Theme.of(context).cardColor,
//                     suffixIcon: const XIconButton(iconData: Icons.mic),
//                     onSubMit: (value) {
//                       provider.search(query: value);
//                     },
//                     onChange: (value){

//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: XPadding.extraLarge, vertical: XPadding.medium),
//               child: XListVeritical(
//                 items: searchItemUi,
//                 margin: const EdgeInsets.only(bottom: XPadding.large),
//                 content: (context, it, index) {
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             XTextMedium(
//                               text: it.title,
//                               overflow: null,
//                               maxLine: 2,
//                             ),
//                             const SizedBox(
//                               height: XPadding.medium,
//                             ),
//                             XTextMedium(
//                               text: it.subtitle,
//                               overflow: null,
//                               fontWeight: FontWeight.w400,
//                               maxLine: 2,
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 80,
//                         width: 120,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(it.thumnail),
//                           ),
//                         ),
//                       )
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
