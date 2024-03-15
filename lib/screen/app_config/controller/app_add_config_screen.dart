// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:tree_animation/screen/app_config/app_config_controller.dart';
// import 'package:tree_animation/screen/app_config/model/config_response_model.dart';


// class AppAddConfigScreen extends StatefulWidget {
//   const AppAddConfigScreen({Key? key, this.config, this.onSuccess})
//       : super(key: key);
//   final ConfigResponseModel? config;
//   final Function? onSuccess;
//   @override
//   State<AppAddConfigScreen> createState() => _AppAddConfigScreenState();
// }

// class _AppAddConfigScreenState extends State<AppAddConfigScreen> {
//   final nameController = TextEditingController();

//   final configController = TextEditingController();

//   final AppAddConfigController addAppConfigController =
//       Get.put(AppAddConfigController());

//   bool? nameAdd;

//   bool? configAdd;

//   validate() {
//     (nameAdd ??= false);
//     (configAdd ??= false);

//     setState(() {});
//     return nameAdd! && configAdd!;
//   }

//   @override
//   void initState() {
//     super.initState();
//     initialiseScreenAndControllers();
//   }

//   void initialiseScreenAndControllers() {
//     if (widget.config != null) {
//       // initialise controllers
//       nameController.text = widget.config?.name ?? '';
//       configController.text = widget.config?.config?.toString() ?? '';
//       nameAdd = true;
//       configAdd = true;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: widget.config != null
//                 ? Strings.updateConfig
//                 : Strings.appConfig),
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: Insets.offset10),
//           child: Column(
//             children: [
//               STextFormField(
//                   readOnly: widget.config != null,
//                   error: nameAdd,
//                   maxLines: 1,
//                   controller: nameController,
//                   hintText: 'Enter the Name',
//                   onChange: (String? v) {
//                     setState(() {
//                       nameAdd = v?.trim().isNotEmpty;
//                     });
//                   }),
//               STextFormField(
//                   error: configAdd,
//                   maxLines: 1,
//                   controller: configController,
//                   hintText: 'Enter config',
//                   onChange: (String? v) {
//                     configAdd = v?.trim().isNotEmpty;
//                     setState(() {});
//                   }),
//               CustomElevatedButton(
//                 widget.config != null
//                     ? Strings.updateConfig
//                     : Strings.addConfig,
//                 () async {
//                   if (validate()) {
//                     String? err = await addAppConfigController.postAppConfig(
//                         AppConfigRequest(
//                             config: configController.text,
//                             name: nameController.text));
//                     if (err == null) {
//                       showDialog(
//                           barrierDismissible: false,
//                           context: context,
//                           builder: ((context) {
//                             return CustomApiResultDialog(
//                               isSuccess: true,
//                               title: (widget.config == null)
//                                   ? Strings.addConfig
//                                   : Strings.updateConfig,
//                               onTap: () {
//                                 Navigator.of(context).pop();
//                                 widget.onSuccess == null
//                                     ? () {}
//                                     : widget.onSuccess!();
//                               },
//                             );
//                           }));
//                     } else {
//                       showDialog(
//                           barrierDismissible: false,
//                           context: context,
//                           builder: ((context) {
//                             return CustomApiResultDialog(
//                               title: err,
//                               onTap: () {},
//                             );
//                           }));
//                     }
//                   }
//                 },
//                 buttonPadding: EdgeInsets.all(Insets.lg),
//                 buttonColor: AppTheme.primaryColor,
//               ),
//             ],
//           ),
//         ));
//   }
// }
