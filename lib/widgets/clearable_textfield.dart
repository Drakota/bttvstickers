import 'dart:async';

import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/widgets/svgbuttonicon.dart';
import 'package:flutter/material.dart';

class ClearableTextField extends StatefulWidget {
  final void Function(String value) onChanged;
  final String hintText;
  final Duration debounceTime;
  final bool autofocus;

  ClearableTextField({
    this.debounceTime = const Duration(milliseconds: 0),
    this.autofocus = false,
    this.hintText = 'Enter text',
    onChanged,
  }) : onChanged = onChanged ?? (() => {});

  @override
  State<StatefulWidget> createState() {
    return _ClearableTextFieldState();
  }
}

class _ClearableTextFieldState extends State<ClearableTextField> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _showClearButton = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_onTextChangedListener);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _textEditingController.removeListener(_onTextChangedListener);
    super.dispose();
  }

  void _onTextChangedListener() {
    setState(() {
      _showClearButton = _textEditingController.text.length > 0;
    });
    if (_textEditingController.text.length > 0) {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(widget.debounceTime, () {
        widget.onChanged(_textEditingController.text);
      });
    } else {
      // If we clear the textfield, bypass the debounce and send the
      // onChanged event right away
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      widget.onChanged(_textEditingController.text);
    }
  }

  Widget? _getClearButton() {
    if (!_showClearButton) {
      return null;
    }

    return SvgButtonIcon(
      assetName: "assets/icons/x-circle-fill.svg",
      onPressed: () => _textEditingController.clear(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
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
}
