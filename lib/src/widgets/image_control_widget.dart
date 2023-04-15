import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../widgets/control_button_widget.dart';

class ImageControlWidget extends StatefulWidget {
  const ImageControlWidget({super.key});

  @override
  State<ImageControlWidget> createState() => _ImageControlWidgetState();
}

class _ImageControlWidgetState extends State<ImageControlWidget> {

  void _clearImage() {
    context.read<HomeBloc>().clear();
  }

  void _undo() {}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ControlButtonWidget(
          onPressed: _clearImage,
          iconData: Icons.clear_rounded,
          tooltipMessage: 'Limpar',
        ),
        ControlButtonWidget(
          onPressed: _undo,
          iconData: Icons.undo_rounded,
          tooltipMessage: 'Desfazer',
        ),
      ],
    );
  }
}
