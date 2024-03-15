// import '../../add_inventory/model/inventory_response.dart';
//
// class PdpHelper {
//   String selectedQuantityDisplay(num qty, String uom, bool bypass,
//       {int toStringAsFixed = 2}) {
//     if ((qty < 1.0 && uom == 'kg') || bypass) {
//       return (qty * 1000).toInt().toString();
//     } else if (uom == 'pcs') {
//       return qty.toInt().toString();
//     } else if (uom == 'pack') {
//       return qty.toInt().toString();
//     }
//     return qty.toStringAsFixed(toStringAsFixed);
//   }
//
//   String selectedUOM(num qty, String uom) {
//     if (qty < 1.0 && 'kg' == uom) {
//       return 'gm';
//     }
//     return uom;
//   }
//
//   String numberPieces(InventoryResponseModel item) {
//     if (item.product?.perPcsWeight != null &&
//         item.selectedQuantity.value > 0 &&
//         item.suffix.isNotEmpty) {
//       if (item.unitOfMeasurement == 'kg') {
//         int lower = item.selectedQuantity.value ~/ item.product!.perPcsWeight!;
//         if (item.product!.perPcsBuffer != null) {
//           double actual = (lower * item.product!.perPcsBuffer!) /
//               item.product!.perPcsWeight!;
//           int upper = (lower * item.product!.perPcsBuffer!) ~/
//               item.product!.perPcsWeight!;
//           if (actual > upper) {
//             upper = upper + 1;
//           }
//           if (lower != (lower + upper)) {
//             return "| ~ $lower - ${lower + upper} ${item.suffix}";
//           }
//         }
//         if (lower > 1) {
//           return "| ~ $lower ${item.suffix}";
//         }
//         return "| ~ 1 ${item.suffix}";
//       }
//       else {
//         double lower =
//             (item.selectedQuantity.value * item.product!.perPcsWeight!);
//         if (item.product!.perPcsBuffer != null) {
//           double upper = lower +
//               (item.selectedQuantity.value * item.product!.perPcsBuffer!);
//           if (lower != upper) {
//             return "| ~ ${selectedQuantityDisplay(lower, item.suffix, false)} - ${selectedQuantityDisplay(upper, item.suffix, lower < 1.0)} ${selectedUOM(lower, item.suffix)}";
//           }
//         }
//         return "| ~ ${selectedQuantityDisplay(lower, item.suffix, false)} ${selectedUOM(lower, item.suffix)}";
//       }
//     }
//     return '';
//   }
//
//   String numberPiecesFinal(InventoryResponseModel item) {
//     if (item.product?.perPcsWeight != null &&
//         item.selectedQuantity.value > 0 &&
//         item.suffixFinal.isNotEmpty) {
//       if (item.unitOfMeasurementFinal == 'kg') {
//         int lower = item.selectedQuantity.value ~/ item.product!.perPcsWeight!;
//         if (item.product!.perPcsBuffer != null) {
//           double actual = (lower * item.product!.perPcsBuffer!) /
//               item.product!.perPcsWeight!;
//           int upper = (lower * item.product!.perPcsBuffer!) ~/
//               item.product!.perPcsWeight!;
//           if (actual > upper) {
//             upper = upper + 1;
//           }
//           if (lower != (lower + upper)) {
//             return "| ~ $lower - ${lower + upper} ${item.suffixFinal}";
//           }
//         }
//         if (lower > 1) {
//           return "| ~ $lower ${item.suffixFinal}";
//         }
//
//         return "| ~ ${item.selectedQuantity.value} ${item.suffixFinal}";
//       }
//       else {
//         double lower =
//             (item.selectedQuantity.value * item.product!.perPcsWeight!);
//         if (item.product!.perPcsBuffer != null) {
//           double upper = lower +
//               (item.selectedQuantity.value * item.product!.perPcsBuffer!);
//           if (lower != upper) {
//             return "| ~ ${selectedQuantityDisplay(lower, item.suffixFinal, false)} - ${selectedQuantityDisplay(upper, item.suffixFinal, lower < 1.0)} ${selectedUOM(lower, item.suffixFinal)}";
//           }
//         }
//         return "| ~ ${selectedQuantityDisplay(lower, item.suffixFinal, false)} ${selectedUOM(lower, item.suffixFinal)}";
//       }
//     }
//     return '';
//   }
//
//   String numberPiecesLower(InventoryResponseModel item) {
//     if (item.product?.perPcsWeight != null &&
//         item.selectedQuantity.value > 0 &&
//         item.suffix.isNotEmpty) {
//       if (item.unitOfMeasurement == 'kg') {
//         int lower = item.selectedQuantity.value ~/ item.product!.perPcsWeight!;
//         if (item.product!.perPcsBuffer != null) {
//           double actual = (lower * item.product!.perPcsBuffer!) /
//               item.product!.perPcsWeight!;
//           int upper = (lower * item.product!.perPcsBuffer!) ~/
//               item.product!.perPcsWeight!;
//           if (actual > upper) {
//             upper = upper + 1;
//           }
//           if (lower != (lower + upper)) {
//             return "~ $lower ${item.suffix} ";
//           }
//         }
//         if (lower > 1) {
//           return "~ $lower ${item.suffix} ";
//         } else {
//           return "| ~ ${item.selectedQuantity.value} ${item.suffix}";
//         }
//       } else {
//         double lower =
//             (item.selectedQuantity.value * item.product!.perPcsWeight!);
//         if (item.product!.perPcsBuffer != null) {
//           double upper = lower +
//               (item.selectedQuantity.value * item.product!.perPcsBuffer!);
//           if (lower != upper) {
//             return "~ ${selectedQuantityDisplay(lower, item.suffix, false, toStringAsFixed: 1)} ${selectedUOM(lower, item.suffix)} ";
//           }
//         }
//         return "~ ${selectedQuantityDisplay(lower, item.suffix, false, toStringAsFixed: 1)} ${selectedUOM(lower, item.suffix)} ";
//       }
//     }
//     return '';
//   }
//
//   String packBunchInfo(InventoryResponseModel item) {
//     if (item.suffixReal == 'pack' || item.suffixReal == 'bunch') {
//       return '1 ${item.suffixReal} = ${PdpHelper().selectedQuantityDisplay(item.product?.perPcsWeight ?? 0, item.unitOfMeasurementReal, false, toStringAsFixed: 1)}${PdpHelper().selectedUOM(item.product?.perPcsWeight ?? 0, item.unitOfMeasurementReal)}';
//     } else if (item.unitOfMeasurementReal == 'pack' ||
//         item.unitOfMeasurementReal == 'bunch') {
//       return '1 ${item.unitOfMeasurementReal} = ${PdpHelper().selectedQuantityDisplay(item.product?.perPcsWeight ?? 0, item.suffix, false, toStringAsFixed: 1)}${PdpHelper().selectedUOM(item.product?.perPcsWeight ?? 0, item.suffix)}';
//     }
//     return '';
//   }
//
//   String isPackOrBunch(InventoryResponseModel item) {
//     if (item.suffixReal == 'bunch' || item.unitOfMeasurementReal == 'bunch') {
//       return 'bunch';
//     } else if (item.suffixReal == 'pack' ||
//         item.unitOfMeasurementReal == 'pack') {
//       return 'pack';
//     }
//     return '';
//   }
//
//   bool isPriceBracketApply(InventoryResponseModel inventory) {
//     if ((inventory.priceBrackets ?? []).length > 1) {
//       if ((inventory.priceBrackets![1].min ?? 0) <=
//           inventory.selectedQuantity.value) {
//         return true;
//       } else {
//         return false;
//       }
//     } else {
//       return false;
//     }
//   }
//
//   String getOfferPercentage(InventoryResponseModel inventory) {
//     if ((inventory.priceBrackets ?? []).length > 1) {
//       for (int i = 0; i < (inventory.priceBrackets ?? []).length; i++) {
//         if (i != 0) {
//           if ((inventory.priceBrackets![i].min ?? 0) <=
//                   inventory.selectedQuantity.value &&
//               (inventory.priceBrackets![i].max ?? 0) >
//                   inventory.selectedQuantity.value) {
//             double differencePrice = (inventory.salePrice ?? 0) -
//                 (inventory.priceBrackets![i].salePrice ?? 0).toDouble();
//             double percentage =
//                 (differencePrice / (inventory.salePrice ?? 0)) * 100;
//             return '${(percentage)}%';
//           }
//         }
//       }
//     }
//     return '';
//   }
//
//   String getPercentage(double inventorySalePrice, double offerSalePrice) {
//     double differencePrice = (inventorySalePrice) - (offerSalePrice);
//     double percentage = (differencePrice / (inventorySalePrice)) * 100;
//     return '${(percentage)}%';
//   }
//
//   bool getPriceBrackets(double selectedQty, PriceBracket priceBucket) {
//     return (selectedQty >= (priceBucket.min ?? 0) &&
//         selectedQty < (priceBucket.max ?? 0));
//   }
//
//   bool isPriceBracketHigh(double selectedQty, PriceBracket priceBucket) {
//     return (selectedQty >= (priceBucket.min ?? 0) &&
//         selectedQty > (priceBucket.max ?? 0));
//   }
//
//   // double lastOrderQuantity(InventoryResponseModel item) {
//   //   if (item.product!.enablePiecesRequest!) {
//   //     return double.parse(
//   //         (item.lastOrderQuantity / item.product!.perPcsWeight!).toString());
//   //   } else {
//   //     return item.lastOrderQuantity;
//   //   }
//   // }
// }
