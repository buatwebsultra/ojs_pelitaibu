# Panduan Deployment OJS ke Hostinger

Berikut adalah langkah-langkah untuk memindahkan OJS dari localhost (XAMPP) ke akun Hostinger Anda dengan domain `ojs.pelitaibu.ac.id`.

## 1. Persiapan File & Database di Local

### A. Kompres File OJS
1. Masuk ke folder `c:\xampp\htdocs\ojs`.
2. Pilih semua file (Ctrl+A), klik kanan, dan pilih **Compress to ZIP file**. Beri nama `ojs_files.zip`.
   > [!IMPORTANT]
   > Pastikan file `.htaccess` juga ikut terkompres jika ada.

### B. Kompres ojsdata
1. Masuk ke folder `D:\PROJECT\ojs_pelitaibu\ojsdata`.
2. Kompres seluruh isinya menjadi `ojsdata.zip`.

### C. Export Database
1. Buka [http://localhost/phpmyadmin](http://localhost/phpmyadmin).
2. Pilih database `db_ojs2026`.
3. Klik menu **Export** dan simpan file `.sql` (contoh: `backup_db.sql`).

---

## 2. Pengaturan di Hostinger hPanel

### A. Buat Subdomain
- Masuk ke dashboard Hostinger.
- Cari menu **Subdomains**.
- Tambahkan `ojs` untuk domain `pelitaibu.ac.id`.

### B. Buat Database MySQL
- Cari menu **MySQL Databases**.
- Buat database baru (catat Nama Database, Username, dan Password).

### C. Buat Folder ojsdata
- Masuk ke **File Manager**.
- Buat folder baru bernama `ojsdata` **di luar** dari folder `public_html` (demi keamanan).
   - Contoh path: `/home/u123456789/ojsdata`

---

## 3. Upload & Import

### A. Upload File
- Upload `ojs_files.zip` ke dalam folder subdomain (biasanya di `public_html/ojs`).
- **Extract** file tersebut di sana.
- Upload `ojsdata.zip` ke folder `ojsdata` yang baru dibuat di luar `public_html`, lalu **Extract**.

### B. Import Database
- Buka **phpMyAdmin** di Hostinger untuk database baru Anda.
- Klik **Import** dan pilih file `backup_db.sql` dari komputer Anda.

---

## 4. Konfigurasi `config.inc.php`

Gunakan File Manager Hostinger untuk mengedit file `config.inc.php` di folder OJS:

```php
; Update Database
driver = mysqli
host = localhost
username = [User_Database_Hostinger]
password = [Password_Database_Hostinger]
name = [Nama_Database_Hostinger]

; Update URLs
base_url = "https://ojs.pelitaibu.ac.id"

; Update Directory Path
files_dir = "/home/u123456789/ojsdata"
```

---

## 5. Langkah Terakhir (Penting!)

1. **Check Permissions**: Pastikan folder `cache/`, `public/`, dan `ojsdata/` memiliki akses tulis (*writeable*). Di Hostinger, biasanya cukup dengan permission `755`.
2. **PHP Version**: Pastikan versi PHP di Hostinger sama atau lebih tinggi dari XAMPP Anda (minimal PHP 8.1 direkomendasikan).
3. **Clear Cache**: Jika website error, coba hapus file di dalam folder `cache/*.php` (jangan hapus folder `.htaccess` atau `.gitkeep` jika ada).
4. **SSL**: Pastikan SSL sudah aktif di Hostinger agar URL `https://` bekerja dengan baik.

---

Selamat Mencoba! Jika ada error spesifik saat proses upload, beri tahu saya ya.
