import 'package:flutter/material.dart';
import 'package:streams/locator.dart';
import 'package:streams/tile_view_model.dart';
import 'package:streams/view_model_provider.dart';

void main() {
  locator.initSyncDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Websocket API Testing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, int index) {
            return InkWell(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (context) => SomeCoolTileWidget(index: index),
                );
              },
              child: Container(
                height: 50,
                color: Colors.greenAccent,
                child: Center(child: Text('Click me: $index')),
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 24),
        ),
      ),
    );
  }
}

class SomeCoolTileWidget extends StatelessWidget {
  const SomeCoolTileWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TileViewModel>(
      onModelProvided: (model) => model.onInit(),
      builder: (_, model, __) {
        return Scaffold(
          appBar: AppBar(title: Text('Tile Index: $index')),
          body: model.state == ViewState.loading
              ? const CircularProgressIndicator()
              : Center(
                  child: Text(
                    'fetched number: ${model.number}',
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
        );
      },
    );
  }
}
