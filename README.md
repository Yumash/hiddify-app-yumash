# Hiddify Yumash Edition

> **Проект не поддерживается.** Ведётся разработка отдельного клиента.
>
> **This project is no longer maintained.** A separate client is being developed.

<p align="center">
  <img src="assets/images/logo.svg" width="128" height="128" alt="Hiddify Logo">
</p>

<p align="center">
  <b>Облегчённый VPN-клиент для Windows</b><br>
  Форк <a href="https://github.com/hiddify/hiddify-app">Hiddify</a> с фокусом на российских пользователей
</p>

<p align="center">
  <a href="README-en.md">English</a> | Русский
</p>

---

## Что такое Hiddify?

[Hiddify](https://github.com/hiddify/hiddify-app) — это мультиплатформенный прокси-клиент на базе [sing-box](https://github.com/SagerNet/sing-box). Приложение без рекламы и с открытым исходным кодом.

**Основные возможности оригинального Hiddify:**

- Поддержка протоколов: VLESS, VMess, Reality, TUIC, Hysteria, Hysteria2, WireGuard, Trojan, Shadowsocks, SSH и др.
- Форматы подписок: Sing-box, V2ray, Clash, Clash Meta
- Поддержка прямых ссылок: `vless://`, `vmess://`, `trojan://`, `ss://`, `hy2://`, `tuic://` и др.
- Автоматический выбор лучшего сервера по задержке
- Автообновление подписок
- Отображение информации о профиле (остаток трафика, дней)
- Совместимость с любыми панелями управления прокси
- Тёмная и светлая темы

**Yumash Edition** — это облегчённая версия только для Windows, адаптированная под российских пользователей с дополнительными функциями.

---

## Что изменено в Yumash Edition

### Добавлено

| Функция | Описание |
|---------|----------|
| **Только VPN режим** | Настоящий VPN через TUN-интерфейс, работает со ВСЕМИ программами. Режимы прокси удалены |
| **Свои URL для правил** | В оригинале обход сайтов и блокировка рекламы были скрыты. Теперь можно указать свои URL для rule-set файлов (.srs) с валидацией формата |
| **Кэширование фильтров** | Все rule-set файлы кэшируются локально (cache.db). Интервал обновления 1-30 дней. Кнопка «Обновить фильтры» для принудительного скачивания |
| **Тест серверов** | Кнопка в AppBar для быстрого тестирования всех серверов на задержку |
| **Индикаторы переподключения** | Настройки, требующие переподключения VPN, отмечены значком 🔄 |
| **Ссылки поддержки** | Если VPN провайдер передаёт support-url в заголовках подписки, в карточке профиля появляются кнопки «Поддержка» и «Веб-страница» |
| **Исключения из VPN** | Можно исключить домены (с масками `*.example.com`), IP-адреса и подсети (`192.168.0.0/16`) |
| **Выбор процессов** | Выбор программ для обхода VPN прямо из списка запущенных |
| **WireGuard LAN сервер** | Раздайте VPN на телефон через WireGuard — сканируйте QR-код и подключайтесь. Работает только в локальной сети |
| **Portable режим** | Все настройки хранятся в `portable_data/` рядом с exe — можно носить на флешке |
| **Настраиваемая TUN подсеть** | Можно изменить адрес VPN сети в настройках (по умолчанию `100.64.0.1/28`) |
| **Dual-core архитектура** | sing-box 1.12 + Xray-core для поддержки xhttp транспорта (исправлена работа с Hiddify Manager серверами) |
| **Dual-endpoint для подписок** | Подписки Hiddify Manager загружаются через `/singbox` и `/xray` отдельно — полная совместимость с xhttp транспортом |
| **Индикатор ядра** | На главном экране показывается активное ядро (sing-box или Xray) |
| **Умная фильтрация** | Автоматический выбор лучших серверов с рекомендуемыми протоколами |
| **TLS Tricks** | Поддержка Mixed SNI Case (рандомизация регистра SNI) для обхода DPI-блокировок. Автоматическое преобразование полей Hiddify Manager |
| **Отладка подписок** | Сырые ответы серверов сохраняются в `portable_data/debug/` для диагностики проблем с импортом |
| **Консольная отладка** | При запуске из терминала (`Hiddify.exe` в cmd/powershell) выводится отладочная информация |

### Удалено (для упрощения)

| Было | Почему убрали |
|------|---------------|
| Прокси / Системный прокси | VPN режим работает со ВСЕМИ программами. Прокси работал только с браузерами |
| iOS, Android, Linux, macOS | Фокус на Windows — меньше кода, меньше багов |
| IPv6 | Не нужен большинству пользователей в России |
| Cloudflare WARP | Заблокирован в России |
| Clash API | Работаем только с Hiddify-совместимыми подписками |
| Система расширений | Вызывала ошибки LevelDB на Windows |
| Автообновление | Portable версия — обновляете вручную |
| 18 языков | Оставлены только русский и английский |
| Deep links (protocol_handler) | Не нужны для portable приложения |

### Обновлено

| Компонент | Было | Стало |
|-----------|------|-------|
| sing-box | 1.11.x | **1.12.14** |
| Riverpod | 2.x (legacy) | **3.x** |
| Flutter SDK | 3.19 | **3.24+** |
| + Xray-core | — | **v25.12.8** |
| window_manager | 0.4.x | **0.5.1** |
| tray_manager | 0.2.x | **0.5.2** |
| wolt_modal_sheet | 0.9.x | **0.11.0** |
| ffigen | 8.x | **20.1.1** |
| drift | 2.16 | **2.30.1** |
| slang | 4.11.x | **4.12.0** |
| ffi | 2.1.4 | **2.1.5** |

---

## Сравнение с оригиналом

| Функция | Hiddify | Yumash Edition |
|---------|:-------:|:--------------:|
| Платформы | Win, Mac, Linux, Android, iOS | **Windows** |
| sing-box | 1.11.x | **1.12.14** |
| Xray-core (xhttp) | — | ✓ |
| Dual-endpoint подписки | — | ✓ |
| TLS Tricks (Mixed SNI Case) | — | ✓ |
| Свои URL для rule-set | Скрыто | ✓ |
| Исключения доменов/IP/процессов | — | ✓ |
| WireGuard LAN сервер | — | ✓ |
| Portable режим | — | ✓ |
| Отладка подписок (debug/) | — | ✓ |
| IPv6 | ✓ | — |
| WARP | ✓ | — |
| Clash API | ✓ | — |
| Расширения | ✓ | — |
| Автообновление | ✓ | — |
| Локали | 20+ | EN, RU |

---

## Как пользоваться

### Установка

1. Скачайте архив из [Releases](../../releases)
2. Распакуйте в любую папку
3. Запустите `Hiddify.exe`

> Настройки сохраняются в `portable_data/` — можно носить на флешке.

### Базовая настройка

1. **Добавьте профиль** — вставьте ссылку от вашего VPN-провайдера (кнопка "+" или из буфера обмена). Поддерживаются ссылки `vless://`, `vmess://`, `trojan://`, `ss://`, `hy2://`, `tuic://` и подписки
2. **Подключитесь** — нажмите большую кнопку на главном экране

### Обход российских сайтов и IP

Функция использует rule-set файлы с геоданными для определения российских ресурсов.

1. Откройте **Параметры конфигурации** (иконка шестерёнки)
2. Включите «Обход российских сайтов» — запросы к доменам из списка geosite-ru пойдут напрямую (Яндекс, ВК, Госуслуги, банки и др.)
3. Включите «Обход российских IP» — трафик к IP-адресам из списка geoip-ru не будет идти через VPN
4. Опционально: в разделе «URL для rule-set» укажите свои URL для файлов в формате `.srs`

**URL по умолчанию:**
- Geosite-RU: [geosite-ru.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/country/geosite-ru.srs)
- Geoip-RU: [geoip-ru.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/country/geoip-ru.srs)

### Блокировка рекламы

Блокировка работает на сетевом уровне через DNS — рекламные домены резолвятся в 127.0.0.1.

1. Откройте **Параметры конфигурации**
2. Включите «Блокировка рекламы»
3. Опционально: укажите свои URL для списков фильтров в формате `.srs`

**URL по умолчанию:**
- [geosite-category-ads-all.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-category-ads-all.srs)
- [geosite-malware.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-malware.srs)
- [geosite-phishing.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-phishing.srs)
- [geosite-cryptominers.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geosite-cryptominers.srs)
- [geoip-malware.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geoip-malware.srs)
- [geoip-phishing.srs](https://raw.githubusercontent.com/hiddify/hiddify-geo/rule-set/block/geoip-phishing.srs)

### Исключение доменов и IP из VPN

1. Откройте **Параметры конфигурации** → «Исключённые домены»
2. Введите домены для прямого доступа (по одному на строку)
   - Точные домены: `example.com`
   - По маске: `*.example.com`
3. Откройте «Исключённые IP» для исключения IP-адресов и подсетей
   - Отдельные IP: `192.168.1.1`
   - Подсети: `192.168.0.0/16`

### Исключение программ из VPN

1. Откройте **Параметры конфигурации** → «Исключённые процессы»
2. Нажмите кнопку редактирования
3. Выберите процессы из списка запущенных или введите имена вручную
4. Сохраните

### Раздача VPN на телефон (WireGuard)

1. Откройте **Параметры конфигурации** → «WireGuard LAN сервер»
2. Включите WireGuard сервер
3. Установите приложение [WireGuard](https://www.wireguard.com/install/) на телефон
4. Отсканируйте QR-код из приложения
5. Подключитесь в WireGuard на телефоне

> Работает только в локальной сети. Телефон и компьютер должны быть в одной Wi-Fi сети.

---

## Сборка из исходников

### Требования

- Windows 10/11
- Docker Desktop
- Flutter SDK >= 3.24.0
- Git

### Сборка

```bash
git clone https://github.com/user/hiddify-yumash.git
cd hiddify-yumash
build.bat
```

Готовая сборка появится в папке `release/`.

---

## Авторы

**Yumash Edition:** Андрей Юмашев

**AI-ассистент:** [Claude Opus](https://claude.ai) by Anthropic

**Оригинальный Hiddify:** [Hiddify Team](https://github.com/hiddify)

---

## Поддержать проект

Если проект оказался полезен, можете поддержать разработчика:

| Криптовалюта | Адрес |
|--------------|-------|
| **USDT TRC20 (ByBit)** | `TGaUz963ZaCoHrfoDDgy1sCvSrK1wsZvcx` |
| **BTC (ByBit)** | `1BkYvFT8iBVG3GfTqkR2aBkABNkTrhYuja` |
| **TON** | `UQDFaHBN1pcQZ7_9-w1E_hS_JNfGf3d0flS_467w7LOQ7xbK` |

---

## Лицензия

Проект распространяется под лицензией [Hiddify Extended GPLv3](LICENSE.md).

> Сборка осуществляется через GitHub Actions. Локальная сборка также возможна через `build.bat`.

---

## Архитектурные изменения

### sing-box выведен из сабмодуля

Код sing-box теперь включён напрямую в репозиторий вместо использования git submodule. Причина — значительные модификации ядра для работы с Hiddify Manager:

- **TLS Tricks** — поддержка Mixed SNI Case и других методов обхода DPI
- **Xray bridging** — мост между sing-box и Xray-core для xhttp транспорта
- **Hiddify Manager совместимость** — обработка нестандартных полей `tls_tricks`, `tls_fragment`, `xray_outbound_raw`

Оригинальный sing-box не поддерживает эти функции, поэтому поддерживать его как сабмодуль стало нецелесообразно.

### Планы на следующий релиз

> **Rust-core:** В следующем мажорном релизе планируется переход на собственную реализацию xray+singbox функционала на **Rust**. Это обеспечит:
> - Более стабильную работу
> - Меньший размер бинарников
> - Упрощённую архитектуру без необходимости поддерживать форк sing-box
> - Единое ядро вместо dual-core (sing-box + Xray)

---

## Благодарности

- [Hiddify](https://github.com/hiddify/hiddify-app) — оригинальный проект
- [sing-box](https://github.com/SagerNet/sing-box) — VPN ядро (модифицированная версия)
- [Xray-core](https://github.com/XTLS/Xray-core) — поддержка xhttp транспорта
