
import 'package:flutter/material.dart';
import 'package:tree_animation/common/styles.dart';
import 'package:tree_animation/common/themes.dart';
import 'package:tree_animation/screen/main_screen/model/society.dart';



class SocietyDropDown extends StatefulWidget {
  const SocietyDropDown(
      {super.key,
      this.societyList,
      this.hintText,
      this.borderColor,
      this.borderWidth,
      this.onChanged,
      this.hintTextColor,
      this.selectedSociety});

  final List<SocietyModel>? societyList;
  final SocietyModel? selectedSociety;
  final String? hintText;
  final Color? hintTextColor;
  final Color? borderColor;
  final double? borderWidth;
  final Function(SocietyModel)? onChanged;

  @override
  State<SocietyDropDown> createState() => _SocietyDropDownState();
}

class _SocietyDropDownState extends State<SocietyDropDown> {
  SocietyModel? societyModel;
  int? societyModelId;

  @override
  void initState() {
    print('Selected society===> ${widget.selectedSociety.toString()}');
    if (widget.selectedSociety != null) {
      societyModelId = widget.selectedSociety!.id;
    } else {
      societyModelId = null;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: Insets.med, right: Insets.med),
        margin: EdgeInsets.only(top: Insets.xs, bottom: Insets.xs),
        decoration: BoxDecoration(
          border: Border.all(
              color: widget.borderColor ?? AppTheme.grey.withOpacity(0.2),
              width: widget.borderWidth ?? 1.6),
          borderRadius: Corners.smBorder * 4,
        ),
        child: DropdownButton<int>(
          isExpanded: true,
          value: societyModelId,
          hint: Text(
            widget.hintText ?? '',
            style: TextStyles.body1.copyWith(
              color: AppTheme.grey,
            ),
          ),
          underline: const SizedBox(),
          items: widget.societyList?.map((SocietyModel value) {
            return DropdownMenuItem<int>(
              value: value.id,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${value.name}',
                    style: TextStyles.body1.copyWith(
                      color: AppTheme.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  // Text('${value.address}', style: TextStyles.body2,),
                ],
              ),
            );
          }).toList(),
          onChanged: (item) {
            if (item != null) {
              societyModel = widget.societyList
                  ?.firstWhere((element) => element.id == item);
              societyModelId = item;
              if (mounted) {
                setState(() {});
              }
              widget.onChanged!(societyModel!);
            }
          },
        ));
  }
}

class TowerDropDown extends StatelessWidget {
  const TowerDropDown(
      {super.key,
      this.towerList,
      this.hintText,
      this.borderColor,
      this.borderWidth,
      this.onChanged,
      this.hintTextColor,
      this.selectedTower});

  final List<Tower>? towerList;
  final Tower? selectedTower;
  final String? hintText;
  final Color? hintTextColor;
  final Color? borderColor;
  final double? borderWidth;
  final Function(Tower)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 1, right: Insets.med),
      margin: EdgeInsets.only(top: Insets.xs, bottom: Insets.xs),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppTheme.greyC5C2C2, width: .5),
        ),
        // border: Border.all(
        //     color: borderColor ?? AppTheme.grey.withOpacity(0.2),
        //     width: borderWidth ?? 1.6),
        // borderRadius: Corners.smBorder * 4,
      ),
      child: DropdownButton<Tower>(
        isExpanded: true,
        value: selectedTower,
        hint: Text(
          hintText ?? '',
          style: TextStyles.body1.copyWith(
            color: AppTheme.greyB2B2B2,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        underline: const SizedBox(),
        items: towerList?.map((Tower value) {
          return DropdownMenuItem<Tower>(
            value: value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${value.towerName}',
                  style: TextStyles.body1.copyWith(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                // Text('${value.address}', style: TextStyles.body2,),
              ],
            ),
          );
        }).toList(),
        onChanged: (item) {
          if (item != null) {
            onChanged!(item);
          }
        },
      ),
    );
  }
}

class CustomNumberDropDown extends StatelessWidget {
  const CustomNumberDropDown(
      {super.key,
      this.list,
      this.hintText,
      this.borderColor,
      this.borderWidth,
      this.onChanged,
      this.hintTextColor,
      this.selectedValue});

  final List<int>? list;
  final int? selectedValue;
  final String? hintText;
  final Color? hintTextColor;
  final Color? borderColor;
  final double? borderWidth;
  final Function(int)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 1, right: Insets.med),
      margin: EdgeInsets.only(top: Insets.xs, bottom: Insets.xs),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppTheme.greyC5C2C2, width: .5),
        ),
        // border: Border.all(
        //     color: borderColor ?? AppTheme.grey.withOpacity(0.2),
        //     width: borderWidth ?? 1.6),
        // borderRadius: Corners.smBorder * 4,
      ),
      child: DropdownButton<int>(
        isExpanded: true,
        value: selectedValue,
        hint: Text(
          hintText ?? '',
          style: TextStyles.body1.copyWith(
            color: AppTheme.greyB2B2B2,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        underline: const SizedBox(),
        items: list?.map((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$value',
                  style: TextStyles.body1.copyWith(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                // Text('${value.address}', style: TextStyles.body2,),
              ],
            ),
          );
        }).toList(),
        onChanged: (item) {
          if (item != null) {
            onChanged!(item);
          }
        },
      ),
    );
  }
}
