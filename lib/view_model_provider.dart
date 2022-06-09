import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streams/locator.dart';

class ViewModelProvider<T extends ChangeNotifier> extends StatefulWidget {
  const ViewModelProvider({
    Key? key,
    required this.builder,
    this.child,
    this.onModelProvided,
  }) : super(key: key);

  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Widget? child;
  final Function(T)? onModelProvided;

  @override
  _ViewModelProviderState<T> createState() => _ViewModelProviderState<T>();
}

class _ViewModelProviderState<T extends ChangeNotifier>
    extends State<ViewModelProvider<T>> {
  late T model;

  @override
  void initState() {
    super.initState();
    model = locator<T>();

    widget.onModelProvided?.call(model);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
