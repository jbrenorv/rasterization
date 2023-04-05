import 'package:flutter/material.dart';

import 'form_wrapper_widget.dart';
import 'image_control_widget.dart';
import 'image_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // final image = img.Image(width: 32, height: 32);
    // final A = img.PixelInt8.image(image)..setPosition(10, 10);
    // final B = img.PixelInt8.image(image)..setPosition(20, 10);
    // final C = img.PixelInt8.image(image)..setPosition(20, 20);
    // final D = img.PixelInt8.image(image)..setPosition(10, 20);
    // final E = img.PixelInt8.image(image)..setPosition(100, 10);
    // Rasterizer.rasterizeSegment(image: image, from: D, to: B);
    // Rasterizer().rasterizePolygon(image: image, vertices: [A, B, C, D]);
    // final png = img.encodePng(image);

    return Scaffold(
      body: Row(
        children: [
          const FormWrapperWidget(),
          const VerticalDivider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
              child: Column(
                children: const [
                  Expanded(child: ImageWidget()),
                  SizedBox(height: 8),
                  ImageControlWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
