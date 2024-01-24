import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

import '../constants/constants.dart';
import '../models/game_symbol.dart';
import '../util/language_constants.dart';

class RadioButtonTasks extends StatefulWidget {
  Function(int value) tasksCallback;
  int value;
  GameSymbol symbol;
  double maxWidth;
  double maxHeight;

  RadioButtonTasks(this.tasksCallback, this.value, this.symbol, this.maxWidth,
      this.maxHeight,
      {Key? key})
      : super(key: key);

  @override
  State<RadioButtonTasks> createState() => _RadioButtonTasksState();
}

class _RadioButtonTasksState extends State<RadioButtonTasks> {
  late int currentTasks;

  showPickerNumber(
    BuildContext context,
    GameSymbol currentSymbol,
  ) {
    Picker(
      adapter: NumberPickerAdapter(data: [
        NumberPickerColumn(
          begin: currentSymbol.min,
          end: currentSymbol.max,
        ),
      ]),
      hideHeader: true,
      height: widget.maxHeight * 0.3,
      itemExtent: widget.maxHeight * 0.1,
      title: Text(
        translation(context).numberPickerTitle,
        style: TextStyle(
          color: Colors.grey.shade800,
        ),
      ),
      cancelText: translation(context).numberPickerCancel,
      confirmText: translation(context).numberPickerOk,
      cancelTextStyle: TextStyle(color: Colors.grey.shade800),
      confirmTextStyle: TextStyle(color: Colors.grey.shade800),
      selecteds: [currentTasks - currentSymbol.min],
      selectedTextStyle: const TextStyle(color: Colors.blue),
      onConfirm: (Picker picker, List value) {
        setState(
          () {
            currentTasks = picker.getSelectedValues()[0];
            widget.tasksCallback(currentTasks);
          },
        );
      },
    ).showDialog(context);
    // za dodati bacground boju
    // , builder: (context, view) {
    // return Material(
    // child: Container(
    // padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
    // child: view,
    // ));
    // }, backgroundColor: Colors.white
  }

  Widget numberButton(
    double buttonWidth,
    double buttonHeight,
    GameSymbol currentSymbol,
    BuildContext appContext,
  ) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: OutlinedButton(
        onPressed: () {
          showPickerNumber(
            appContext,
            currentSymbol,
          );
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
            color: Colors.black,
          ),
          padding: EdgeInsets.zero,
        ),
        child: AutoSizeText(
          currentTasks.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: min(buttonWidth * 0.4, buttonHeight * 0.7),
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    currentTasks = widget.value;
    var currentSymbol = GameSymbol.values.firstWhere((e) => e == widget.symbol);
    var buttonWidth = widget.maxWidth / 7;
    var buttonHeight = widget.maxHeight * settingsRadioButtonHeightScale;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: AutoSizeText(
            translation(context).tasksUpToNumber,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: widget.maxWidth / settingsFontSize,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
        ),
        const SizedBox(
          width: settingsRowMargin,
        ),
        Flexible(
          flex: 5,
          child: Row(
            children: [
              numberButton(
                buttonWidth,
                buttonHeight,
                currentSymbol,
                context,
              ),
              const SizedBox(
                width: settingsRowMargin,
              ),
              Text(
                "(min ${currentSymbol.min}, max ${currentSymbol.max})",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: min(buttonWidth * 0.4, buttonHeight * 0.7) * 0.5,
                  color: Colors.grey.shade600,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
