import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/widgets/svgbuttonicon.dart';
import 'package:flutter/material.dart';

class ClearableTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool autofocus;

  ClearableTextField({
    this.controller,
    this.autofocus = false,
    this.hintText = 'Enter text',
  });

  @override
  State<StatefulWidget> createState() {
    return _ClearableTextFieldState();
  }
}

class _ClearableTextFieldState extends State<ClearableTextField> {
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _showClearButton = widget.controller.text.length > 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofocus: widget.autofocus,
      style: TextStyle(
        color: Theme.of(context).accentColor,
        fontSize: kTextFieldFontSize,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        suffixIcon: _getClearButton(),
      ),
    );
  }

  Widget _getClearButton() {
    if (!_showClearButton) {
      return null;
    }

    return SvgButtonIcon(
      assetName: "assets/icons/x-circle-fill.svg",
      onPressed: () => widget.controller.clear(),
    );
  }
}
