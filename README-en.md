# Hiddify Yumash Edition

<p align="center">
  <img src="assets/images/logo.svg" width="128" height="128" alt="Hiddify Logo">
</p>

<p align="center">
  <b>Lightweight VPN client for Windows</b><br>
  Fork of <a href="https://github.com/hiddify/hiddify-app">Hiddify</a> focused on Russian users
</p>

<p align="center">
  English | <a href="README.md">Русский</a>
</p>

---

## What is Hiddify?

[Hiddify](https://github.com/hiddify/hiddify-app) is a multi-platform proxy client based on [sing-box](https://github.com/SagerNet/sing-box). Ad-free and open-source application.

**Main features of original Hiddify:**

- Protocol support: VLESS, VMess, Reality, TUIC, Hysteria, Hysteria2, WireGuard, Trojan, Shadowsocks, SSH, etc.
- Subscription formats: Sing-box, V2ray, Clash, Clash Meta
- Direct link support: `vless://`, `vmess://`, `trojan://`, `ss://`, `hy2://`, `tuic://`, etc.
- Automatic best server selection by latency
- Auto-update subscriptions
- Profile info display (remaining traffic, days)
- Compatible with any proxy management panels
- Dark and light themes

**Yumash Edition** is a lightweight Windows-only version tailored for Russian users with additional features.

---

## What's changed in Yumash Edition

### Added

| Feature | Description |
|---------|-------------|
| **VPN mode only** | True VPN via TUN interface, works with ALL apps. Proxy modes removed |
| **Custom rule-set URLs** | In original, site bypass and ad blocking were hidden. Now you can specify custom URLs for rule-set files (.srs) with URL validation |
| **Filter caching** | All rule-set files cached locally (cache.db). Update interval 1-30 days. "Update filters" button for forced download |
| **Test servers** | Button in AppBar for quick latency test of all servers |
| **Reconnect indicators** | Settings that require VPN reconnection are marked with 🔄 icon |
| **Provider support links** | If VPN provider sends support-url in subscription headers, "Support" and "Web Page" buttons appear in profile card |
| **VPN exclusions** | Exclude domains (with wildcards `*.example.com`), IP addresses and subnets (`192.168.0.0/16`) |
| **Process picker** | Select programs to bypass VPN from the list of running processes |
| **WireGuard LAN server** | Share VPN with your phone via WireGuard — scan QR code and connect. Works on local network only |
| **Portable mode** | All settings stored in `portable_data/` next to exe — can carry on USB drive |
| **Configurable TUN subnet** | Change VPN network address in settings (default `100.64.0.1/28`) |
| **Dual-core architecture** | sing-box 1.12 + Xray-core for xhttp transport support (fixed Hiddify Manager server compatibility) |
| **Dual-endpoint subscriptions** | Hiddify Manager subscriptions fetch via `/singbox` and `/xray` separately — full xhttp transport compatibility |
| **Core indicator** | Active core (sing-box or Xray) shown on main screen |
| **Smart filtering** | Automatic selection of best servers with recommended protocols |
| **TLS Tricks** | Mixed SNI Case support (SNI case randomization) to bypass DPI blocking. Automatic Hiddify Manager field conversion |
| **Subscription debugging** | Raw server responses saved to `portable_data/debug/` for troubleshooting import issues |
| **Console debugging** | When running from terminal (`Hiddify.exe` in cmd/powershell), debug output is printed for troubleshooting |

### Removed (simplification)

| Was | Why removed |
|-----|-------------|
| Proxy / System Proxy modes | VPN mode works with ALL apps. Proxy only worked with browsers |
| iOS, Android, Linux, macOS | Focus on Windows — less code, fewer bugs |
| IPv6 | Not needed by most users in Russia |
| Cloudflare WARP | Blocked in Russia |
| Clash API | Working only with Hiddify-compatible subscriptions |
| Extension system | Caused LevelDB errors on Windows |
| Auto-update | Portable version — update manually |
| 18 languages | Only Russian and English left |

### Updated

| Component | Was | Now |
|-----------|-----|-----|
| sing-box | 1.11.x | **1.12.14** |
| Riverpod | 2.x (legacy) | **3.x** |
| Flutter SDK | 3.19 | **3.24+** |
| + Xray-core | — | **v25.12.8** |
| drift | 2.16 | **2.30.1** |
| slang | 4.11.x | **4.12.0** |
| ffi | 2.1.4 | **2.1.5** |

---

## Comparison with original

| Feature | Hiddify | Yumash Edition |
|---------|:-------:|:--------------:|
| Platforms | Win, Mac, Linux, Android, iOS | **Windows** |
| sing-box | 1.11.x | **1.12.14** |
| Xray-core (xhttp) | — | ✓ |
| Dual-endpoint subscriptions | — | ✓ |
| TLS Tricks (Mixed SNI Case) | — | ✓ |
| Custom rule-set URLs | Hidden | ✓ |
| Domain/IP/process exclusions | — | ✓ |
| WireGuard LAN server | — | ✓ |
| Portable mode | — | ✓ |
| Subscription debugging (debug/) | — | ✓ |
| IPv6 | ✓ | — |
| WARP | ✓ | — |
| Clash API | ✓ | — |
| Extensions | ✓ | — |
| Auto-update | ✓ | — |
| Locales | 20+ | EN, RU |

---

## How to use

### Installation

1. Download archive from [Releases](../../releases)
2. Extract to any folder
3. Run `Hiddify.exe`

> Settings are saved in `portable_data/` — can carry on USB drive.

### Basic configuration

1. **Add a profile** — paste a link from your VPN provider (click "+" or paste from clipboard). Supports `vless://`, `vmess://`, `trojan://`, `ss://`, `hy2://`, `tuic://` links and subscriptions
2. **Connect** — click the big button on the main screen

### Bypass Russian sites and IPs

This feature uses rule-set files with geodata to identify Russian resources.

1. Open **Config Options** (gear icon)
2. Enable "Bypass Russian sites" — requests to domains from geosite-ru list will go direct (Yandex, VK, government services, banks, etc.)
3. Enable "Bypass Russian IPs" — traffic to IP addresses from geoip-ru list won't go through VPN
4. Optionally: in "Rule-set URLs" section specify your custom URLs for `.srs` files

**Default URLs:**
- Geosite-RU: [geosite-ru.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/country/geosite-ru.srs)
- Geoip-RU: [geoip-ru.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/country/geoip-ru.srs)

### Ad blocking

Blocking works at network level via DNS — ad domains resolve to 127.0.0.1.

1. Open **Config Options**
2. Enable "Block Ads"
3. Optionally: specify your custom URLs for filter lists in `.srs` format

**Default URLs:**
- [geosite-category-ads-all.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-category-ads-all.srs)
- [geosite-malware.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-malware.srs)
- [geosite-phishing.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-phishing.srs)
- [geosite-cryptominers.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-cryptominers.srs)
- [geoip-malware.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geoip-malware.srs)
- [geoip-phishing.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geoip-phishing.srs)

### Exclude domains and IPs from VPN

1. Open **Config Options** → "Bypass Domains"
2. Enter domains for direct access (one per line)
   - Exact domains: `example.com`
   - Wildcards: `*.example.com`
3. Open "Bypass IPs" to exclude IP addresses and subnets
   - Single IPs: `192.168.1.1`
   - Subnets: `192.168.0.0/16`

### Exclude programs from VPN

1. Open **Config Options** → "Bypass Processes"
2. Click the edit button
3. Select processes from running list or enter names manually
4. Save

### Share VPN to phone (WireGuard)

1. Open **Config Options** → "WireGuard LAN Server"
2. Enable WireGuard server
3. Install [WireGuard](https://www.wireguard.com/install/) app on your phone
4. Scan QR code from the app
5. Connect in WireGuard on your phone

> Works only on local network. Phone and computer must be on the same Wi-Fi network.

---

## Building from source

### Requirements

- Windows 10/11
- Docker Desktop
- Flutter SDK >= 3.24.0
- Git

### Build

```bash
git clone https://github.com/user/hiddify-yumash.git
cd hiddify-yumash
build.bat
```

Ready build will appear in `release/` folder.

---

## Authors

**Yumash Edition:** Andrey Yumashev

**AI Assistant:** [Claude Opus](https://claude.ai) by Anthropic

**Original Hiddify:** [Hiddify Team](https://github.com/hiddify)

---

## Support the project

If you find the project useful, you can support the developer:

| Cryptocurrency | Address |
|----------------|---------|
| **BTC (ByBit)** | `1BkYvFT8iBVG3GfTqkR2aBkABNkTrhYuja` |
| **USDT TRC20** | `TULipWSgX7cKWn4Kd1xfaPdTcQyMqTqFim` |
| **TON** | `UQDFaHBN1pcQZ7_9-w1E_hS_JNfGf3d0flS_467w7LOQ7xbK` |

---

## License

This project is distributed under [Hiddify Extended GPLv3](LICENSE.md) license.

> **Important:** The original Hiddify license requires forks to be built via GitHub Actions. This requirement is being [discussed](https://github.com/hiddify/hiddify-app/issues/3334) in the official repository. Yumash Edition uses local Docker build.

---

## Architecture Changes

### sing-box removed from submodule

sing-box code is now included directly in the repository instead of using git submodule. The reason is significant core modifications required for Hiddify Manager compatibility:

- **TLS Tricks** — support for Mixed SNI Case and other DPI bypass methods
- **Xray bridging** — bridge between sing-box and Xray-core for xhttp transport
- **Hiddify Manager compatibility** — handling of non-standard fields `tls_tricks`, `tls_fragment`, `xray_outbound_raw`

Original sing-box doesn't support these features, making submodule maintenance impractical.

### Next Release Roadmap

> **Rust-core:** The next major release will migrate to a custom **Rust** implementation of xray+singbox functionality. This will provide:
> - More stable operation
> - Smaller binary size
> - Simplified architecture without maintaining a sing-box fork
> - Single core instead of dual-core (sing-box + Xray)

---

## Acknowledgments

- [Hiddify](https://github.com/hiddify/hiddify-app) — original project
- [sing-box](https://github.com/SagerNet/sing-box) — VPN core (modified version)
- [Xray-core](https://github.com/XTLS/Xray-core) — xhttp transport support
