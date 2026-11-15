# myportofolio_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
---

Nama : Muhammad Fachri Novelino

NPM : 2506618881

Kelas : PBP D

---

### Tugas 7
1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!
Widget tree adalah struktur hierarki (mirip pohon terbalik) yang menyusun komponen-komponen antarmuka (UI) di Flutter. Konsep ini mirip dengan hierarki DOM pada HTML di web, di mana setiap elemen saling bertumpuk. Dalam Flutter, hubungan parent-child (induk-anak) terjadi ketika sebuah widget (parent) membungkus atau menampung widget lain di dalamnya (child/children). Contohnya: widget Scaffold (parent) membungkus AppBar dan body (child). Widget tata letak seperti Column juga bertindak sebagai parent yang bisa menampung banyak children sekaligus, seperti kumpulan teks dan tombol.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!
- **MaterialApp**: Root widget yang membungkus seluruh aplikasi dan menyediakan konfigurasi tema Material Design serta sistem navigasi.
- **Scaffold**: Menyediakan kerangka dasar halaman antarmuka (UI) yang menampung elemen struktural seperti AppBar, body, dan floatingActionButton.
- **AppBar**: Menampilkan bilah navigasi di bagian atas layar aplikasi untuk judul atau menu.
- **Text**: Widget untuk menampilkan tulisan atau string teks di layar dengan berbagai kustomisasi gaya (style).
- **Padding**: Memberikan jarak ruang kosong (margin dalam) di sekeliling widget anaknya (child).
- **Column**: Widget tata letak (layout) untuk menyusun beberapa widget anaknya (children) secara vertikal (dari atas ke bawah).
- **Row**: Widget tata letak untuk menyusun widget anaknya secara horizontal (menyamping dari kiri ke kanan).
- **Center**: Menempatkan widget anaknya agar posisinya berada tepat di tengah area yang tersedia.
- **SizedBox**: Membuat kotak berukuran tertentu; sering digunakan untuk memberikan jarak kosong (spasi) antar-widget.
- **GridView**: Menampilkan elemen-elemen anaknya dalam bentuk grid atau susunan kotak-kotak tabel berkolom.
- **Card**: Menampilkan antarmuka berbentuk kartu bergaya Material dengan efek bayangan (elevasi).
- **Container**: Wadah serbaguna yang bisa digunakan untuk mengatur ukuran, padding, margin, dan latar belakang widget di dalamnya.
- **Material**: Komponen dasar material design, dalam proyek ini digunakan untuk memberikan warna latar belakang khusus (background color) pada kartu tombol.
- **InkWell**: Membuat area berbentuk kotak transparan yang responsif terhadap sentuhan/klik, dan memberikan efek visual gelombang air (ripple effect).
- **Icon**: Menampilkan gambar ikon atau simbol bawaan (seperti folder, add_circle, logout).
- **SnackBar**: Menampilkan pesan pop-up notifikasi sementara di bagian bawah layar ketika pengguna menekan tombol.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!
Fungsi utama widget MaterialApp adalah sebagai pembungkus aplikasi yang menyediakan standar antarmuka Material Design. Widget ini umumnya digunakan sebagai root widget (komponen paling awal/luar) karena memiliki peran secara global untuk mengatur keseluruhan aplikasi, seperti mengatur tema warna, routing (navigasi antar halaman), serta arah teks dan lokalisasi bahasa.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?
- StatelessWidget: Merupakan widget yang sifatnya statis. Tampilan dan datanya tidak akan berubah setelah pertama kali dibangun (dirender). Kita sebaiknya menggunakan widget ini untuk komponen yang berisi data tetap, seperti teks informasi identitas pengguna, logo, atau halaman menu yang tidak memerlukan pembaruan.
- StatefulWidget: Merupakan widget yang sifatnya dinamis. Tampilan dan kondisinya (state) bisa kita ubah-ubah atau diperbarui seiring berjalannya aplikasi. Kita harus menggunakan widget ini ketika ingin membuat antarmuka yang interaktif dan datanya bisa berubah ke depannya, seperti tombol counter angka, checkbox, atau form isian data.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?
- BuildContext adalah sebuah referensi yang berfungsi untuk melacak posisi atau lokasi suatu widget di dalam struktur hierarki aplikasi (widget tree). Penggunaannya di dalam metode build sangat penting agar widget tersebut mengenali lingkungannya (induknya), misalnya ketika kita perlu memanggil tema warna global atau memunculkan notifikasi (SnackBar) agar sistem tahu di posisi layar mana aksi tersebut harus dieksekusi.

6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?
- Hot Reload: Fitur untuk memperbarui perubahan kode ke dalam aplikasi yang sedang berjalan secara instan. Hot reload mempertahankan state (kondisi data) saat ini, sehingga aplikasi tidak kembali ke kondisi awal (misalnya, angka pada widget counter tidak ter-reset).
- Hot Restart: Memulai ulang aplikasi secara penuh. Berbeda dengan hot reload, proses ini menghapus dan mereset semua state ke kondisi awal seperti saat aplikasi baru dibuka. Waktu muatnya sedikit lebih lama dibandingkan hot reload.
- Kapan tidak bisa mengandalkan Hot Reload? Kita wajib melakukan hot restart atau full restart apabila melakukan perubahan yang fundamental, seperti: menambahkan dependensi/package baru di pubspec.yaml, mengubah file konfigurasi bawaan OS (seperti AndroidManifest.xml atau struktur folder android/ios), serta ketika merombak secara besar-besaran struktur variabel statis atau logika state.

Deklarasi Penggunaan AI: Dalam pengerjaan Tugas 7 ini, saya menggunakan Gemini sebagai alat bantu. Secara keseluruhan, AI sangat membantu dalam memahami konsep dasar arsitektur Flutter, menyusun format dokumentasi, serta memastikan kelancaran alur unggah kode ke GitHub.

Bagian Spesifik yang Dibantu AI:

1. Pemahaman Konsep Fundamental Flutter: Membantu menjelaskan dan memberikan analogi (seperti analogi koordinat lokasi) untuk mempermudah pemahaman mengenai widget tree, MaterialApp, BuildContext, serta perbedaan antara StatelessWidget dan StatefulWidget, dan konsep hot reload vs hot restart.
2. Verifikasi Struktur Proyek: Memastikan bahwa proses pemisahan file menu.dart dan main.dart, serta pengecekan kualitas kode menggunakan flutter analyze telah berjalan sesuai dengan instruksi modul.