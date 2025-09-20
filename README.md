# budget_app_frontend

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
---

# 🚀 Flutter Installation & Setup Guide (Windows)

This guide explains how to install **Flutter** on Windows machines that don’t already have **Android Studio, Android SDK, or Flutter**.
It also documents common errors and their solutions.

---

## 📌 1. Install Prerequisites

* **Git for Windows** → [Download here](https://git-scm.com/download/win)
* **PowerShell or Git Bash** (already included in Windows 10+)

---

## 📌 2. Install Flutter Globally

### Step 1: Choose an install directory

It’s recommended to use a short path to avoid Windows path length issues:

```powershell
cd C:\
mkdir src
cd src
```

### Step 2: Enable long paths in Git

Flutter has some very long filenames, so enable long path support:

```bash
git config --system core.longpaths true
```

### Step 3: Clone Flutter (stable channel)

```bash
git clone https://github.com/flutter/flutter.git -b stable
```

---

## 📌 3. Add Flutter to PATH

### Temporary (current session only)

```bash
export PATH="$PATH:/c/src/flutter/bin"
```

### Permanent (recommended)

1. Press **Start** → search for **Environment Variables**.
2. Click **Environment Variables**.
3. Under **System Variables**, edit **Path**.
4. Add:

```
C:\src\flutter\bin
```

### Verify

```bash
flutter doctor
```

## 🟢 1. Create a New Flutter Project

In your terminal (PowerShell, Command Prompt, or Git Bash), run:

```bash
flutter create my_new_app
```

* Replace `my_new_app` with your project name (lowercase, no spaces).
* Flutter will generate the folder structure with `lib/`, `pubspec.yaml`, etc.

---

## 🟢 2. Open the Project in VS Code (or Android Studio)

### If you use **VS Code**:

1. Open VS Code.
2. Go to **File → Open Folder…**
3. Select the `my_new_app` folder you just created.
4. You’ll see the `lib/main.dart` file — that’s the entry point of your Flutter app.

👉 Pro tip: If you are already in the terminal inside your project folder, you can run:

```bash
code .
```

(Only works if you installed the “Code” command for VS Code.)

---

### If you use **Android Studio**:

1. Open Android Studio.
2. Click **Open an Existing Project**.
3. Navigate to `my_new_app` folder → select it.
4. Android Studio will load it as a Flutter project.

---

## 🟢 3. Run the New Project

From the terminal inside the project folder, run:

```bash
flutter run
```

Or press ▶ **Run** in VS Code/Android Studio.

* If you have an **emulator** (Android or iOS) or a real device connected, the app will launch.

```


---

✅ That’s it! You’ve created, opened, and run a new Flutter project.



## 📌 4. Common Errors & Fixes

### ❌ Error: *Filename too long*

```
fatal: unable to checkout working tree
Filename too long
```

✅ **Fix:** Run before cloning:

```bash
git config --system core.longpaths true
```

---

### ❌ Error: *destination path 'flutter' already exists*

```
fatal: destination path 'flutter' already exists and is not an empty directory.
```

✅ **Fix:** Either delete the existing folder:

```bash
rm -rf flutter
```

or clone into another folder:

```bash
git clone https://github.com/flutter/flutter.git -b stable flutter_sdk
```

---

### ❌ Error: *bash: flutter: command not found*

✅ **Fix:** Add Flutter to your PATH (see step 3 above).

---

### ❌ Error: *Android toolchain - cmdline-tools component is missing*

✅ **Fix:**

1. Open **Android Studio → More Actions → SDK Manager**.
2. Go to **SDK Tools** tab.
3. Install:

   * ✅ Android SDK Command-line Tools (latest)
   * ✅ Android SDK Platform-Tools
   * ✅ Android SDK Build-Tools
4. Add these paths to **System PATH**:

```
C:\Users\<YourUsername>\AppData\Local\Android\Sdk\platform-tools
C:\Users\<YourUsername>\AppData\Local\Android\Sdk\cmdline-tools\latest\bin
```

---

### ❌ Error: *Some Android licenses not accepted*

✅ **Fix:**

```bash
flutter doctor --android-licenses
```

Press **`y` + Enter** to accept each license.

---

### ❌ Error: *Visual Studio not installed*

This only matters if you want to build **Windows desktop apps**.
If you’re only targeting **Android / Web**, you can disable the Windows desktop requirement:

```bash
flutter config --no-enable-windows-desktop
```

---

## 📌 5. Android Emulator Setup (Optional but Recommended)

### Step 1: Open AVD Manager

1. Launch **Android Studio**.
2. On the **Welcome Screen**, click **More Actions → Virtual Device Manager**.
   (If you’re inside a project: go to **Tools → Device Manager**.)

---

### Step 2: Create a Virtual Device

1. Click **Create Device**.
2. Pick a hardware profile (e.g., **Pixel 6**).
3. Select a **System Image** (e.g., Android 14 or latest stable).

   * If none available, click **Download** next to one.
4. Finish the wizard.

---

### Step 3: Start Emulator

* In Device Manager, click the **Play button ▶️** next to your virtual device.
* The emulator will boot up like a real phone.

---

### Step 4: Verify Flutter detects it

Run:

```bash
flutter devices
```

You should see something like:

```
emulator-5554 • Pixel_6_API_34 • android-arm64 • Android 14 (API 34) (emulator)
```

---

### Step 5: Run your Flutter app on emulator

```bash
flutter run
```

Your app will launch on the emulator. 🚀

---

## 📌 6. Final Verification

Run:

```bash
flutter doctor
```

Expected output (for Android + Web dev only):

```
[√] Flutter
[√] Windows Version
[√] Android toolchain - develop for Android devices
[√] Chrome - develop for the web
[√] Android Studio
[√] VS Code
[√] Connected device
[√] Network resources
```

---

## ✅ You’re Ready!

* Use VS Code or Android Studio to open projects.
* Run a new project:

```bash
flutter create my_app
cd my_app
flutter run
```

---

⚡ This guide ensures that Flutter, Android SDK, Android Studio, and Emulator are fully configured for frontend development without desktop dependencies.

---
**line endings** in the files (`LF` used in Linux/macOS vs `CRLF` in Windows) will be converted the next time Git saves them. This happens a lot when developing Flutter apps on Windows but syncing with cross-platform repos.

Here are your options:

---

### ✅ 1. Ignore the warnings (safe option)

You can safely ignore them, especially since Flutter auto-generates those files anyway (`generated_plugin_registrant.*`). They don’t break your project.

---

### ✅ 2. Configure Git to avoid future warnings

If you don’t want to see them:

```bash
# Use LF for all text files
git config --global core.autocrlf input

# OR, use Windows style (CRLF) but auto-fix when committing
git config --global core.autocrlf true

```

Commit it so your team/devices always use the same rules.

---

