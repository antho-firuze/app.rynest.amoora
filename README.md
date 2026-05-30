# Amoora Mobile Apps

[![Flutter Version](https://img.shields.io/badge/Flutter-v3.x-blue.svg)](https://flutter.dev)
[![Platform](https://img.shields.io/badge/Platform-Android%20|%20iOS-green.svg)](#)

Amoora adalah aplikasi mobile resmi untuk **PT. Amoora Digital Travel** yang dirancang khusus untuk memfasilitasi perjalanan Haji dan Umrah. Aplikasi ini membantu jemaah dalam memantau jadwal, panduan ibadah, manajemen dokumen, serta koordinasi selama di tanah suci.

Unduh aplikasi resmi di [Google Play Store](https://play.google.com/store/apps/details?id=com.rynest.amoora).

---

## 🚀 Fitur Utama

*   **Manajemen Manasik & Panduan Ibadah:** Akses doa-doa, tata cara Haji/Umrah, dan panduan lengkap secara offline.
*   **Informasi Paket & Jadwal:** Pantau detail keberangkatan, hotel, transportasi, dan itinerary perjalanan secara real-time.
*   **Sistem Notifikasi Pintar:** Pengingat jadwal kegiatan, titik kumpul, dan pengumuman penting dari mutawwif/pembimbing.
*   **Keamanan Data & Multi-environment:** Mendukung konfigurasi lingkungan makro menggunakan variabel `.env`.

---

## 🛠️ Spesifikasi Teknologi

Proyek ini dibangun menggunakan **Flutter SDK** dengan dukungan multi-platform:
*   **Dart** (Bahasa Pemrograman Utama)
*   **Android** & **iOS** (Target Platform Utama)
*   *Dukungan platform lain (Windows, macOS, Linux, Web) tersedia untuk pengembangan internal.*

---

## 📦 Struktur Proyek

```text
app.rynest.amoora/
├── android/          # Konfigurasi native Android
├── ios/              # Konfigurasi native iOS
├── lib/              # Kode sumber utama Dart (Arsitektur aplikasi)
├── assets/           # Gambar, font, dan berkas lokalisasi (i18n)
├── assets_for_store/ # Aset grafis untuk keperluan publikasi toko aplikasi
├── .env.example      # Template untuk konfigurasi environment variable
└── pubspec.yaml      # Manajemen dependensi Flutter

```

---

## 🏁 Memulai Pengembangan

### Prasyarat

Sebelum memulai, pastikan Anda telah memasang dokumen berikut di mesin lokal Anda:

* [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi stabil terbaru disarankan)
* Android Studio / Xcode (untuk menjalankan emulator)
* VS Code / Android Studio sebagai Code Editor

### Langkah Instalasi

1. **Kloning Repositori**

```bash
   git clone [https://github.com/antho-firuze/app.rynest.amoora.git](https://github.com/antho-firuze/app.rynest.amoora.git)
   cd app.rynest.amoora

```

2. **Konfigurasi Environment**
Salin berkas `.env.example` menjadi `.env` dan sesuaikan nilainya dengan konfigurasi API atau server lokal Anda:

```bash
   cp .env.example .env

```

3. **Ambil Dependensi**
Jalankan perintah berikut untuk mengunduh package yang dibutuhkan:

```bash
   flutter pub get

```

4. **Jalankan Aplikasi**
Pastikan emulator atau perangkat fisik Anda sudah terhubung, lalu jalankan:

```bash
   flutter run

```

---

## 🔧 Pemeliharaan & Kontribusi

Jika Anda ingin melakukan perbaikan bug atau menambahkan fitur baru, silakan ikuti alur berikut:

1. Buat *Branch* baru dari `main` (`git checkout -b feature/FiturBaru`).
2. Lakukan perubahan kode dan pastikan kepatuhan terhadap analisis kode dengan menjalankan `flutter analyze`.
3. Lakukan *Commit* dengan pesan yang jelas (`git commit -m 'Menambahkan fitur X'`).
4. *Push* ke *Branch* Anda (`git push origin feature/FiturBaru`).
5. Buat *Pull Request*.

---

## 📄 Lisensi

Hak Cipta © 2026 PT. Amoora Digital Travel & Rynest Technology. Seluruh hak cipta dilindungi undang-undang. Pengembangan internal dipantau oleh [@antho-firuze](https://github.com/antho-firuze).

```

---

### 💡 Tips Tambahan:
*   Anda bisa langsung menyalin (*copy-paste*) kode Markdown di atas ke dalam file `README.md` di repositori lokal Anda.
*   Jangan lupa untuk mengisi berkas `.env` asli berdasarkan variabel yang ada di `.env.example` milik Anda setelah melakukan klon.

```