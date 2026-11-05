import 'package:sqflite/sqflite.dart';

class SeedNotes {
  static Future<void> run(Database db) async {
    final now = DateTime.now().millisecondsSinceEpoch;

    final initialNotes = <Map<String, dynamic>>[
      {
        'title': 'Panduan Lengkap Arsitektur Software Modern',
        'body':
            'Pengembangan perangkat lunak modern menuntut skalabilitas, maintainability, dan performa tinggi yang konsisten di berbagai platform. Dalam membangun sebuah aplikasi, baik itu mobile, web, maupun desktop, fondasi arsitektur adalah kunci utama penentu keberhasilan jangka panjang.\n\n'
            '1. Pemisahan Tanggung Jawab (Separation of Concerns)\n'
            'Prinsip ini memastikan bahwa kode dibagi menjadi beberapa lapisan logis: UI (tampilan), Business Logic (logika bisnis), dan Data Layer (penyimpanan/database). Dengan pemisahan yang ketat, ketika terjadi perubahan pada desain antarmuka, pengembang tidak perlu merombak logika database di belakang layar.\n\n'
            '2. Manajemen State di Flutter\n'
            'Di ekosistem Flutter, pemilihan state management seperti Bloc, Riverpod, atau Provider sangat memengaruhi bagaimana data mengalir ke widget. Untuk aplikasi skala besar, pendekatan reaktif sangat direkomendasikan agar UI selalu sinkron secara otomatis dengan perubahan data di state.\n\n'
            '3. Pengelolaan Database Lokal\n'
            'Penggunaan SQLite melalui sqflite atau Room memberikan keandalan tinggi dalam menyimpan data terstruktur secara loka. Dikombinasikan dengan pola Singleton pada Database Core, koneksi aplikasi akan tetap aman, terhindar dari kebocoran memori, serta siap mendukung fitur-fitur kompleks seperti sinkronisasi awan, ekspor/impor data JSON, hingga fitur pencarian teks kilat (full-text search).',
        'is_archived': 0,
        'is_deleted': 0,
        'created_at': now,
        'updated_at': now,
      },
      {
        'title': 'Catatan Perjalanan & Eksplorasi Alam Bebas',
        'body':
            'Hari ini fajar menyingsing dengan sangat indah di balik pegunungan. Udara pagi terasa begitu dingin menusuk tulang, namun semangat petualangan mengalahkan segalanya. Kami bersiap sejak pukul 04.30 pagi, memeriksa kembali seluruh perlengkapan pendakian mulai dari carrier, logistik makanan, air minum, tenda, hingga perangkat navigasi GPS.\n\n'
            'Perjalanan dimulai melalui jalur setapak berbatu yang dikelilingi oleh hutan tropis lebat. Suara serangga hutan dan kicauan burung menyambut langkah demi langkah kami mendaki bukit. Tantangan terbesar hari ini adalah jalur tanjakan curam dengan kemiringan hampir 45 derajat serta kondisi tanah yang agak licin akibat sisa embun pagi.\n\n'
            'Setibanya di pos bayangan kedua, kami beristirahat sejenak untuk mengisi ulang energi. Menu sarapan sederhana berupa roti bakar dan segelas kopi hangat di tengah alam terbuka memberikan sensasi ketenangan yang luar biasa—jauh dari kebisingan kota, polusi, dan keramaian rutinitas pekerjaan sehari-hari. Pengalaman ini mengingatkan kita akan pentingnya menjaga kelestarian alam dan lingkungan sekitar agar keindahannya tetap dapat dinikmati oleh generasi mendatang.',
        'is_archived': 0,
        'is_deleted': 0,
        'created_at': now - 86400000,
        'updated_at': now - 86400000,
      },
      {
        'title': 'Daftar Rencana Belanja Bulanan & Keperluan Dapur',
        'body':
            'Berikut adalah rekapitulasi daftar barang dan bahan makanan yang harus segera dibeli untuk memenuhi kebutuhan dapur selama satu bulan ke depan:\n\n'
            '- Sembako Utama:\n'
            '  * Beras premium kualitas super (5 kg)\n'
            '  * Minyak goreng kemasan jerigen (2 liter)\n'
            '  * Gula pasir putih murni (1 kg)\n'
            '  * Tepung terigu protein sedang (1 kg)\n\n'
            '- Bumbu Dapur & Rempah:\n'
            '  * Bawang merah dan bawang putih segar\n'
            '  * Cabai merah keriting dan cabai rawit hijau\n'
            '  * Garam halus beriodium serta merica bubuk\n'
            '  * Kecap manis dan saus tiram merek pilihan\n'
            '  * Aneka bumbu instan siap saji untuk cadangan saat darurat\n\n'
            '- Bahan Segar (Dibeli mendadak):\n'
            '  * Telur ayam negeri (1 rak / 30 butir)\n'
            '  * Daging sapi segar pilihan dan fillet dada ayam\n'
            '  * Sayuran hijau (bayam, kangkung, brokoli, dan wortel)\n'
            '  * Buah-buahan segar (pisang, apel, dan jeruk lokal)\n\n'
            'Pastikan untuk memeriksa kembali kupon diskon atau promo mingguan di supermarket terdekat sebelum melakukan pembayaran agar pengeluaran tetap efisien dan sesuai dengan anggaran bulanan yang telah direncanakan.',
        'is_archived': 1,
        'is_deleted': 0,
        'created_at': now - 172800000,
        'updated_at': now - 172800000,
      },
    ];

    for (final note in initialNotes) {
      await db.insert('notes', note);
    }
  }
}
