# 🦊 CaelestiaSites

**Live, dynamic webpage theming for Firefox powered by Caelestia.**

CaelestiaSites brings your system-wide [Caelestia](https://github.com/dim-ghub/CaelestiaSites) colors directly into your browser. Unlike static CSS themes, CaelestiaSites injects your colors into every open tab in real-time. Change your wallpaper, and watch your browser colors update instantly without a page refresh.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Firefox](https://img.shields.io/badge/Firefox-Extension-orange.svg)

---

## ✨ Features

- **🚀 Real-Time Injection**: Updates colors instantly across all tabs as soon as Caelestia generates new colors.
- **🛡️ Crash-Proof & Lightweight**: Optimized with staggered updates and IPC filtering to ensure zero system lag, even with 100+ tabs open.
- **🎨 Site-Specific CSS**: Automatically applies custom CSS overrides for specific domains (e.g., GitHub, YouTube) using your Caelestia variables.
- **⚙️ Zero Configuration**: Paths are hardcoded for Caelestia — works out of the box.

---

## 🛠️ Installation

### 1. Prerequisites
- **Firefox**
- **Python 3**
- **Caelestia** (configured to output a CSS variables file)

### 2. Setup the Native Host
The Native Host is a small Python bridge that watches your files and talks to Firefox.

```bash
git clone https://github.com/dim-ghub/CaelestiaSites.git
cd CaelestiaSites
chmod +x setup.sh
./setup.sh
```

### 3. Install the Extension
Currently, you can load CaelestiaSites as a temporary extension:

1.  Open Firefox and go to `about:debugging`.
2.  Click **"This Firefox"** on the left.
3.  Click **"Load Temporary Add-on..."**.
4.  Select the `manifest.json` inside the `extension/` folder.

---

## ⚙️ Configuration

Configuration is no longer required — paths are hardcoded to Caelestia's defaults:

- **Template directory**: `~/.config/caelestia/templates`
- **Generated output**: `~/.local/state/caelestia/theme`

---

## 📂 Site-Specific Styles

To apply custom themes to specific websites, place `.css` files in your `websites` directory. 

Example: `github.css`
```css
@-moz-document domain("github.com") {
    body {
        background-color: var(--base) !important;
        color: var(--text) !important;
    }
}
```
*Note: CaelestiaSites will automatically detect the domain and apply the CSS using your Caelestia variables (e.g., `--base`, `--text`).*

---

## 🤝 Contributing

Contributions are welcome! If you have ideas for optimizations or new features, feel free to open an issue or a PR.

## 📄 License

MIT © [Ubaid](https://github.com/ubaid)
