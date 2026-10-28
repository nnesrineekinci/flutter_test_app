
import 'package:flutter/material.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold: Sayfanın temel yapısı
    var scaffold = Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget Playground'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // Column: Elemanları alt alta yerleştirir.
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Center: Başlığı ortalar.
          const Center(
            child: Text(
              'Widget Alıştırmaları',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Row, Column, Container ve esnek yerleşim örneği',
              textAlign: TextAlign.center,
            ),
          ),

          // Expanded: Kalan dikey alanı kullanır.
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // İlk kart, yatay alanın 2/3'ünü alır.
                Expanded(
                  flex: 2,
                  child: buildCard(
                    color: Colors.amber,
                    title: 'Container',
                    description:
                        'Renk, boyut, margin ve padding',
                    icon: Icons.widgets,
                  ),
                ),

                // İkinci kart kalan alanın 1/3'ünü alır.
                Expanded(
                  flex: 1,
                  child: buildCard(
                    color: Colors.pink.shade200,
                    title: 'Center',
                    description: 'İçeriği ortalama',
                    icon: Icons.center_focus_strong,
                  ),
                ),
              ],
            ),
          ),

          // Flexible: İçeriğin esnek alan kullanmasına izin verir.
          Flexible(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              color: Colors.blue.shade50,
              alignment: Alignment.center,
              child: const Text(
                'Öğrenmeye devam!',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),

      // FloatingActionButton: Tıklanabilir yüzen buton.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Widget Playground butonuna tıklandı!');
        },
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: scaffold,
    );
  }

  // Tekrarlanan kart tasarımını fonksiyonla oluşturuyoruz.
  Container buildCard({
    required Color color,
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      color: color,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          // Flexible, metnin kendisine ayrılan alanı
          // esnek kullanmasını sağlar.
          Flexible(
            child: Text(
              description,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
