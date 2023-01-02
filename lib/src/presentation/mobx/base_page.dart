import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mobx/mobx.dart';

abstract class BaseState<T extends StatefulWidget, S extends Store>
    extends State<T> {
  BaseState({S? controller})
      : controller =
            controller ?? (S == Store ? null : GetIt.instance.get<S>());
  final S? controller;

  List<mobx.ReactionDisposer> disposers = [];

  final List<void Function()> autoRun = [];

  final List<Reaction> reaction = [];
}
