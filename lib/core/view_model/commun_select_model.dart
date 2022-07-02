import 'package:flutter/material.dart';

class CommunSelectModel {
  String id = UniqueKey().toString();
  String? name;
  bool? selected;
  CommunSelectModel(this.name, this.selected);
}
