import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_riverpod/data/models/recreation_area_model.dart';

@RoutePage()
class DetailRecreationAreaScreen extends StatefulWidget {
  const DetailRecreationAreaScreen({
    super.key,
    required this.recreationArea,
  });

  final RecreationAreaModel recreationArea;

  @override
  State<DetailRecreationAreaScreen> createState() =>
      _DetailRecreationAreaScreenState();
}

class _DetailRecreationAreaScreenState
    extends State<DetailRecreationAreaScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('DetailRecreationAreaScreen'),
      ),
    );
  }
}
