# История изменений / Changelog

Все значимые изменения в Hiddify Yumash Edition документируются в этом файле.

Формат версии: `{hiddify_base}-yumash-{yumash_version}`

---

## [Unreleased]

### Архитектура / Architecture

- **sing-box выведен из сабмодуля** — код sing-box теперь включён напрямую в репозиторий из-за значительных модификаций ядра. Это позволяет проще отслеживать изменения и упрощает сборку. Оригинальный sing-box не поддерживает многие функции, необходимые для работы с Hiddify Manager (TLS tricks, xray bridging и др.)
- **sing-box removed from submodule** — sing-box code is now included directly in the repository due to significant core modifications. This makes tracking changes easier and simplifies builds. Original sing-box doesn't support many features required for Hiddify Manager compatibility (TLS tricks, xray bridging, etc.)

### Планы / Roadmap

> **Следующий мажорный релиз:** переход на собственную реализацию xray+singbox функционала на **Rust**. Это обеспечит более стабильную работу, меньший размер бинарников и упрощённую архитектуру без необходимости поддерживать форк sing-box.
>
> **Next major release:** migration to custom **Rust** implementation of xray+singbox functionality. This will provide more stable operation, smaller binary size, and simplified architecture without the need to maintain a sing-box fork.

### Добавлено / Added

- **TLS Tricks: Mixed SNI Case** — поддержка рандомизации регистра SNI (`google.com` → `GoOgLe.CoM`) для обхода DPI-блокировок, чувствительных к регистру
- **Конвертация Hiddify Manager TLS полей** — автоматическое преобразование полей `tls_tricks` и `tls_fragment` из Hiddify Manager в формат sing-box
- **Сохранение отладочных данных** — сырые ответы от серверов подписок сохраняются в `portable_data/debug/` для диагностики
- **Консольный вывод отладки** — при запуске из терминала (`hiddify.exe` в cmd/powershell) выводится отладочная информация для диагностики
- **TLS Tricks: Mixed SNI Case** — support for SNI case randomization (`google.com` → `GoOgLe.CoM`) to bypass case-sensitive DPI blocking
- **Hiddify Manager TLS fields conversion** — automatic conversion of `tls_tricks` and `tls_fragment` fields from Hiddify Manager to sing-box format
- **Debug data saving** — raw subscription responses saved to `portable_data/debug/` for troubleshooting
- **Console debug output** — when running from terminal (`hiddify.exe` in cmd/powershell), debug information is printed for troubleshooting

### Обновлено / Updated

- **Пакеты Flutter** — slang 4.12.0, drift 2.30.1, ffi 2.1.5, watcher 1.2.1, build_runner 2.10.5, sqlparser 0.43.0 и др.
- **Flutter packages** — slang 4.12.0, drift 2.30.1, ffi 2.1.5, watcher 1.2.1, build_runner 2.10.5, sqlparser 0.43.0, etc.

### Улучшено / Improved

- **Использование xray_outbound_raw** — Hiddify Manager отправляет готовые Xray JSON конфиги в поле `xray_outbound_raw`. Теперь они используются напрямую вместо парсинга ссылок, что обеспечивает 100% совместимость с настройками сервера
- **xray_outbound_raw support** — Hiddify Manager sends ready Xray JSON configs in `xray_outbound_raw` field. Now used directly instead of link parsing, ensuring 100% compatibility with server settings

### Исправлено / Fixed

- **Статус подключения "Подключение"** — кнопка теперь показывает "Подключено" сразу после установки соединения, даже если пинг ещё не получен (для xray outbounds пинг может приходить позже)
- **Левая панель статистики** — панель со статистикой подключения теперь отображается на всех экранах шириной >= 600px (раньше только >= 1200px)
- **Пинг для xray outbounds** — добавлено тестирование подключения через Xray SOCKS порт для outbounds, обрабатываемых Xray-core
- **Connection status stuck on "Connecting"** — button now shows "Connected" immediately after connection established, even if ping not yet received (for xray outbounds ping may arrive later)
- **Left stats panel missing** — connection stats panel now displayed on all screens >= 600px width (was >= 1200px before)
- **Ping for xray outbounds** — added connectivity testing via Xray SOCKS port for outbounds handled by Xray-core
- **Ошибка парсера Hiddify Manager полей** — Hiddify Manager отправляет нестандартные поля (`tls_tricks`, `tls_fragment`, `fake_packets`), которые sing-box не понимает. Теперь `tls_tricks` и `tls_fragment` конвертируются в формат sing-box, `xray_outbound_raw` и `xray_fragment` используются для Xray-core, `fake_packets` удаляется (не поддерживается)
- **Parser error for Hiddify Manager fields** — Hiddify Manager sends non-standard fields (`tls_tricks`, `tls_fragment`, `fake_packets`) that sing-box doesn't understand. Now `tls_tricks` and `tls_fragment` are converted to sing-box format, `xray_outbound_raw` and `xray_fragment` are used for Xray-core, `fake_packets` is removed (unsupported)
- **Race condition при удалении активного профиля** — теперь соединение отключается перед удалением активного профиля, предотвращая "висящие" соединения
- **Пропуск первого изменения профиля** — исправлена логика listener, которая пропускала первое переключение профиля
- **Disconnect при ошибке reconnect** — при ошибке переподключения теперь корректно вызывается disconnect для очистки состояния
- **Hardcoded delay при запуске Xray** — заменён фиксированный 500ms delay на exponential backoff с retry (5 попыток)
- **Memory leak в watchGroups** — добавлена очистка broadcast streams при остановке sing-box
- **Race condition при быстром переключении профилей** — добавлен debounce (100ms) и distinct для watchActiveProfile
- **Profile deletion race condition** — connection is now disconnected before deleting active profile, preventing hanging connections
- **Missed first profile change** — fixed listener logic that was skipping first profile switch
- **Disconnect on reconnect error** — reconnect errors now properly call disconnect to clean up state
- **Hardcoded Xray startup delay** — replaced fixed 500ms delay with exponential backoff retry (5 attempts)
- **Memory leak in watchGroups** — added broadcast streams cleanup when stopping sing-box
- **Rapid profile switching race condition** — added debounce (100ms) and distinct for watchActiveProfile

### Добавлено / Added

- **Dual-endpoint для Hiddify Manager** — подписки с Hiddify Manager теперь загружаются через два отдельных endpoint: `/singbox` для sing-box конфига и `/xray` для xray конфига. Это обеспечивает полную совместимость с серверами, использующими xhttp транспорт
- **Поддержка динамического контента** — корректная обработка серверов, возвращающих `Content-Length: 0` (динамически генерируемый контент)
- **Hiddify Manager dual-endpoint** — subscriptions from Hiddify Manager now fetch via two separate endpoints: `/singbox` for sing-box config and `/xray` for xray config. This ensures full compatibility with servers using xhttp transport
- **Dynamic content support** — proper handling of servers returning `Content-Length: 0` (dynamically generated content)
- **Кэширование rule-set** — фильтры (geosite, geoip, ads) сохраняются локально в `cache.db`
- **Настройка интервала обновления фильтров** — от 1 до 30 дней (по умолчанию 7 дней)
- **Кнопка "Обновить фильтры сейчас"** — принудительно перекачать все rule-set
- **Индикаторы переподключения** — настройки, требующие реконнект, отмечены значком 🔄
- **Кнопки поддержки провайдера** — если VPN провайдер передаёт `support-url` или `profile-web-page-url` в заголовках подписки, они отображаются как кнопки в карточке профиля
- **Валидация URL фильтров** — проверка формата URL для rule-set (должны быть HTTP(S) и заканчиваться на .srs)
- **Кнопка теста серверов** — добавлена в AppBar на странице серверов для быстрого доступа
- **Rule-set caching** — filters (geosite, geoip, ads) stored locally in `cache.db`
- **Rule-set update interval setting** — 1 to 30 days (default 7 days)
- **"Update filters now" button** — force re-download all rule-sets
- **Reconnect indicators** — settings requiring reconnect marked with 🔄 icon
- **Provider support buttons** — if VPN provider sends `support-url` or `profile-web-page-url` headers, they appear as buttons in profile card
- **Rule-set URL validation** — validates URL format (must be HTTP(S) and end with .srs)
- **Test servers button** — added to AppBar on proxies page for quick access

### Улучшено / Improved

- **Параллельная загрузка dual-endpoint** — `/singbox` и `/xray` endpoints теперь загружаются параллельно через `Future.wait()` для ускорения
- **Parallel dual-endpoint fetch** — `/singbox` and `/xray` endpoints now fetched in parallel via `Future.wait()` for faster loading
- **Страница «Прокси»** — мгновенное отображение пустого состояния вместо бесконечного спиннера когда нет активного профиля
- **Proxies page** — instant empty state display instead of infinite spinner when no active profile
- **Рефакторинг кода** — удалён весь код geo_asset (~1000 строк), старые схемы БД, неиспользуемые переводы и мёртвый код
- **Отладочное логирование** — добавлено в пустые catch блоки для облегчения диагностики
- **Code refactoring** — removed all geo_asset code (~1000 lines), old DB schemas, unused translations and dead code
- **Debug logging** — added to empty catch blocks for easier diagnostics

### Удалено / Removed

- **Стартовый экран (Intro)** — удалён начальный экран приветствия как неиспользуемый код
- **Intro screen** — removed welcome/intro screen as unused code
- **dependency_validator** — dev-утилита удалена из-за конфликта с analyzer (блокировала обновление freezed/riverpod_generator)
- **dependency_validator** — dev utility removed due to analyzer conflict (was blocking freezed/riverpod_generator updates)

---

## [2.5.7-yumash-1.0.0] — 2026-01-06

Первый релиз Yumash Edition на базе Hiddify 2.5.7.

### Добавлено

**Ядро и архитектура:**
- Dual-core: sing-box 1.12.14 + Xray-core v25.12.8
- Поддержка httpupgrade транспорта через Xray (исправлена работа с Hiddify Manager)
- Индикатор активного ядра на главном экране
- Умная фильтрация конфигов с автовыбором лучшего сервера
- Система оценки конфигов по надёжности протокола

**Обход и фильтрация:**
- Обход российских доменов (geosite-ru) с возможностью указать свой URL
- Обход российских IP (geoip-ru) с возможностью указать свой URL
- Блокировка рекламы с возможностью указать свой URL фильтра (.srs)
- Исключение доменов из VPN (поддержка масок: `*.example.com`)
- Исключение IP и подсетей из VPN (например: `192.168.0.0/16`)
- Выбор процессов для обхода VPN из списка запущенных

**WireGuard LAN сервер:**
- Раздача VPN на мобильные устройства через WireGuard
- QR-код для быстрого подключения с телефона
- Автогенерация ключей WireGuard
- Настраиваемый порт (по умолчанию 51820) и подсеть
- Автоопределение локального IP адреса в LAN

**Интерфейс и удобство:**
- Только VPN режим — убраны режимы прокси/системный прокси
- Portable режим — настройки в `portable_data/` рядом с exe
- Настраиваемая TUN подсеть (по умолчанию CGNAT `100.64.0.1/28`)
- Настройка MTU для TUN интерфейса
- Подсказка для Strict Route о совместимости с VirtualBox
- Полная русская локализация

**Техническое:**
- Автофильтрация outbound — профили с неподдерживаемыми типами импортируются успешно
- Версия из внешнего файла `version.yaml`
- Xray wrapper модуль для управления подпроцессом
- UAC манифест — запрос прав администратора при запуске
- Dockerfile для сборки xray-core.exe

### Удалено

- Платформы: iOS, Android, Linux, macOS (только Windows)
- Поддержка IPv6
- Cloudflare WARP (заблокирован в России)
- Clash API и deep links (`hiddify://`, `sing-box://` — для portable не нужны)
- Система расширений (вызывала ошибки LevelDB на Windows)
- Автообновление (portable версия)
- 18 локалей (оставлены только RU и EN)
- Мобильный код: haptic feedback, per-app proxy, share_plus
- gRPC protobuf файлы
- Тесты и CI/CD workflows
- `flutter_adaptive_scaffold` — заменён на собственную реализацию NavigationRail
- `protocol_handler` — deep links не нужны для portable приложения
- `vclibs` — не использовался в коде

### Изменено

- sing-box обновлён до 1.12.14
- Riverpod мигрирован на 3.x (убран legacy API)
- TUN подсеть: `172.19.0.1/28` → `100.64.0.1/28` (CGNAT)
- Обновлены пакеты: `window_manager` 0.5.1, `tray_manager` 0.5.2, `launch_at_startup` 0.5.1, `toastification` 3.0.3, `wolt_modal_sheet` 0.11.0, `package_info_plus` 9.0.0, `rxdart` 0.28.0, `dio_smart_retry` 7.0.1, `json_path` 0.9.0, `timezone_to_country` 3.1.0, `dependency_validator` 5.0.3, `ffigen` 20.1.1, `drift` 2.30.0
- Локализация переведена на ручные провайдеры (обход несовместимости riverpod_generator + slang)

### Исправлено

- Ошибки LevelDB на Windows
- Краши связанные с WARP и расширениями
- Ошибка импорта «unknown outbound type» — неподдерживаемые outbound отфильтровываются
- Deprecation warnings для `withOpacity`

---

# Changelog (English)

## [2.5.7-yumash-1.0.0] — 2026-01-06

First release of Yumash Edition based on Hiddify 2.5.7.

### Added

**Core and architecture:**
- Dual-core: sing-box 1.12.14 + Xray-core v25.12.8
- httpupgrade transport support via Xray (fixed Hiddify Manager compatibility)
- Active core indicator on home screen
- Smart config filtering with automatic best server selection
- Config scoring system by protocol reliability

**Bypass and filtering:**
- Bypass Russian domains (geosite-ru) with custom URL support
- Bypass Russian IPs (geoip-ru) with custom URL support
- Ad blocking with custom filter URL support (.srs format)
- Exclude domains from VPN (wildcard support: `*.example.com`)
- Exclude IPs and subnets from VPN (e.g., `192.168.0.0/16`)
- Process picker to bypass VPN from running process list

**WireGuard LAN server:**
- Share VPN with mobile devices via WireGuard
- QR code for easy mobile scanning
- Auto-generates WireGuard keys
- Configurable port (default 51820) and subnet
- Auto-detects local LAN IP address

**Interface and UX:**
- VPN mode only — removed proxy/system proxy modes
- Portable mode — settings in `portable_data/` next to exe
- Configurable TUN subnet (default CGNAT `100.64.0.1/28`)
- MTU configuration for TUN interface
- Strict Route tooltip about VirtualBox compatibility
- Full Russian localization

**Technical:**
- Automatic outbound filtering — profiles with unsupported types import successfully
- Version from external `version.yaml` file
- Xray wrapper module for subprocess management
- UAC manifest — admin privileges request on start
- Dockerfile for building xray-core.exe

### Removed

- `flutter_adaptive_scaffold` — replaced with custom NavigationRail implementation
- `protocol_handler` — deep links not needed for portable app
- `vclibs` — not used in code
- Platforms: iOS, Android, Linux, macOS (Windows only)
- IPv6 support
- Cloudflare WARP (blocked in Russia)
- Clash API and deep links (`hiddify://`, `sing-box://` — not needed for portable)
- Extension system (caused LevelDB errors on Windows)
- Auto-update (portable version)
- 18 locales (kept only RU and EN)
- Mobile code: haptic feedback, per-app proxy, share_plus
- gRPC protobuf files
- Tests and CI/CD workflows

### Changed

- sing-box updated to 1.12.14
- Riverpod migrated to 3.x (removed legacy API)
- TUN subnet: `172.19.0.1/28` → `100.64.0.1/28` (CGNAT)
- Updated packages: `window_manager` 0.5.1, `tray_manager` 0.5.2, `launch_at_startup` 0.5.1, `toastification` 3.0.3, `wolt_modal_sheet` 0.11.0, `package_info_plus` 9.0.0, `rxdart` 0.28.0, `dio_smart_retry` 7.0.1, `json_path` 0.9.0, `timezone_to_country` 3.1.0, `ffigen` 20.1.1, `drift` 2.30.0
- Localization switched to manual providers (workaround for riverpod_generator + slang incompatibility)

### Fixed

- LevelDB errors on Windows
- Crashes related to WARP and extensions
- Import error "unknown outbound type" — unsupported outbounds are filtered
- Deprecation warnings for `withOpacity`
