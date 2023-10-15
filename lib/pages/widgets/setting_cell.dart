import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/utils/sizes.dart';

enum OnClickedType {
  picker,
  navigator,
}

class SettingCell extends StatelessWidget {
  const SettingCell({
    super.key,
    required this.title,
    required this.text,
    required this.icon,
    this.onClickedType = OnClickedType.picker,
    this.items,
  });

  final String title;
  final String text;
  final Icon icon;
  final OnClickedType onClickedType;
  final List<Text>? items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              fixedSize: Size.fromHeight(SizeConfig.screenHeight * 0.09),
              //Sizeクラスで高さを指定
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), //角の丸み
              ),
              backgroundColor: Colors.black38,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
                icon
              ],
            ),
            onPressed: () {
              if (onClickedType == OnClickedType.picker) {
                BottomPicker(
                  items: items,
                  title: title,
                  titleStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  displaySubmitButton: false,
                  onChange: (index) {
                    print(index);
                  },
                ).show(context);
              }
              if (onClickedType == OnClickedType.navigator) {}
            },
          ),
        ],
      ),
    );
  }
}
