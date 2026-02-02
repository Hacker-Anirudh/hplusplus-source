import 'package:flutter/material.dart';

class PixelArtScreen extends StatefulWidget {
  const PixelArtScreen({super.key});

  @override
  PixelArtScreenState createState() => PixelArtScreenState();
}

class PixelArtScreenState extends State<PixelArtScreen> {
  List<List<Color>> pixelGrid = List.generate(
    16,
    (_) => List.generate(16, (_) => Colors.white),
  );

  Color selectedColor = Colors.black;

  void togglePixel(int row, int col) {
    setState(() {
      pixelGrid[row][col] = selectedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    double pixelSize = 400 / 16;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pixel Art',
          style: TextStyle(fontFamily: 'VT323', fontSize: 48),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(3.7),
                  child: Text(
                    'Op deze website kan u genieten van een pixel art van zeer goede kwaliteit. Geniet ervan!',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            ),
          ),
          Wrap(
            spacing: 8.0,
            children:
                [
                  Colors.black,
                  Colors.red,
                  Colors.green,
                  Colors.blue,
                  Colors.purple,
                  Colors.grey,
                  Colors.pink,
                  Colors.orange,
                  Colors.white,
                ].map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selectedColor == color
                              ? Colors.white
                              : Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 400,
                height: 400,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 16,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: 16 * 16,
                  itemBuilder: (context, index) {
                    int row = index ~/ 16;
                    int col = index % 16;
                    return GestureDetector(
                      onTap: () => togglePixel(row, col),
                      child: Container(
                        color: pixelGrid[row][col],
                        width: pixelSize,
                        height: pixelSize,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
