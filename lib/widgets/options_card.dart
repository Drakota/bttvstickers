import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/widgets/card.dart' as own;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Option<T> {
  final String assetName;
  final T value;
  final String displayName;

  Option({
    this.displayName = "",
    required this.assetName,
    required this.value,
  });
}

class OptionsCard<T> extends StatefulWidget {
  final String fieldName;
  final List<Option<T>> options;
  final T defaultValue;
  final void Function(Option selectedOption) onChange;

  OptionsCard({
    Key? key,
    this.fieldName = "",
    required this.options,
    required this.defaultValue,
    onChange,
  })  : onChange = onChange ?? (() => {}),
        super(key: key);

  @override
  _OptionsCardState createState() => _OptionsCardState();
}

class _OptionsCardState extends State<OptionsCard> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    if (widget.defaultValue != null) {
      _currentIndex = _findOptionIndex(widget.defaultValue);
    } else {
      _currentIndex = 0;
    }
  }

  int _findOptionIndex(dynamic value) {
    var index = widget.options.indexWhere((option) => option.value == value);

    // If we don't find the option, return the first option
    return index >= 0 ? index : 0;
  }

  void _handleOnTap() {
    if (_currentIndex + 1 < widget.options.length) {
      setState(() {
        _currentIndex++;
      });
    } else {
      setState(() {
        _currentIndex = 0;
      });
    }
    widget.onChange(widget.options[_currentIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return own.Card(
      child: Row(
        children: [
          SvgPicture.asset(
            widget.options[_currentIndex].assetName,
            height: kNavBarIconHeight,
            // ignore: deprecated_member_use
            color: Theme.of(context).buttonColor,
          ),
          const Spacer(
            flex: kIconFieldFlexSpacing,
          ),
          Text(
            "${widget.fieldName}: ${widget.options[_currentIndex].displayName}",
            style: Theme.of(context).textTheme.headline6,
          ),
          const Spacer(flex: 20),
        ],
      ),
      onTap: _handleOnTap,
    );
  }
}
