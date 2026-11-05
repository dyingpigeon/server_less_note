import 'package:flutter/material.dart';

class MyTheme {
  // ============================================================
  // 🟤 LIGHT THEME — Parchment / Antique Paper
  // ============================================================
  static ThemeData LightTheme = ThemeData(
    useMaterial3: true,

    // Warna latar belakang utama semua halaman (Scaffold)
    scaffoldBackgroundColor: const Color(0xFFF6EEE3), // parchment paling terang

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFD9BDA5), // seed dari warna parchment gelap
      brightness: Brightness.light,

      // Warna permukaan card, dialog, bottom sheet, dll
      surface: const Color(0xFFEEE7D7), // krem natural
      // Warna utama: tombol, highlight, FAB, dll
      primary: const Color(0xFF6B4226), // cokelat tua untuk kontras
      // Warna sekunder: chip, toggle, elemen pendukung
      secondary: const Color(0xFFE5DECF), // krem sedikit gelap
      // Warna teks/ikon di atas surface
      onSurface: const Color(0xFF3B2A1A), // cokelat sangat gelap (mirip tinta)
      // Warna error
      error: const Color(0xFFDC2626),

      // Warna aksen ketiga: badge, label, info
      tertiary: const Color(0xFFE5CBBA), // parchment hangat
      // Warna teks di atas tertiary
      onTertiary: const Color(0xFF3B2A1A),
    ),

    appBarTheme: const AppBarTheme(
      // Background AppBar
      backgroundColor: Color(0xFFEEE7D7), // sedikit lebih gelap dari scaffold
      // Warna teks dan ikon di AppBar
      foregroundColor: Color(0xFF3B2A1A),
    ),
  );

  // ============================================================
  // 2. DARK THEME (tidak diubah)
  // ============================================================
  static ThemeData DarkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF38B2AC),
      brightness: Brightness.dark,
      surface: const Color(0xFF1E1E24),
      primary: const Color(0xFF38B2AC),
      secondary: const Color(0xFF2A2A32),
      onSurface: const Color(0xFFE2E8F0),
      error: const Color(0xFFEF4444),
      tertiary: const Color(0xFFFBBF24),
      onTertiary: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      foregroundColor: Colors.white,
    ),
  );
}
