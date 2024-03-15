// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:formz/formz.dart';
// import 'package:get/get.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   LogInController logInController = Get.put(LogInController());
//   TextEditingController phoneNumber = TextEditingController();
//   SidebarController sidebarController = Get.find();
//   String errorText = '';
//   InitController initController = Get.put(InitController());
//
//   @override
//   void initState() {
//     sidebarController.currentRoute.value = Routes.login;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final deviceType = getDeviceType(MediaQuery.of(context).size);
//     final isMobile = deviceType == DeviceScreenType.mobile;
//     return MaterialApp(
//       home: Material(
//         color: AppTheme.white,
//         child: Scaffold(
//           resizeToAvoidBottomInset: true,
//           body: Center(
//             child: SingleChildScrollView(
//               child: Container(
//                 width: Insets.xll * 12,
//                 padding: EdgeInsets.all(Insets.lg),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       const SizedBox(),
//                       Column(
//                         children: [
//                           SizedBox(
//                             height: Insets.offset10,
//                           ),
//                           Image.asset(
//                             "images/sorted.png",
//                             width: Insets.offset,
//                             height: Insets.offset,
//                           ),
//                           SizedBox(height: Insets.sm),
//                           TextButton(
//                             onPressed: () {},
//                             child: Text(Strings.sorted, style: TextStyles.h2),
//                           ),
//                           SizedBox(
//                               height:
//                                   MediaQuery.of(context).size.height * 0.05),
//                           Container(
//                             height: Insets.offset74,
//                             padding: EdgeInsets.fromLTRB(
//                                 Insets.offset0,
//                                 Insets.offset12,
//                                 Insets.offset0,
//                                 Insets.offset0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Expanded(
//                                   flex: isMobile ? 22 : 15,
//                                   child: InputDecorator(
//                                     decoration: InputDecoration(
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: Corners.lgBorder,
//                                         borderSide: BorderSide(
//                                             width: Insets.offsetScale,
//                                             color: AppTheme.borderColor),
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderRadius: Corners.lgBorder,
//                                         borderSide: BorderSide(
//                                             width: Insets.offsetScale,
//                                             color: AppTheme.borderColor),
//                                       ),
//                                     ),
//                                     child: DropdownButtonHideUnderline(
//                                       child: DropdownButton<String>(
//                                         value: Strings.countryCode,
//                                         isDense: true,
//                                         isExpanded: true,
//                                         items: [
//                                           DropdownMenuItem(
//                                               value: Strings.countryCode,
//                                               child: Text(
//                                                 Strings.countryCode,
//                                                 style: TextStyles.title2,
//                                               )),
//                                         ],
//                                         onChanged: (newValue) {
//                                           setState(() {});
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: Insets.offset10,
//                                 ),
//                                 Expanded(
//                                   flex: 80,
//                                   child: CustomTextField(
//                                     hintText: Strings.hintTextPhone,
//                                     maxLine: 1,
//                                     maxLength: 10,
//                                     obscureText: false,
//                                     inputFormatters: <TextInputFormatter>[
//                                       FilteringTextInputFormatter.digitsOnly,
//                                     ],
//                                     keyboardType: TextInputType.number,
//                                     preFixWidget: Padding(
//                                         padding: EdgeInsets.all(Insets.lg),
//                                         child: Text(Strings.plus91,
//                                             style: TextStyle(
//                                               fontSize: FontSizes.s18,
//                                               color: AppTheme.black,
//                                               fontWeight: FontWeight.w400,
//                                               fontFamily: Strings.publicSans,
//                                             ))),
//                                     controller: phoneNumber,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(
//                                 Insets.offset24,
//                                 Insets.offset12,
//                                 Insets.offset24,
//                                 Insets.offset0),
//                             child: Text(
//                               errorText,
//                               style: TextStyle(
//                                   fontSize: FontSizes.s16,
//                                   color: AppTheme.red,
//                                   fontWeight: FontWeight.w400,
//                                   fontFamily: Strings.publicSans),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         width: Insets.xll * 3,
//                         child: Padding(
//                           padding: EdgeInsets.fromLTRB(
//                             Insets.offset0,
//                             Insets.offset74,
//                             Insets.offset0,
//                             Insets.offset12,
//                           ),
//                           child: Obx(() => CustomElevatedButton(
//                                 Strings.getStarted,
//                                 () => loginButtonClicked(context),
//                                 buttonPadding: EdgeInsets.all(Insets.lg),
//                                 buttonColor: AppTheme.primaryColor,
//                                 loading: logInController.formzStatus.value ==
//                                     FormzStatus.submissionInProgress,
//                               )),
//                         ),
//                       )
//                     ]),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void loginButtonClicked(context) async {
//     if (phoneNumber.text.length < 10) {
//       errorText = 'Phone number is invalid';
//     } else {
//       errorText = '';
//       String? err = await logInController.sendOtp(
//         Strings.plus91.trim(),
//         phoneNumber.text.toString(),
//       );
//       errorText = err ?? '';
//     }
//     setState(() {});
//   }
// }
