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


### Tugas 8

1. **Perbedaan `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`, serta mekanisme navigasi aplikasi:**
   - **`Navigator.push()`:** Menambahkan (*push*) halaman baru ke puncak tumpukan navigasi (*navigation stack*) di atas halaman saat ini. Halaman sebelumnya tetap tersimpan di dalam memori tumpukan sehingga pengguna dapat kembali ke halaman sebelumnya menggunakan tombol kembali (*back*) atau `Navigator.pop()`. Metode inilah yang digunakan saat membuka formulir (`ProjectFormPage` maupun `ExperienceFormPage`) dari **kartu aksi** di halaman utama (`ItemCard`), sehingga tombol kembali bawaan perangkat/browser tetap tersedia untuk pulang ke beranda.
   - **`Navigator.pushReplacement()`:** Menggantikan (*replace*) rute halaman yang sedang aktif di puncak tumpukan dengan halaman baru, sehingga halaman sebelumnya dihapus dari riwayat tumpukan saat itu. Metode ini digunakan pada opsi navigasi di dalam `LeftDrawer` agar tumpukan halaman tidak menumpuk terus-menerus ketika pengguna berpindah-pindah menu lewat laci navigasi.
   - **`Navigator.pop()`:** Menghapus (*pop*) halaman paling atas dari tumpukan navigasi untuk kembali ke halaman tepat di bawahnya (atau menutup *overlay* seperti `AlertDialog`).
   - **Cara opsi `Home` di drawer kembali ke halaman utama:** Ketika pengguna menekan `ListTile` **Home** di `LeftDrawer`, aplikasi menjalankan `Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()))` yang menggantikan halaman formulir aktif dengan instance halaman utama `MyHomePage`, sehingga pengguna langsung kembali ke beranda tanpa menumpuk riwayat navigasi baru (sangat berguna saat diuji di Chrome).

2. **Peran `Scaffold`, `AppBar`, dan `Drawer` dalam menjaga konsistensi struktur halaman serta contoh penggunaan warna tema:**
   - **`Scaffold`** menyediakan kerangka tata letak standar Material Design pada setiap halaman (`MyHomePage`, `ProjectFormPage`, dan `ExperienceFormPage`) yang secara konsisten mengatur slot bagian atas (`appBar`), panel samping (`drawer`), dan area konten utama (`body`).
   - **`AppBar`** menjaga identitas judul halaman, warna latar, serta tombol ikon pembuka *drawer* di bagian atas setiap layar sehingga pengguna selalu memiliki orientasi navigasi yang seragam.
   - **`Drawer` (`LeftDrawer`)** diekstrak menjadi komponen widget modular yang dipasang pada properti `drawer` di seluruh halaman, memastikan daftar menu dan perilaku perpindahan halaman identik di mana pun pengguna berada.
   - **Contoh penggunaan warna tema di lebih dari satu halaman:** Warna `Colors.indigo` digunakan secara konsisten sebagai warna utama tema portofolio di berbagai halaman dan komponen—mulai dari *seed color* tema aplikasi pada `MaterialApp` di `main.dart`, latar belakang `AppBar` dan tombol `Save` di `ProjectFormPage` (`project_form.dart`), latar belakang `AppBar` dan tombol `Save` di `ExperienceFormPage` (`experience_form.dart`), hingga latar belakang `DrawerHeader` pada `LeftDrawer` (`left_drawer.dart`).

3. **Alasan pemilihan tata letak formulir serta peran widget pengatur jarak dan penggulir pada ruang layar terbatas:**
   - Tata letak formulir menggunakan susunan vertikal `Column` di dalam `SingleChildScrollView` agar alur pengisian data dari atas ke bawah (Posisi, Organisasi, Jenis Pengalaman, Tanggal Mulai/Selesai, Deskripsi, hingga tombol Simpan) mudah dipindai secara visual dan mengikuti pola standar formulir mobile.
   - **Widget penggulir (`SingleChildScrollView`):** Mencegah terjadinya error *RenderFlex overflow* (garis kuning-hitam) ketika layar berukuran sempit seperti ponsel atau ketika papan ketik virtual (*on-screen keyboard*) muncul dan memakan separuh tinggi layar. Pengguna tetap dapat menggulir halaman ke bawah untuk menjangkau kolom terakhir dan tombol `Save`.
   - **Widget pengatur jarak (`Padding` dan `SizedBox`):** Memberikan ruang napas (*whitespace*) antar-komponen input dan batas tepi layar sehingga tiap kolom tidak saling menempel, teks label/error terbaca jelas, dan area sentuh (*tap target*) pada tombol maupun *date picker* nyaman ditekan di layar kecil.

4. **Peran `GlobalKey<FormState>`, `validator`, dan `validate()` saat tombol Simpan ditekan, serta contoh input tertolak:**
   - **`GlobalKey<FormState>` (`_formKey`):** Bertindak sebagai pengenal unik (*handle*) untuk mengakses objek `FormState` dari widget `Form` secara langsung dari luar pohon widget (misalnya dari dalam *callback* `onPressed` tombol `Save`).
   - **`validator`:** Fungsi pemeriksaan aturan bisnis pada masing-masing `TextFormField` atau `FormField` yang menerima nilai input saat ini dan mengembalikan pesan `String` error jika melanggar aturan, atau `null` jika valid.
   - **`validate()`:** Method pada `_formKey.currentState` yang dipanggil saat tombol `Save` ditekan untuk mengeksekusi seluruh fungsi `validator` di dalam form secara serentak. Jika seluruh field mengembalikan `null`, `validate()` bernilai `true` dan `AlertDialog` ringkasan ditampilkan; jika ada minimal satu field yang tidak valid, `validate()` bernilai `false` dan pesan kesalahan langsung muncul di bawah kolom terkait.
   - **Contoh nilai yang ditolak dan mengapa tipe input/keyboard saja belum cukup:** Pada kolom *Posisi / Peran* maupun *Deskripsi Pengalaman*, nilai berupa string yang hanya berisi spasi kosong seperti `"   "` atau input terlalu pendek seperti `"IT"` (kurang dari 3 karakter) akan ditolak oleh `validator` menggunakan pengecekan `value.trim().isEmpty` dan `value.trim().length < 3`. Memilih tipe input teks atau tata letak papan ketik saja tidak cukup karena keyboard hanya membatasi karakter yang bisa diketik, bukan memastikan bahwa pengguna benar-benar mengisi field wajib, tidak sekadar menekan tombol spasi, atau mematuhi batasan panjang minimum dan urutan tanggal (`_endDate` tidak boleh sebelum `_startDate`).

#### AI Disclosure
- **Tools yang digunakan:** Gemini (LLM)
- **Strategi prompting:** Memecah pengerjaan secara bertahap per file (*experience_form.dart*, *menu.dart*, *project_card.dart*, dan *left_drawer.dart*) disertai pengecekan kode di setiap langkah.
- **Bagian Spesifik yang Dibantu AI:**
  1. **Pemahaman Navigasi, Form, & Validasi Flutter:** Membantu menjelaskan konsep perpindahan halaman (`Navigator.push` vs `Navigator.pushReplacement`), pengelolaan state formulir dengan `GlobalKey<FormState>`, serta pembuatan validasi input dan `showDatePicker`.
  2. **Verifikasi Struktur Proyek:** Memastikan pemisahan file ke dalam folder `lib/screens/` dan `lib/widgets/`, kesesuaian navigasi dari kartu aksi maupun drawer, serta pengecekan kualitas kode menggunakan `flutter analyze` berjalan tanpa isu.
- **Verifikasi Manual:** Melakukan commit bertahap per file, menguji langsung seluruh alur navigasi, validasi input kosong/spasi, dan dialog ringkasan di Chrome sebelum push ke GitHub.