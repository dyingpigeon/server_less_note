import 'package:flutter/material.dart';

import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

class Note extends StatefulWidget {
  const Note({super.key, required this.title});

  final String title;

  @override
  State<Note> createState() => _Note();
}

class _Note extends State<Note> {
  // final List<String> catatanList = [
  //   "Hari ini belajar dasar-dasar Flutter, mulai dari struktur Scaffold, penggunaan AppBar, hingga cara menampilkan list menggunakan ListView.builder agar performa aplikasi tetap optimal meskipun datanya banyak.",
  //   "State management adalah salah satu konsep paling krusial di Flutter. Memahami kapan harus menggunakan StatelessWidget dan StatefulWidget akan sangat membantu performa aplikasi di masa mendatang.",
  //   "Jangan lupa untuk selalu memperhatikan tata letak (layout) menggunakan Expanded, Flexible, atau Padding agar tampilan aplikasi responsif di berbagai ukuran layar ponsel yang berbeda-beda.",
  // ];

  final String teksPanjangBuku = """
# Test Judul H1 (Besar)
Halo! Ini adalah pengujian **teks tebal**, *teks miring*, dan ~~teks coret~~ menggunakan package `flutter_markdown`.

## Sub-Judul H2
Berikut adalah daftar poin-poin (bullet list) untuk mengetes kerapian layout:
* Poin pertama dalam list
* Poin kedua yang **lebih penting**
* Poin ketiga

> "Ini adalah contoh Blockquote (kutipan). Jika tampilannya berubah menjadi garis di sebelah kiri dan teks sedikit miring, berarti package markdown Anda sudah berhasil berfungsi!"

### Contoh Kode (Code Block)
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: Text(
      //           teksPanjangBuku,
      //           style: const TextStyle(fontSize: 16.0),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Markdown(
        data: teksPanjangBuku,
        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
          h1: const TextStyle(fontFamily: 'ariel', fontSize: 32, fontWeight: FontWeight.bold),
          h2: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          h3: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          p: const TextStyle(fontSize: 16),
          blockquoteDecoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(4.0),
          ),
          codeblockDecoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}
