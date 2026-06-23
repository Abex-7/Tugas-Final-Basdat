#!/bin/bash
# ============================================================
#  SCRIPT PUSH GITHUB - TUGAS WEB FINAL
#  Pembagian Kontribusi Tim: 5 Orang (1 Ketua, 4 Anggota)
# ============================================================

# ============================================================
# KONFIGURASI - EDIT BAGIAN INI (ISI DENGAN DATA ASLI GITHUB)
# ============================================================

REPO_URL="https://github.com/Abex-7/Tugas-Final-Basdat.git"

KETUA_NAMA="Abex-7"
KETUA_EMAIL="muhammadabiyyudakhilullah@gmail.com"

ANGGOTA1_NAMA="nikennnrf"
ANGGOTA1_EMAIL="nikennurfaizah792@gmail.com"

ANGGOTA2_NAMA=" gitafadila2605"
ANGGOTA2_EMAIL="gitafadila2605@gmail.com"

ANGGOTA3_NAMA="Rennn77"
ANGGOTA3_EMAIL="rendinovian031@gmail.com"

ANGGOTA4_NAMA="shoniaaaa"
ANGGOTA4_EMAIL="shoniaardhy@gmail.com"

# ============================================================
# SCRIPT - JANGAN DIUBAH DI BAWAH INI
# ============================================================

echo "======================================================"
echo "  BIOSKOP SYSTEM MANAGEMENT - GIT PUSH SCRIPT (5 ORANG)"
echo "======================================================"
echo ""

# ============================================================
# INIT & SETUP
# ============================================================
echo "[1/6] Inisialisasi Git..."
git init
git remote remove origin 2>/dev/null
git remote add origin $REPO_URL
echo "Remote ditambahkan: $REPO_URL"
echo ""

# Membuat .gitignore
cat > .gitignore << 'EOF'
node_modules/
.env
.DS_Store
EOF
echo ".gitignore dibuat!"
echo ""

# ============================================================
# KETUA - Inisialisasi Project & Konfigurasi Package
# ============================================================
echo "[2/6] KETUA: Push setup awal dan package..."
git config user.name "$KETUA_NAMA"
git config user.email "$KETUA_EMAIL"

git checkout -b main 2>/dev/null || git checkout main

git add .gitignore
git add package.json 2>/dev/null
git add package-lock.json 2>/dev/null

git commit -m "feat: initial project setup

- Inisialisasi repository dan .gitignore
- Setup package.json dan dependensi project"

echo "✓ Ketua selesai commit!"
echo ""

# ============================================================
# ANGGOTA 1 - Setup Server (Backend)
# ============================================================
echo "[3/6] ANGGOTA 1: Push file Server..."
git config user.name "$ANGGOTA1_NAMA"
git config user.email "$ANGGOTA1_EMAIL"

git checkout -b feature/server

git add server.js 2>/dev/null

git commit -m "feat: implementasi server utama

- Setup Express.js di server.js
- Konfigurasi port dan routing dasar"

echo "✓ Anggota 1 selesai commit!"
echo ""

# ============================================================
# ANGGOTA 2 - Database Schema
# ============================================================
echo "[4/6] ANGGOTA 2: Push Schema Database..."
git config user.name "$ANGGOTA2_NAMA"
git config user.email "$ANGGOTA2_EMAIL"

git checkout main
git checkout -b feature/database

git add schema.sql 2>/dev/null

git commit -m "feat: implementasi struktur database

- Membuat DDL tabel di schema.sql
- Mendefinisikan relasi antar entitas"

echo "✓ Anggota 2 selesai commit!"
echo ""

# ============================================================
# ANGGOTA 3 - Environment & Dokumentasi
# ============================================================
echo "[5/6] ANGGOTA 3: Push Environment Configuration..."
git config user.name "$ANGGOTA3_NAMA"
git config user.email "$ANGGOTA3_EMAIL"

git checkout main
git checkout -b feature/config

git add .env.example 2>/dev/null
# Membuat README.md otomatis agar ada file tambahan untuk dicommit
cat > README.md << 'EOF'
# Tugas Web Final
Project manajemen website lokal untuk tugas akhir.
EOF
git add README.md 2>/dev/null

git commit -m "chore: setup environment dan dokumentasi

- Menambahkan template .env.example
- Membuat README.md untuk panduan project"

echo "✓ Anggota 3 selesai commit!"
echo ""

# ============================================================
# ANGGOTA 4 - Frontend (UI/UX)
# ============================================================
echo "[6/6] ANGGOTA 4: Push folder Public/Frontend..."
git config user.name "$ANGGOTA4_NAMA"
git config user.email "$ANGGOTA4_EMAIL"

git checkout main
git checkout -b feature/frontend

git add public/ 2>/dev/null

git commit -m "feat: implementasi antarmuka klien

- Menambahkan struktur folder public
- Setup file static HTML/CSS/JS klien"

echo "✓ Anggota 4 selesai commit!"
echo ""

# ============================================================
# PUSH SEMUA KE GITHUB
# ============================================================
echo "======================================================"
echo "  PUSH KE GITHUB..."
echo "======================================================"
echo ""
echo "Memasukkan semua sisa file yang belum di-track ke main..."
git checkout main
git add -A
git diff --cached --quiet || git commit -m "chore: penyesuaian file final"

echo ""
echo "Push branch main (Ketua)..."
git push -u origin main

echo ""
echo "Push branch feature/server (Anggota 1)..."
git push origin feature/server

echo ""
echo "Push branch feature/database (Anggota 2)..."
git push origin feature/database

echo ""
echo "Push branch feature/config (Anggota 3)..."
git push origin feature/config

echo ""
echo "Push branch feature/frontend (Anggota 4)..."
git push origin feature/frontend

echo ""
echo "======================================================"
echo "  SELESAI! Semua branch sudah di-push ke GitHub"
echo "======================================================"
echo "Langkah selanjutnya di GitHub:"
echo "1. Buka halaman repository"
echo "2. Klik 'Compare & pull request' untuk tiap branch"
echo "3. Merge branch: server, database, config, dan frontend ke main"