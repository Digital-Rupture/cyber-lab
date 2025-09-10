# 🔨 Password Cracking with John the Ripper

This lab demonstrates the difference between *weak* and *strong* passwords by using John the Ripper with common wordlists. It shows how weak choices can be cracked quickly, while strong random ones resist attack.

---

### 📦 Installation
**Ubuntu / Debian / WSL** 
```bash
sudo apt update
sudo apt install john seclists -y
```
  * John will be installed system-wide.
  * RockYou wordlist is available at:
```bash
/usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt
```
**Kali Linux**
  * John is already preinstalled.
  * RockYou wordlist is located at:
```bash  
/usr/share/wordlists/rockyou.txt.gz
```
Decompress it with:
```bash
sudo gzip -d /usr/share/wordlists/rockyou.txt.gz
```
### 💡 If you can’t find RockYou, you can download it manually:
```bash
sudo mkdir -p /usr/share/wordlists
cd /usr/share/wordlists
sudo wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
```
---

### 📝 Create Test Hashes
We’ll create a file (`hashes.txt`) with three weak passwords and one strong password hashed with **SHA-512 crypt**:
```bash
# Weak examples
echo "password"      | openssl passwd -6 -stdin >  hashes.txt
echo "Password123"   | openssl passwd -6 -stdin >> hashes.txt
echo "Summer2024!"   | openssl passwd -6 -stdin >> hashes.txt

# Strong random example
echo "N6!aWq$7Bz%1Yt" | openssl passwd -6 -stdin >> hashes.txt
```
Each line in `hashes.txt` will start with `$6$`, which indicates SHA-512 crypt.

---

### 🔑 Cracking with John
Run John against the hashes using the RockYou wordlist.

**Ubuntu / Debian / WSL**
```bash
john --wordlist=/usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt hashes.txt
```
**Kali Linux**
```bash
john --wordlist=/usr/share/wordlists/rockyou.txt hashes.txt
```
**Check which passwords cracked**:
```bash
john --show hashes.txt
```

---

### ⚙️ Troubleshooting
- Error: **“Unknown ciphertext format name requested”**
    * Your hash file may not be SHA-512. Verify it starts with `$6$`.
    * Try running John without `--format` so it auto-detects:
```bash
john --wordlist=/path/to/rockyou.txt hashes.txt
```
- Error: **“No such file or directory”** for rockyou.txt
    * Ubuntu/WSL → RockYou is at `/usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt`.
    * Kali → decompress it from `/usr/share/wordlists/rockyou.txt.gz`.
    * Or download manually to `/usr/share/wordlists/rockyou.txt`.
- Nothing cracks
  * That’s expected for strong, random passwords.
  * Weak/common ones (`password`, `Password123`) should fall quickly with RockYou.
