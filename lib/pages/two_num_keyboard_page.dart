import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/component/colors.dart';

class TwoNumKeyboardPage extends StatelessWidget {
  TwoNumKeyboardPage({Key? key}) : super(key: key);

  final TextEditingController _riskController = TextEditingController();
  final TextEditingController _rewardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // display the entered numbers
            SizedBox(
              height: 70,
              width: w * 0.45,
              child: TextField(
                controller: _riskController,
                textAlign: TextAlign.center,
                showCursor: false,
                style: const TextStyle(fontSize: 40),
                // Disable the default soft keybaord
                keyboardType: TextInputType.none,
              ),
            ),
            // implement the custom NumPad
            NumPad(
              buttonSize: 50,
              buttonColor: AppColor.lossCutBgColor,
              iconColor: Colors.purple,
              controller: _riskController,
              delete: () {
                if (_riskController.text.isEmpty) {
                  return;
                } else {
                  _riskController.text = _riskController.text
                      .substring(0, _riskController.text.length - 1);
                }
              },
              // do something with the input numbers
              onSubmit: () {
                debugPrint('Your code: ${_riskController.text}');
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: Text(
                      "You code is ${_riskController.text}",
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // display the entered numbers
            SizedBox(
              height: 70,
              width: w * 0.45,
              child: TextField(
                controller: _rewardController,
                textAlign: TextAlign.center,
                showCursor: false,
                style: const TextStyle(fontSize: 40),
                // Disable the default soft keybaord
                keyboardType: TextInputType.none,
              ),
            ),
            // implement the custom NumPad
            NumPad(
              buttonSize: 50,
              buttonColor: AppColor.takeProfitBgColor,
              iconColor: Colors.purple,
              controller: _rewardController,
              delete: () {
                if (_rewardController.text.isEmpty) {
                  return;
                } else {
                  _rewardController.text = _rewardController.text
                      .substring(0, _rewardController.text.length - 1);
                }
              },
              // do something with the input numbers
              onSubmit: () {
                debugPrint('Your code: ${_rewardController.text}');
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: Text(
                      "You code is ${_rewardController.text}",
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

// KeyPad widget
// This widget is reusable and its buttons are customizable (color, size)
class NumPad extends StatelessWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;
  final Function onSubmit;

  const NumPad({
    Key? key,
    this.buttonSize = 70,
    this.buttonColor = Colors.indigo,
    this.iconColor = Colors.amber,
    required this.delete,
    required this.onSubmit,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        //const SizedBox(height: 20),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // implement the number keys (from 0 to 9) with the NumberButton widget
          // the NumberButton widget is defined in the bottom of this file
          children: [
            NumberButton(
              number: 1,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 2,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 3,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberButton(
              number: 4,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 5,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 6,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberButton(
              number: 7,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 8,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 9,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: buttonSize,
            ),
            NumberButton(
              number: 0,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            // this button is used to delete the last number
            SizedBox(
              width: buttonSize,
              child: IconButton(
                onPressed: () => delete(),
                icon: Icon(
                  Icons.backspace,
                  color: iconColor,
                ),
                iconSize: buttonSize * 0.7,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// define NumberButton widget
// its shape is round
class NumberButton extends StatelessWidget {
  final int number;
  final double size;
  final Color color;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size * 0.2),
          ),
        ),
        onPressed: () {
          controller.text += number.toString();
        },
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
