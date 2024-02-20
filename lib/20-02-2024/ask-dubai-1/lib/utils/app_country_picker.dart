// import 'package:country_pickers/country.dart';
// import 'package:country_pickers/country_pickers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_template/utils/app_colors.dart';
// import 'package:flutter_template/utils/size_utils.dart';
//
// class CountryPickerWidget extends StatefulWidget {
//   final ValueNotifier<Country?> selectedDialogCountry;
//   const CountryPickerWidget({Key? key, required this.selectedDialogCountry}) : super(key: key);
//
//   @override
//   _CountryPickerWidgetState createState() => _CountryPickerWidgetState();
// }
//
// class _CountryPickerWidgetState extends State<CountryPickerWidget> {
//   @override
//   void initState() {
//     super.initState();
//     widget.selectedDialogCountry.value ??= CountryPickerUtils.getCountryByPhoneCode('91');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return getTextFieldPrefix();
//   }
//
//   Widget getTextFieldPrefix() {
//     return InkWell(
//       onTap: () async {
//         _openCountryPickerDialog();
//       },
//       child: ValueListenableBuilder(
//           valueListenable: widget.selectedDialogCountry,
//           builder: (context, Country? country, _) {
//             return Wrap(
//               crossAxisAlignment: WrapCrossAlignment.center,
//               runAlignment: WrapAlignment.center,
//               children: [
//                 // CountryPickerUtils.getDefaultFlagImage(_selectedDialogCountry),
//                 SizedBox(
//                   width: SizeUtils.horizontalBlockSize * 2.5,
//                 ),
//                 Text(
//                   "+${country?.phoneCode}",
//                   style: TextStyle(
//                     color: AppColors.textColor,
//                     fontStyle: FontStyle.normal,
//                     fontWeight: FontWeight.w400,
//                     fontSize: SizeUtils.fSize_12(),
//                   ),
//                 ),
//                 SizedBox(
//                   width: SizeUtils.horizontalBlockSize,
//                 ),
//                 Icon(
//                   Icons.arrow_drop_down,
//                   color: AppColors.textColor,
//                   size: SizeUtils.horizontalBlockSize * 5,
//                 ),
//                 SizedBox(
//                   width: SizeUtils.horizontalBlockSize,
//                 ),
//                 SizedBox(
//                   height: SizeUtils.verticalBlockSize * 4,
//                   child: VerticalDivider(
//                     color: Colors.grey.withOpacity(0.2),
//                     thickness: 2,
//                     width: 2, //thickness of divier line
//                   ),
//                 ),
//                 SizedBox(
//                   width: SizeUtils.horizontalBlockSize,
//                 ),
//               ],
//             );
//           }),
//     );
//   }
//
//   void _openCountryPickerDialog() => showDialog<void>(
//         context: context,
//         builder: (context) => CountryPickerDialog(
//           titlePadding: const EdgeInsets.all(6.0),
//           searchCursorColor: AppColors.appThemeColor,
//           searchInputDecoration: InputDecoration(
//               fillColor: AppColors.backgroundColor,
//               filled: true,
//               disabledBorder: const OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(8)),
//                 borderSide: BorderSide(color: Colors.white),
//               ),
//               enabledBorder: const OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(8)),
//                 borderSide: BorderSide(color: Colors.white),
//               ),
//               focusedBorder: const OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(8)),
//                 borderSide: BorderSide(color: Colors.white),
//               ),
//               hintText: "Search Country",
//               contentPadding: const EdgeInsets.symmetric(horizontal: 12)),
//           isSearchable: true,
//           title: Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: Text("Select your Country",
//                 style: TextStyle(
//                   color: AppColors.appThemeColor,
//                   fontStyle: FontStyle.normal,
//                   fontWeight: FontWeight.w500,
//                   fontSize: SizeUtils.fSize_14(),
//                 )),
//           ),
//           onValuePicked: (Country country) {
//             widget.selectedDialogCountry.value = country;
//           },
//           itemBuilder: _buildDialogItem,
//         ),
//       );
//
//   Widget _buildDialogItem(Country country) => Row(
//         children: <Widget>[
//           CountryPickerUtils.getDefaultFlagImage(country),
//           const SizedBox(width: 8.0),
//           Text(
//             "+${country.phoneCode}",
//             style: TextStyle(
//               color: AppColors.textColor,
//               fontStyle: FontStyle.normal,
//               fontWeight: FontWeight.w500,
//               fontSize: SizeUtils.fSize_12(),
//             ),
//           ),
//           const SizedBox(width: 10.0),
//           Flexible(
//             child: Text(
//               country.name,
//               style: TextStyle(
//                 color: AppColors.textColor,
//                 fontStyle: FontStyle.normal,
//                 fontWeight: FontWeight.w500,
//                 fontSize: SizeUtils.fSize_12(),
//               ),
//             ),
//           ),
//         ],
//       );
// }
