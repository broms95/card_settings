// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../../card_settings.dart';

/// This is a list picker that allows for a range of numbers to be speficied as pptions.
class CardSettingsNumberPicker extends StatelessWidget {
  CardSettingsNumberPicker({
    Key key,
    this.label: 'Label',
    this.labelAlign,
    this.initialValue,
    this.contentAlign,
    this.icon,
    this.requiredIndicator,
    @required this.min,
    @required this.max,
    this.stepInterval: 1,
    this.autovalidate: false,
    this.enabled: true,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.visible: true,
    this.showMaterialonIOS,
  }) : assert(min < max);

  // Variables
  final String label;
  final TextAlign labelAlign;
  final TextAlign contentAlign;
  final Icon icon;
  final Widget requiredIndicator;
  final int initialValue;
  final int min;
  final int max;
  final int stepInterval;
  final bool autovalidate;
  final bool visible;
  final bool showMaterialonIOS;
  final bool enabled;

  // Events
  final FormFieldValidator<int> validator;
  final FormFieldSetter<int> onSaved;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return CardSettingsListPicker(
      key: key,
      label: this.label,
      showMaterialonIOS: showMaterialonIOS,
      labelAlign: labelAlign,
      contentAlign: contentAlign,
      visible: visible,
      enabled: enabled,
      initialValue: initialValue?.toString(),
      icon: icon,
      requiredIndicator: requiredIndicator,
      options: List<String>.generate(
        (max - min) ~/ stepInterval + 1,
        (i) => (i * stepInterval + min).toString(),
      ),
      autovalidate: autovalidate,
      validator: _safeValidator,
      onSaved: _safeOnSaved,
      onChanged: _safeOnChanged,
    );
  }

  String _safeValidator(String value) {
    if (validator == null) return null;
    return validator(intelligentCast<int>(value));
  }

  void _safeOnSaved(String value) {
    if (onSaved == null) return;
    onSaved(intelligentCast<int>(value));
  }

  void _safeOnChanged(String value) {
    if (onChanged == null) return;
    onChanged(intelligentCast<int>(value));
  }
}
