// import 'package:batru_house_rental/presentation/resources/resources.dart';
// import 'package:batru_house_rental/presentation/widgets/input_text_field/input_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class FormSend extends StatefulWidget {
//   const FormSend({
//     Key? key,
//     required this.onTabSend,
//     required this.onTabImage,
//     required this.onChanged,
//     this.controller,
//   }) : super(key: key);

//   final VoidCallback onTabSend;
//   final VoidCallback onTabImage;
//   final ValueChanged<String?> onChanged;
//   final TextEditingController? controller;
//   @override
//   State<FormSend> createState() => _FormSendState();
// }

// class _FormSendState extends State<FormSend> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       color: context.colors.backgroundSecondary,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//         child: Row(
//           children: [
//             _buildIconPlus(),
//             const SizedBox(width: 21),
//             _buildDividerVertical(),
//             const SizedBox(width: 13),
//             Expanded(
//               child: InputTextField(
//                 controller: widget.controller,
//                 initialText: 'Type a message',
//                 maxLine: 10,
//                 onTextChange: widget.onChanged,
//               ),
//             ),
//             const SizedBox(width: 13),
//             _buildIconSend(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDividerVertical() {
//     return Container(
//       width: 1,
//       color: context.colors.border,
//     );
//   }

//   Widget _buildIconPlus() {
//     return GestureDetector(
//       onTap: widget.onTabImage,
//       child: Container(
//         height: 38,
//         width: 38,
//         color: context.colors.iconPrimary,
//         padding: const EdgeInsets.all(10),
//         child: SvgPicture.asset(
//           Assets.plus,
//           color: AppColors.iconPrimary,
//           width: 18,
//           height: 18,
//         ),
//       ),
//     );
//   }

//   Widget _buildIconSend() {
//     return GestureDetector(
//       onTap: widget.onTabSend,
//       child: Container(
//         height: 38,
//         width: 38,
//         color: AppColors.itemColor,
//         padding: const EdgeInsets.all(10),
//         child: SvgPicture.asset(
//           Assets.arrowUp,
//           color: AppColors.iconPrimary,
//           width: 18,
//           height: 18,
//         ),
//       ),
//     );
//   }
// }
