///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsRu extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsGeneralRu general = TranslationsGeneralRu._(_root);
	@override late final TranslationsIntroRu intro = TranslationsIntroRu._(_root);
	@override late final TranslationsHomeRu home = TranslationsHomeRu._(_root);
	@override late final TranslationsStatsRu stats = TranslationsStatsRu._(_root);
	@override late final TranslationsProfileRu profile = TranslationsProfileRu._(_root);
	@override late final TranslationsProxiesRu proxies = TranslationsProxiesRu._(_root);
	@override late final TranslationsLogsRu logs = TranslationsLogsRu._(_root);
	@override late final TranslationsSettingsRu settings = TranslationsSettingsRu._(_root);
	@override late final TranslationsAboutRu about = TranslationsAboutRu._(_root);
	@override late final TranslationsTrayRu tray = TranslationsTrayRu._(_root);
	@override late final TranslationsFailureRu failure = TranslationsFailureRu._(_root);
	@override late final TranslationsConnectionRu connection = TranslationsConnectionRu._(_root);
	@override late final TranslationsConfigRu config = TranslationsConfigRu._(_root);
	@override late final TranslationsWindowRu window = TranslationsWindowRu._(_root);
}

// Path: general
class TranslationsGeneralRu extends TranslationsGeneralEn {
	TranslationsGeneralRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Hiddify';
	@override String get reset => 'Сброс';
	@override late final TranslationsGeneralToggleRu toggle = TranslationsGeneralToggleRu._(_root);
	@override late final TranslationsGeneralStateRu state = TranslationsGeneralStateRu._(_root);
	@override String get sort => 'Сортировка';
	@override String get sortBy => 'Сортировка';
	@override String get addToClipboard => 'Копировать в буфер обмена';
	@override String get notSet => 'Не задано';
	@override String get agree => 'Согласиться';
	@override String get decline => 'Отклонить';
	@override String get unknown => 'Неизвестный';
	@override String get hidden => 'Скрытый';
	@override String get timeout => 'Таймаут';
	@override String get clipboardExportSuccessMsg => 'Скопировано в буфер обмена';
	@override String get showMore => 'Развернуть ';
	@override String get showLess => 'Свернуть ';
	@override String get openAppSettings => 'Открыть настройки приложения';
	@override String get grantPermission => 'Дать права доступа';
}

// Path: intro
class TranslationsIntroRu extends TranslationsIntroEn {
	TranslationsIntroRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override TextSpan termsAndPolicyCaution({required InlineSpanBuilder tap}) => TextSpan(children: [
		const TextSpan(text: 'Продолжая, Вы соглашаетесь с '),
		tap(_root.about.termsAndConditions),
	]);
	@override String get start => 'Старт';
}

// Path: home
class TranslationsHomeRu extends TranslationsHomeEn {
	TranslationsHomeRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => 'Главная';
	@override String get emptyProfilesMsg => 'Начните с добавления профиля подписки';
	@override String get noActiveProfileMsg => 'Выберите профиль';
}

// Path: stats
class TranslationsStatsRu extends TranslationsStatsEn {
	TranslationsStatsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get traffic => 'Трафик';
	@override String get trafficLive => 'Текущий трафик';
	@override String get trafficTotal => 'Весь трафик';
	@override String get uplink => 'Скорость отправки';
	@override String get downlink => 'Скорость загрузки';
	@override String get connection => 'Соединение ';
	@override String get speed => 'Скорость';
	@override String get totalTransferred => 'Всего передано';
}

// Path: profile
class TranslationsProfileRu extends TranslationsProfileEn {
	TranslationsProfileRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get overviewPageTitle => 'Профили';
	@override String get detailsPageTitle => 'Профиль';
	@override String activeProfileNameSemanticLabel({required Object name}) => 'Имя активного профиля: «${name}».';
	@override String get activeProfileBtnSemanticLabel => 'Посмотреть все профили';
	@override String nonActiveProfileBtnSemanticLabel({required Object name}) => 'Выберите «${name}» в качестве активного профиля.';
	@override late final TranslationsProfileSubscriptionRu subscription = TranslationsProfileSubscriptionRu._(_root);
	@override late final TranslationsProfileSortByRu sortBy = TranslationsProfileSortByRu._(_root);
	@override late final TranslationsProfileAddRu add = TranslationsProfileAddRu._(_root);
	@override late final TranslationsProfileUpdateRu update = TranslationsProfileUpdateRu._(_root);
	@override late final TranslationsProfileShareRu share = TranslationsProfileShareRu._(_root);
	@override late final TranslationsProfileEditRu edit = TranslationsProfileEditRu._(_root);
	@override late final TranslationsProfileDeleteRu delete = TranslationsProfileDeleteRu._(_root);
	@override late final TranslationsProfileSaveRu save = TranslationsProfileSaveRu._(_root);
	@override late final TranslationsProfileDetailsFormRu detailsForm = TranslationsProfileDetailsFormRu._(_root);
}

// Path: proxies
class TranslationsProxiesRu extends TranslationsProxiesEn {
	TranslationsProxiesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => 'Прокси';
	@override String get emptyProxiesMsg => 'Нет доступных прокси';
	@override String get delayTestTooltip => 'Тестирование задержки';
	@override String get sortTooltip => 'Сортировка прокси';
	@override String get checkIp => 'Проверить IP';
	@override String get unknownIp => 'Неизвестный IP';
	@override late final TranslationsProxiesSortOptionsRu sortOptions = TranslationsProxiesSortOptionsRu._(_root);
	@override String get activeProxySemanticLabel => 'Активный прокси';
	@override late final TranslationsProxiesDelaySemanticsRu delaySemantics = TranslationsProxiesDelaySemanticsRu._(_root);
	@override late final TranslationsProxiesIpInfoSemanticsRu ipInfoSemantics = TranslationsProxiesIpInfoSemanticsRu._(_root);
}

// Path: logs
class TranslationsLogsRu extends TranslationsLogsEn {
	TranslationsLogsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => 'Логи';
	@override String get filterHint => 'Фильтр';
	@override String get allLevelsFilter => 'Все';
	@override String get shareCoreLogs => 'Поделиться журналами ядра';
	@override String get shareAppLogs => 'Поделиться журналами приложения';
	@override String get pauseTooltip => 'Приостановить';
	@override String get resumeTooltip => 'Возобновить';
	@override String get clearTooltip => 'Очистить';
}

// Path: settings
class TranslationsSettingsRu extends TranslationsSettingsEn {
	TranslationsSettingsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => 'Настройки';
	@override String get requiresRestartMsg => 'Чтобы применить изменения, перезапустите приложение';
	@override String get experimental => 'Экспериментальный';
	@override String get experimentalMsg => 'Функции с флагом «Экспериментально» все еще находятся в разработке и могут вызвать проблемы.';
	@override String get exportOptions => 'Копировать анонимные параметры в буфер обмена';
	@override String get exportAllOptions => 'Скопировать все параметры в буфер обмена';
	@override String get importOptions => 'Импорт параметров из буфера обмена';
	@override String get importOptionsMsg => 'Это перезапишет все параметры конфига предоставленными значениями. Вы уверены?';
	@override late final TranslationsSettingsGeneralRu general = TranslationsSettingsGeneralRu._(_root);
	@override late final TranslationsSettingsAdvancedRu advanced = TranslationsSettingsAdvancedRu._(_root);
	@override late final TranslationsSettingsNetworkRu network = TranslationsSettingsNetworkRu._(_root);
}

// Path: about
class TranslationsAboutRu extends TranslationsAboutEn {
	TranslationsAboutRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => 'О программе';
	@override String get version => 'Версия';
	@override String get sourceCode => 'Исходный код';
	@override String get originalProject => 'Оригинальный Hiddify';
	@override String get privacyPolicy => 'Политика конфиденциальности';
	@override String get termsAndConditions => 'Условия и положения';
	@override late final TranslationsAboutYumashRu yumash = TranslationsAboutYumashRu._(_root);
}

// Path: tray
class TranslationsTrayRu extends TranslationsTrayEn {
	TranslationsTrayRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get dashboard => 'Панель';
	@override String get quit => 'Выход';
	@override String get open => 'Открыть';
	@override late final TranslationsTrayStatusRu status = TranslationsTrayStatusRu._(_root);
}

// Path: failure
class TranslationsFailureRu extends TranslationsFailureEn {
	TranslationsFailureRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Непредвиденная ошибка';
	@override late final TranslationsFailureSingboxRu singbox = TranslationsFailureSingboxRu._(_root);
	@override late final TranslationsFailureConnectivityRu connectivity = TranslationsFailureConnectivityRu._(_root);
	@override late final TranslationsFailureProfilesRu profiles = TranslationsFailureProfilesRu._(_root);
	@override late final TranslationsFailureConnectionRu connection = TranslationsFailureConnectionRu._(_root);
}

// Path: connection
class TranslationsConnectionRu extends TranslationsConnectionEn {
	TranslationsConnectionRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get tapToConnect => 'Нажмите для подключения';
	@override String get connecting => 'Подключение';
	@override String get disconnecting => 'Отключение';
	@override String get connected => 'Подключено';
	@override String get reconnect => 'Восстановить соединение';
	@override String get connectAnyWay => 'Подключиться';
	@override String get experimentalNotice => 'Экспериментальные функции в использовании';
	@override String get experimentalNoticeMsg => 'Вы включили некоторые экспериментальные функции, которые могут повлиять на качество соединения и вызвать непредвиденные ошибки. Вы всегда можете изменить или сбросить эти параметры на странице параметров конфигурации.';
	@override String get disableExperimentalNotice => 'Больше не показывать';
	@override String get reconnectMsg => 'Переподключение для применения изменений...';
}

// Path: config
class TranslationsConfigRu extends TranslationsConfigEn {
	TranslationsConfigRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get core => 'Ядро';
	@override late final TranslationsConfigUseXrayCoreWhenPossibleRu useXrayCoreWhenPossible = TranslationsConfigUseXrayCoreWhenPossibleRu._(_root);
	@override String get resetBtn => 'Сбросить параметры';
	@override String get serviceMode => 'Режим работы';
	@override String get quickSettings => 'Быстрые настройки';
	@override String get allOptions => 'Все параметры ';
	@override late final TranslationsConfigServiceModesRu serviceModes = TranslationsConfigServiceModesRu._(_root);
	@override late final TranslationsConfigShortServiceModesRu shortServiceModes = TranslationsConfigShortServiceModesRu._(_root);
	@override late final TranslationsConfigSectionRu section = TranslationsConfigSectionRu._(_root);
	@override String get pageTitle => 'Параметры конфигурации';
	@override String get logLevel => 'Уровень логирования';
	@override String get blockAds => 'Блокировать рекламу';
	@override String get blockAdsHint => 'Блокирует рекламу в приложениях и браузерах';
	@override String get blockAdsTooltip => 'Рекламные запросы блокируются на сетевом уровне. Работает во всех приложениях, не только в браузерах. Некоторые сайты могут сломаться — отключите при проблемах.';
	@override String get resolveDestination => 'Определять назначение';
	@override String get remoteDnsAddress => 'Удалённый DNS';
	@override String get remoteDnsDomainStrategy => 'Стратегия удалённого домена DNS';
	@override String get directDnsAddress => 'Прямой DNS';
	@override String get directDnsDomainStrategy => 'Стратегия прямого домена DNS';
	@override String get mixedPort => 'Смешанный порт';
	@override String get mixedPortHint => 'Локальный прокси-порт для работы приложения (HTTP/SOCKS5)';
	@override String get tproxyPort => 'Прозрачный прокси порт';
	@override String get tproxyPortHint => 'Используется TUN режимом для перехвата трафика';
	@override String get localDnsPort => 'Локальный порт DNS';
	@override String get localDnsPortHint => 'Локальный DNS-сервер для обхода блокировок';
	@override String get allowConnectionFromLan => 'Общий доступ к VPN в локальной сети';
	@override String get tunImplementation => 'Реализация TUN';
	@override String get mtu => 'Размер пакета (MTU)';
	@override String get connectionTestUrl => 'URL для проверки подключения';
	@override String get urlTestInterval => 'Интервал проверки URL';
	@override String get enableTun => 'Использовать TUN';
	@override String get setSystemProxy => 'Установить системный прокси';
	@override String get enableDnsRouting => 'Использовать маршрутизацию DNS';
	@override String get enableFakeDns => 'Использовать поддельный DNS';
	@override String get bypassLan => 'Домашняя сеть напрямую';
	@override String get bypassLanHint => 'Доступ к роутеру, принтеру и другим устройствам в домашней сети (192.168.x.x)';
	@override String get excludedDomains => 'Свои сайты (вручную)';
	@override String get excludedDomainsHint => 'Сайты которые не работают через VPN (банки, госуслуги). Пример: *.sberbank.ru, gosuslugi.ru';
	@override String get excludedIps => 'Свои IP адреса (вручную)';
	@override String get excludedIpsHint => 'IP адреса которые должны работать напрямую. Пример: 192.168.1.100, 10.0.0.0/8';
	@override String get excludedProcesses => 'Свои программы (вручную)';
	@override String get excludedProcessesHint => 'Игры и программы которые плохо работают через VPN. Пример: Steam.exe, Discord.exe';
	@override String get bypassRussianDomains => 'Российские сайты напрямую';
	@override String get bypassRussianDomainsHint => 'Российские сайты быстрее без VPN (.ru, яндекс, вк, одноклассники и др.)';
	@override String get bypassRussianIps => 'Российские IP напрямую';
	@override String get bypassRussianIpsHint => 'Весь российский интернет напрямую (даже если домен не .ru)';
	@override String get russianGeositeUrl => 'URL фильтра российских доменов';
	@override String get russianGeositeUrlHint => 'URL бинарного файла правил sing-box (.srs) со списком российских доменов';
	@override String get russianGeoipUrl => 'URL фильтра российских IP';
	@override String get russianGeoipUrlHint => 'URL бинарного файла правил sing-box (.srs) с диапазонами российских IP';
	@override String get blockAdsRuleSetUrls => 'URL фильтров блокировки рекламы';
	@override String get blockAdsRuleSetUrlsHint => 'URL бинарных файлов правил sing-box (.srs) для блокировки рекламы. По одному на строку';
	@override String get ruleSetUrlsSection => 'Свои URL фильтров';
	@override String get ruleSetUrlsSectionHint => 'Заменить стандартные источники фильтров на свои URL (формат sing-box .srs)';
	@override String get ruleSetUpdateInterval => 'Интервал обновления фильтров';
	@override String get ruleSetUpdateIntervalHint => 'Как часто проверять обновления списков фильтров (кешируются локально)';
	@override String get forceUpdateRuleSets => 'Обновить фильтры сейчас';
	@override String get forceUpdateRuleSetsHint => 'Принудительно скачать последние списки фильтров';
	@override String get ruleSetUpdated => 'Списки фильтров обновлены';
	@override String get ruleSetUpdateFailed => 'Не удалось обновить списки фильтров';
	@override String get ruleSetUpdating => 'Обновление фильтров...';
	@override String get requiresReconnect => 'Требует переподключения';
	@override String get requiresReconnectTooltip => 'Изменения применятся после переподключения';
	@override String get exclusionListHint => 'По одному на строку';
	@override String get exclusionItemSingular => 'запись';
	@override String get exclusionItemPlural => 'записей';
	@override String get ruleSetUrlInvalid => 'Неверный формат URL';
	@override String get ruleSetUrlMustEndWithSrs => 'URL должен заканчиваться на .srs';
	@override String get ruleSetUrlLine => 'Строка';
	@override String get ruleSetUrlFormat => 'URL должны быть HTTP(S) и заканчиваться на .srs';
	@override String ruleSetUrlMoreErrors({required Object count}) => 'ещё ${count} ошибок';
	@override String get processPickerTabSelect => 'Выбрать из списка';
	@override String get processPickerTabManual => 'Ввести вручную';
	@override String get processPickerSearch => 'Поиск процессов...';
	@override String get processPickerRefresh => 'Обновить список';
	@override String get processPickerSelected => 'Выбрано';
	@override String get processPickerError => 'Не удалось загрузить процессы';
	@override String get processPickerEmpty => 'Процессы не найдены';
	@override String get processNotRunning => 'не запущен';
	@override String get strictRoute => 'Строгая маршрутизация';
	@override String get strictRouteHint => 'Предотвращает утечки DNS и блокирует трафик вне VPN';
	@override String get strictRouteTooltip => 'Может вызвать проблемы с VirtualBox и похожими приложениями';
	@override String get lanBypassIps => 'Домашняя сеть (подсети)';
	@override String get lanBypassIpsHint => 'Диапазоны IP домашней сети которые обходят VPN. Пример: 192.168.0.0/16, 10.0.0.0/8';
	@override String get lanBypassIpsDefault => '192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12';
	@override String get dayOne => 'день';
	@override String get dayFew => 'дня';
	@override String get dayMany => 'дней';
	@override String get minuteOne => 'минута';
	@override String get minuteFew => 'минуты';
	@override String get minuteMany => 'минут';
	@override String get tunAddress => 'Подсеть VPN';
	@override String get tunAddressHint => 'IP-адрес TUN интерфейса в формате CIDR (напр. 100.64.0.1/28)';
	@override String get enableTlsFragment => 'Включить Фрагментацию TLS';
	@override String get tlsFragmentSize => 'Размер фрагмента TLS';
	@override String get tlsFragmentSleep => 'Сон фрагмента TLS';
	@override String get enableTlsMixedSniCase => 'Включить TLS Mixed SNI Case';
	@override String get enableTlsPadding => 'Включить TLS Padding';
	@override String get tlsPaddingSize => 'TLS Padding';
	@override String get enableMux => 'Включить Mux';
	@override String get muxProtocol => 'Протокол Mux';
	@override String get muxMaxStreams => 'Масимальное количество параллельных потоков';
	@override late final TranslationsConfigWgServerRu wgServer = TranslationsConfigWgServerRu._(_root);
}

// Path: window
class TranslationsWindowRu extends TranslationsWindowEn {
	TranslationsWindowRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get hide => 'Скрыть';
	@override String get close => 'Закрыть';
	@override String get alertMessage => 'Скрыть приложение или выйти?';
	@override String get remember => 'Запомнить выбор';
}

// Path: general.toggle
class TranslationsGeneralToggleRu extends TranslationsGeneralToggleEn {
	TranslationsGeneralToggleRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get enabled => 'Включено';
	@override String get disabled => 'Отключено';
}

// Path: general.state
class TranslationsGeneralStateRu extends TranslationsGeneralStateEn {
	TranslationsGeneralStateRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get disable => 'Отключить';
}

// Path: profile.subscription
class TranslationsProfileSubscriptionRu extends TranslationsProfileSubscriptionEn {
	TranslationsProfileSubscriptionRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get traffic => 'Трафик';
	@override String updatedTimeAgo({required Object timeago}) => 'Обновлено ${timeago}';
	@override String remainingDuration({required Object duration}) => 'Ещё ${duration} дн';
	@override String remainingTrafficSemanticLabel({required Object consumed, required Object total}) => 'Использовано ${consumed} трафика из ${total}';
	@override String get expired => 'Истекло';
	@override String get noTraffic => 'Нет доступного трафика';
	@override String get upload => 'Отправлено ';
	@override String get download => 'Скачано';
	@override String get total => 'Всего трафика';
	@override String get expireDate => 'Дата окончания подписки ';
	@override String get support => 'Поддержка';
	@override String get webPage => 'Веб-страница';
}

// Path: profile.sortBy
class TranslationsProfileSortByRu extends TranslationsProfileSortByEn {
	TranslationsProfileSortByRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get lastUpdate => 'По последнему обновлению';
	@override String get name => 'По названию';
}

// Path: profile.add
class TranslationsProfileAddRu extends TranslationsProfileAddEn {
	TranslationsProfileAddRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get buttonText => 'Новый профиль';
	@override String get shortBtnTxt => 'Новый профиль';
	@override String get fromClipboard => 'Добавить из буфера обмена';
	@override String get scanQr => 'Сканировать QR-код';
	@override late final TranslationsProfileAddQrScannerRu qrScanner = TranslationsProfileAddQrScannerRu._(_root);
	@override String get manually => 'Ввести вручную';
	@override String get addingProfileMsg => 'Добавление профиля';
	@override String get failureMsg => 'Не удалось добавить профиль';
}

// Path: profile.update
class TranslationsProfileUpdateRu extends TranslationsProfileUpdateEn {
	TranslationsProfileUpdateRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get buttonTxt => 'Обновить';
	@override String get tooltip => 'Обновить профиль';
	@override String get updateSubscriptions => 'Обновить подписки';
	@override String get failureMsg => 'Не удалось обновить профиль';
	@override String get successMsg => 'Профиль успешно обновлён';
	@override String namedFailureMsg({required Object name}) => 'Не удалось обновить "${name}".';
	@override String namedSuccessMsg({required Object name}) => '"${name}" успешно обновлено';
}

// Path: profile.share
class TranslationsProfileShareRu extends TranslationsProfileShareEn {
	TranslationsProfileShareRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get buttonText => 'Поделиться';
	@override String get exportToClipboardSuccess => 'Ссылка скопирована в буфер обмена';
	@override String get exportSubLinkToClipboard => 'Скопировать ссылку на подписку в буфер обмена';
	@override String get subLinkQrCode => 'QR-код ссылки на подписку';
	@override String get exportConfigToClipboard => 'Скопировать конфигурацию в буфер обмена';
	@override String get exportConfigToClipboardSuccess => 'Конфигурация скопирована в буфер обмена';
}

// Path: profile.edit
class TranslationsProfileEditRu extends TranslationsProfileEditEn {
	TranslationsProfileEditRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get buttonTxt => 'Изменить';
	@override String get selectActiveTxt => 'Выберите активный профиль';
}

// Path: profile.delete
class TranslationsProfileDeleteRu extends TranslationsProfileDeleteEn {
	TranslationsProfileDeleteRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get buttonTxt => 'Удалить';
	@override String get confirmationMsg => 'Безвозвратно удалить профиль?';
	@override String get successMsg => 'Профиль успешно удалён';
}

// Path: profile.save
class TranslationsProfileSaveRu extends TranslationsProfileSaveEn {
	TranslationsProfileSaveRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get buttonText => 'Сохранить';
	@override String get successMsg => 'Профиль успешно сохранён';
	@override String get failureMsg => 'Не удалось сохранить профиль';
}

// Path: profile.detailsForm
class TranslationsProfileDetailsFormRu extends TranslationsProfileDetailsFormEn {
	TranslationsProfileDetailsFormRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get nameLabel => 'Имя';
	@override String get nameHint => 'Имя профиля';
	@override String get urlLabel => 'URL';
	@override String get urlHint => 'Полный URL конфигурации';
	@override String get emptyNameMsg => 'Поле «Имя» обязательно';
	@override String get invalidUrlMsg => 'Неправильный URL';
	@override String get lastUpdate => 'Последнее обновление';
	@override String get updateInterval => 'Автоматическое обновление';
	@override String get updateIntervalDialogTitle => 'Интервал обновления (в часах)';
}

// Path: proxies.sortOptions
class TranslationsProxiesSortOptionsRu extends TranslationsProxiesSortOptionsEn {
	TranslationsProxiesSortOptionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get unsorted => 'По умолчанию';
	@override String get name => 'По алфавиту';
	@override String get delay => 'По задержке';
}

// Path: proxies.delaySemantics
class TranslationsProxiesDelaySemanticsRu extends TranslationsProxiesDelaySemanticsEn {
	TranslationsProxiesDelaySemanticsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String result({required Object delay}) => 'Задержка: ${delay}мс';
	@override String get timeout => 'Тайм-аут при тестировании задержки';
	@override String get testing => 'Задержка: Тестирование...';
}

// Path: proxies.ipInfoSemantics
class TranslationsProxiesIpInfoSemanticsRu extends TranslationsProxiesIpInfoSemanticsEn {
	TranslationsProxiesIpInfoSemanticsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get address => 'IP адрес';
	@override String get country => 'Страна';
}

// Path: settings.general
class TranslationsSettingsGeneralRu extends TranslationsSettingsGeneralEn {
	TranslationsSettingsGeneralRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get sectionTitle => 'Основные';
	@override String get locale => 'Язык';
	@override String get region => 'Регион';
	@override String get regionMsg => 'Помогает установить параметры по умолчанию для обхода внутренних (домашних, внутри страны) адресов.';
	@override late final TranslationsSettingsGeneralRegionsRu regions = TranslationsSettingsGeneralRegionsRu._(_root);
	@override String get themeMode => 'Оформление';
	@override late final TranslationsSettingsGeneralThemeModesRu themeModes = TranslationsSettingsGeneralThemeModesRu._(_root);
	@override String get enableAnalytics => 'Сбор аналитики';
	@override String get enableAnalyticsMsg => 'Сбор данных аналитики и отправка отчётов о сбоях для улучшения приложения';
	@override String get autoStart => 'Запуск при загрузке';
	@override String get silentStart => 'Запуск в свёрнутом виде';
	@override String get openWorkingDir => 'Открыть рабочую папку';
	@override String get ignoreBatteryOptimizations => 'Отключить оптимизацию батареи';
	@override String get ignoreBatteryOptimizationsMsg => 'Отключение ограничений для оптимальной производительности VPN';
	@override String get dynamicNotification => 'Отображение скорости в уведомлении';
	@override String get hapticFeedback => 'Тактильная обратная связь';
	@override String get autoIpCheck => 'Автоматически проверять IP-адрес соединения';
	@override String get actionAtClosing => 'Действие при закрытии';
	@override late final TranslationsSettingsGeneralActionsAtClosingRu actionsAtClosing = TranslationsSettingsGeneralActionsAtClosingRu._(_root);
}

// Path: settings.advanced
class TranslationsSettingsAdvancedRu extends TranslationsSettingsAdvancedEn {
	TranslationsSettingsAdvancedRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get sectionTitle => 'Расширенные';
	@override String get debugMode => 'Режим отладки';
	@override String get debugModeMsg => 'Чтобы применить изменения, перезапустите приложение';
	@override String get memoryLimit => 'Ограничение памяти';
	@override String get memoryLimitMsg => 'Включите, если у вас возникают ошибки нехватки памяти или частые сбои приложения';
	@override String get resetTunnel => 'Сбросить профиль VPN';
}

// Path: settings.network
class TranslationsSettingsNetworkRu extends TranslationsSettingsNetworkEn {
	TranslationsSettingsNetworkRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get perAppProxyPageTitle => 'Раздельное проксирование приложений';
	@override late final TranslationsSettingsNetworkPerAppProxyModesRu perAppProxyModes = TranslationsSettingsNetworkPerAppProxyModesRu._(_root);
	@override String get showSystemApps => 'Показать системные приложения';
	@override String get hideSystemApps => 'Скрыть системные приложения';
	@override String get clearSelection => 'Очистить выбор';
}

// Path: about.yumash
class TranslationsAboutYumashRu extends TranslationsAboutYumashEn {
	TranslationsAboutYumashRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Yumash Edition — что изменено';
	@override String get added => 'Добавлено';
	@override String get removed => 'Удалено';
	@override String get improved => 'Улучшено';
	@override String get featureBypassRu => 'Обход российских доменов и IP (geosite-ru, geoip-ru)';
	@override String get featureBlockAds => 'Блокировка рекламы с настраиваемыми URL';
	@override String get featureProcessPicker => 'Выбор процессов из списка запущенных';
	@override String get featurePortable => 'Portable режим (настройки рядом с exe)';
	@override String get featureTunCgnat => 'TUN подсеть CGNAT (100.64.0.1/28)';
	@override String get featureDualCore => 'Dual-core: sing-box + Xray-core';
	@override String get featureHiddifyManager => 'Полная поддержка Hiddify Manager (xhttp, TLS tricks)';
	@override String get featureTlsTricks => 'TLS Tricks: Mixed SNI Case, фрагментация';
	@override String get featureRulesetCache => 'Кэширование фильтров с настраиваемым интервалом';
	@override String get featureProviderButtons => 'Кнопки поддержки провайдера из подписки';
	@override String get removedPlatforms => 'Платформы: iOS, Android, Linux, macOS';
	@override String get removedIpv6 => 'IPv6 поддержка';
	@override String get removedWarp => 'Cloudflare WARP';
	@override String get removedClash => 'Clash API';
	@override String get removedExtensions => 'Система расширений';
	@override String get removedAutoupdate => 'Автообновление';
	@override String get removedLocales => 'Локали кроме EN/RU';
	@override String get improvedSingbox => 'sing-box извлечён из сабмодуля для кастомизации';
	@override String get improvedHotSwitch => 'Горячее переключение прокси без реконнекта';
	@override String get improvedFixedWindow => 'Фиксированный размер окна 900x700';
	@override String get donate => 'Поддержать разработчика';
	@override String get donateBtc => 'BTC (ByBit)';
	@override String get donateUsdt => 'USDT TRC20';
	@override String get donateTon => 'TON';
}

// Path: tray.status
class TranslationsTrayStatusRu extends TranslationsTrayStatusEn {
	TranslationsTrayStatusRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get connect => 'Подключиться';
	@override String get connecting => 'Подключение';
	@override String get disconnect => 'Отключиться';
	@override String get disconnecting => 'Отключение';
}

// Path: failure.singbox
class TranslationsFailureSingboxRu extends TranslationsFailureSingboxEn {
	TranslationsFailureSingboxRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Непредвиденная ошибка (SingBox)';
	@override String get serviceNotRunning => 'Сервис не запущен';
	@override String get missingPrivilege => 'Отсутствуют права';
	@override String get missingPrivilegeMsg => 'Режим VPN требует прав администратора. Перезапустите приложение от имени администратора или измените режим работы приложения.';
	@override String get invalidConfigOptions => 'Неправильные параметры конфигурации';
	@override String get invalidConfig => 'Неправильная конфигурация';
	@override String get create => 'Ошибка создания сервиса';
	@override String get start => 'Ошибка запуска сервиса';
}

// Path: failure.connectivity
class TranslationsFailureConnectivityRu extends TranslationsFailureConnectivityEn {
	TranslationsFailureConnectivityRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Непредвиденная ошибка';
	@override String get missingVpnPermission => 'Отсутствует разрешение VPN';
	@override String get missingNotificationPermission => 'Отсутствует разрешение на показ уведомлений';
	@override String get core => 'Ошибка ядра';
}

// Path: failure.profiles
class TranslationsFailureProfilesRu extends TranslationsFailureProfilesEn {
	TranslationsFailureProfilesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Непредвиденная ошибка';
	@override String get notFound => 'Профиль не найден';
	@override String get invalidConfig => 'Неправильная конфигурация';
	@override String get invalidUrl => 'Неправильный URL';
}

// Path: failure.connection
class TranslationsFailureConnectionRu extends TranslationsFailureConnectionEn {
	TranslationsFailureConnectionRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Неожиданная ошибка подключения';
	@override String get timeout => 'Истекло время подключения';
	@override String get badResponse => 'Неправильный ответ';
	@override String get connectionError => 'Ошибка подключения';
	@override String get badCertificate => 'Неправильный сертификат';
}

// Path: config.useXrayCoreWhenPossible
class TranslationsConfigUseXrayCoreWhenPossibleRu extends TranslationsConfigUseXrayCoreWhenPossibleEn {
	TranslationsConfigUseXrayCoreWhenPossibleRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get Label => 'Использовать Xray-core по возможности';
	@override String get Description => 'Использование Xray-core для анализа подписок. Чтобы включить эту опцию, вам необходимо повторно импортировать подписку.';
}

// Path: config.serviceModes
class TranslationsConfigServiceModesRu extends TranslationsConfigServiceModesEn {
	TranslationsConfigServiceModesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get proxy => 'Прокси';
	@override String get systemProxy => 'Системный прокси';
	@override String get tun => 'VPN';
	@override String get tunService => 'VPN Сервис';
}

// Path: config.shortServiceModes
class TranslationsConfigShortServiceModesRu extends TranslationsConfigShortServiceModesEn {
	TranslationsConfigShortServiceModesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get proxy => 'Прокси';
	@override String get systemProxy => 'Системный прокси';
	@override String get tun => 'VPN';
	@override String get tunService => 'VPN Сервис';
}

// Path: config.section
class TranslationsConfigSectionRu extends TranslationsConfigSectionEn {
	TranslationsConfigSectionRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get route => 'Варианты маршрутизации';
	@override String get dns => 'Параметры DNS';
	@override String get dnsExplanation => 'Удалённый DNS используется для сайтов через VPN (зарубежные). Прямой DNS — для сайтов без VPN (российские, из списка обхода). Это гарантирует что российские сайты получают правильные IP адреса.';
	@override String get inbound => 'Входящие параметры';
	@override String get mux => 'Мультиплексор';
	@override String get outbound => 'Исходящие параметры';
	@override String get tlsTricks => 'Хитрости TLS';
	@override String get misc => 'Разные параметры';
}

// Path: config.wgServer
class TranslationsConfigWgServerRu extends TranslationsConfigWgServerEn {
	TranslationsConfigWgServerRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Раздать VPN через WireGuard';
	@override String get enable => 'Включить WireGuard сервер';
	@override String get enableHint => 'Позволяет мобильным устройствам в вашей сети подключаться через WireGuard';
	@override String get port => 'UDP порт';
	@override String get subnet => 'Подсеть WireGuard';
	@override String get statusEnabled => 'Включен';
	@override String get statusDisabled => 'Выключен';
	@override String get enableToShowQR => 'Включите WireGuard сервер, чтобы показать QR-код';
	@override String get scanInstructions => 'Отсканируйте этот QR-код приложением WireGuard на телефоне';
	@override String get serverAddress => 'Сервер';
	@override String get copyConfig => 'Скопировать конфиг';
	@override String get configError => 'Ключи ещё не сгенерированы. Перезапустите приложение.';
	@override String get securityWarning => 'WireGuard сервер доступен только из вашей локальной сети. Не показывайте QR-код публично — он содержит приватные ключи.';
	@override String get keysGenerated => 'Ключи WireGuard успешно сгенерированы';
	@override String get noKeys => 'Ключи WireGuard ещё не сгенерированы';
	@override String get generateKeys => 'Сгенерировать ключи';
	@override String get regenerateKeys => 'Перегенерировать';
}

// Path: profile.add.qrScanner
class TranslationsProfileAddQrScannerRu extends TranslationsProfileAddQrScannerEn {
	TranslationsProfileAddQrScannerRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get permissionDeniedError => 'Нет прав';
	@override String get unexpectedError => 'Неизвестная ошибка';
	@override String get torchSemanticLabel => 'Вспышка';
	@override String get facingSemanticLabel => 'Фронтальная камера';
	@override String get permissionRequest => 'Права на использование камеры для считывания QR';
}

// Path: settings.general.regions
class TranslationsSettingsGeneralRegionsRu extends TranslationsSettingsGeneralRegionsEn {
	TranslationsSettingsGeneralRegionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get ir => 'Иран (ir) 🇮🇷';
	@override String get cn => 'Китай (cn) 🇨🇳';
	@override String get ru => 'Россия (ru) 🇷🇺';
	@override String get af => 'Афганистан (af) 🇦🇫';
	@override String get id => 'Индонезия (id) 🇮🇩';
	@override String get tr => 'Турция (tr) 🇹🇷';
	@override String get br => 'Бразилия (br) 🇧🇷';
	@override String get other => 'Другой';
}

// Path: settings.general.themeModes
class TranslationsSettingsGeneralThemeModesRu extends TranslationsSettingsGeneralThemeModesEn {
	TranslationsSettingsGeneralThemeModesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Системная тема';
	@override String get dark => 'Тёмная тема';
	@override String get light => 'Светлая тема';
	@override String get black => 'Чёрная тема';
}

// Path: settings.general.actionsAtClosing
class TranslationsSettingsGeneralActionsAtClosingRu extends TranslationsSettingsGeneralActionsAtClosingEn {
	TranslationsSettingsGeneralActionsAtClosingRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get askEachTime => 'Каждый раз спрашивать';
	@override String get hide => 'Скрыть';
	@override String get exit => 'Выйти';
}

// Path: settings.network.perAppProxyModes
class TranslationsSettingsNetworkPerAppProxyModesRu extends TranslationsSettingsNetworkPerAppProxyModesEn {
	TranslationsSettingsNetworkPerAppProxyModesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get off => 'Все';
	@override String get offMsg => 'Проксировать все приложения';
	@override String get include => 'Прокси';
	@override String get includeMsg => 'Проксировать выбранные приложения';
	@override String get exclude => 'Обход';
	@override String get excludeMsg => 'Не проксировать выбранные приложения';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'general.appTitle' => 'Hiddify',
			'general.reset' => 'Сброс',
			'general.toggle.enabled' => 'Включено',
			'general.toggle.disabled' => 'Отключено',
			'general.state.disable' => 'Отключить',
			'general.sort' => 'Сортировка',
			'general.sortBy' => 'Сортировка',
			'general.addToClipboard' => 'Копировать в буфер обмена',
			'general.notSet' => 'Не задано',
			'general.agree' => 'Согласиться',
			'general.decline' => 'Отклонить',
			'general.unknown' => 'Неизвестный',
			'general.hidden' => 'Скрытый',
			'general.timeout' => 'Таймаут',
			'general.clipboardExportSuccessMsg' => 'Скопировано в буфер обмена',
			'general.showMore' => 'Развернуть ',
			'general.showLess' => 'Свернуть ',
			'general.openAppSettings' => 'Открыть настройки приложения',
			'general.grantPermission' => 'Дать права доступа',
			'intro.termsAndPolicyCaution' => ({required InlineSpanBuilder tap}) => TextSpan(children: [ const TextSpan(text: 'Продолжая, Вы соглашаетесь с '), tap(_root.about.termsAndConditions), ]), 
			'intro.start' => 'Старт',
			'home.pageTitle' => 'Главная',
			'home.emptyProfilesMsg' => 'Начните с добавления профиля подписки',
			'home.noActiveProfileMsg' => 'Выберите профиль',
			'stats.traffic' => 'Трафик',
			'stats.trafficLive' => 'Текущий трафик',
			'stats.trafficTotal' => 'Весь трафик',
			'stats.uplink' => 'Скорость отправки',
			'stats.downlink' => 'Скорость загрузки',
			'stats.connection' => 'Соединение ',
			'stats.speed' => 'Скорость',
			'stats.totalTransferred' => 'Всего передано',
			'profile.overviewPageTitle' => 'Профили',
			'profile.detailsPageTitle' => 'Профиль',
			'profile.activeProfileNameSemanticLabel' => ({required Object name}) => 'Имя активного профиля: «${name}».',
			'profile.activeProfileBtnSemanticLabel' => 'Посмотреть все профили',
			'profile.nonActiveProfileBtnSemanticLabel' => ({required Object name}) => 'Выберите «${name}» в качестве активного профиля.',
			'profile.subscription.traffic' => 'Трафик',
			'profile.subscription.updatedTimeAgo' => ({required Object timeago}) => 'Обновлено ${timeago}',
			'profile.subscription.remainingDuration' => ({required Object duration}) => 'Ещё ${duration} дн',
			'profile.subscription.remainingTrafficSemanticLabel' => ({required Object consumed, required Object total}) => 'Использовано ${consumed} трафика из ${total}',
			'profile.subscription.expired' => 'Истекло',
			'profile.subscription.noTraffic' => 'Нет доступного трафика',
			'profile.subscription.upload' => 'Отправлено ',
			'profile.subscription.download' => 'Скачано',
			'profile.subscription.total' => 'Всего трафика',
			'profile.subscription.expireDate' => 'Дата окончания подписки ',
			'profile.subscription.support' => 'Поддержка',
			'profile.subscription.webPage' => 'Веб-страница',
			'profile.sortBy.lastUpdate' => 'По последнему обновлению',
			'profile.sortBy.name' => 'По названию',
			'profile.add.buttonText' => 'Новый профиль',
			'profile.add.shortBtnTxt' => 'Новый профиль',
			'profile.add.fromClipboard' => 'Добавить из буфера обмена',
			'profile.add.scanQr' => 'Сканировать QR-код',
			'profile.add.qrScanner.permissionDeniedError' => 'Нет прав',
			'profile.add.qrScanner.unexpectedError' => 'Неизвестная ошибка',
			'profile.add.qrScanner.torchSemanticLabel' => 'Вспышка',
			'profile.add.qrScanner.facingSemanticLabel' => 'Фронтальная камера',
			'profile.add.qrScanner.permissionRequest' => 'Права на использование камеры для считывания QR',
			'profile.add.manually' => 'Ввести вручную',
			'profile.add.addingProfileMsg' => 'Добавление профиля',
			'profile.add.failureMsg' => 'Не удалось добавить профиль',
			'profile.update.buttonTxt' => 'Обновить',
			'profile.update.tooltip' => 'Обновить профиль',
			'profile.update.updateSubscriptions' => 'Обновить подписки',
			'profile.update.failureMsg' => 'Не удалось обновить профиль',
			'profile.update.successMsg' => 'Профиль успешно обновлён',
			'profile.update.namedFailureMsg' => ({required Object name}) => 'Не удалось обновить "${name}".',
			'profile.update.namedSuccessMsg' => ({required Object name}) => '"${name}" успешно обновлено',
			'profile.share.buttonText' => 'Поделиться',
			'profile.share.exportToClipboardSuccess' => 'Ссылка скопирована в буфер обмена',
			'profile.share.exportSubLinkToClipboard' => 'Скопировать ссылку на подписку в буфер обмена',
			'profile.share.subLinkQrCode' => 'QR-код ссылки на подписку',
			'profile.share.exportConfigToClipboard' => 'Скопировать конфигурацию в буфер обмена',
			'profile.share.exportConfigToClipboardSuccess' => 'Конфигурация скопирована в буфер обмена',
			'profile.edit.buttonTxt' => 'Изменить',
			'profile.edit.selectActiveTxt' => 'Выберите активный профиль',
			'profile.delete.buttonTxt' => 'Удалить',
			'profile.delete.confirmationMsg' => 'Безвозвратно удалить профиль?',
			'profile.delete.successMsg' => 'Профиль успешно удалён',
			'profile.save.buttonText' => 'Сохранить',
			'profile.save.successMsg' => 'Профиль успешно сохранён',
			'profile.save.failureMsg' => 'Не удалось сохранить профиль',
			'profile.detailsForm.nameLabel' => 'Имя',
			'profile.detailsForm.nameHint' => 'Имя профиля',
			'profile.detailsForm.urlLabel' => 'URL',
			'profile.detailsForm.urlHint' => 'Полный URL конфигурации',
			'profile.detailsForm.emptyNameMsg' => 'Поле «Имя» обязательно',
			'profile.detailsForm.invalidUrlMsg' => 'Неправильный URL',
			'profile.detailsForm.lastUpdate' => 'Последнее обновление',
			'profile.detailsForm.updateInterval' => 'Автоматическое обновление',
			'profile.detailsForm.updateIntervalDialogTitle' => 'Интервал обновления (в часах)',
			'proxies.pageTitle' => 'Прокси',
			'proxies.emptyProxiesMsg' => 'Нет доступных прокси',
			'proxies.delayTestTooltip' => 'Тестирование задержки',
			'proxies.sortTooltip' => 'Сортировка прокси',
			'proxies.checkIp' => 'Проверить IP',
			'proxies.unknownIp' => 'Неизвестный IP',
			'proxies.sortOptions.unsorted' => 'По умолчанию',
			'proxies.sortOptions.name' => 'По алфавиту',
			'proxies.sortOptions.delay' => 'По задержке',
			'proxies.activeProxySemanticLabel' => 'Активный прокси',
			'proxies.delaySemantics.result' => ({required Object delay}) => 'Задержка: ${delay}мс',
			'proxies.delaySemantics.timeout' => 'Тайм-аут при тестировании задержки',
			'proxies.delaySemantics.testing' => 'Задержка: Тестирование...',
			'proxies.ipInfoSemantics.address' => 'IP адрес',
			'proxies.ipInfoSemantics.country' => 'Страна',
			'logs.pageTitle' => 'Логи',
			'logs.filterHint' => 'Фильтр',
			'logs.allLevelsFilter' => 'Все',
			'logs.shareCoreLogs' => 'Поделиться журналами ядра',
			'logs.shareAppLogs' => 'Поделиться журналами приложения',
			'logs.pauseTooltip' => 'Приостановить',
			'logs.resumeTooltip' => 'Возобновить',
			'logs.clearTooltip' => 'Очистить',
			'settings.pageTitle' => 'Настройки',
			'settings.requiresRestartMsg' => 'Чтобы применить изменения, перезапустите приложение',
			'settings.experimental' => 'Экспериментальный',
			'settings.experimentalMsg' => 'Функции с флагом «Экспериментально» все еще находятся в разработке и могут вызвать проблемы.',
			'settings.exportOptions' => 'Копировать анонимные параметры в буфер обмена',
			'settings.exportAllOptions' => 'Скопировать все параметры в буфер обмена',
			'settings.importOptions' => 'Импорт параметров из буфера обмена',
			'settings.importOptionsMsg' => 'Это перезапишет все параметры конфига предоставленными значениями. Вы уверены?',
			'settings.general.sectionTitle' => 'Основные',
			'settings.general.locale' => 'Язык',
			'settings.general.region' => 'Регион',
			'settings.general.regionMsg' => 'Помогает установить параметры по умолчанию для обхода внутренних (домашних, внутри страны) адресов.',
			'settings.general.regions.ir' => 'Иран (ir) 🇮🇷',
			'settings.general.regions.cn' => 'Китай (cn) 🇨🇳',
			'settings.general.regions.ru' => 'Россия (ru) 🇷🇺',
			'settings.general.regions.af' => 'Афганистан (af) 🇦🇫',
			'settings.general.regions.id' => 'Индонезия (id) 🇮🇩',
			'settings.general.regions.tr' => 'Турция (tr) 🇹🇷',
			'settings.general.regions.br' => 'Бразилия (br) 🇧🇷',
			'settings.general.regions.other' => 'Другой',
			'settings.general.themeMode' => 'Оформление',
			'settings.general.themeModes.system' => 'Системная тема',
			'settings.general.themeModes.dark' => 'Тёмная тема',
			'settings.general.themeModes.light' => 'Светлая тема',
			'settings.general.themeModes.black' => 'Чёрная тема',
			'settings.general.enableAnalytics' => 'Сбор аналитики',
			'settings.general.enableAnalyticsMsg' => 'Сбор данных аналитики и отправка отчётов о сбоях для улучшения приложения',
			'settings.general.autoStart' => 'Запуск при загрузке',
			'settings.general.silentStart' => 'Запуск в свёрнутом виде',
			'settings.general.openWorkingDir' => 'Открыть рабочую папку',
			'settings.general.ignoreBatteryOptimizations' => 'Отключить оптимизацию батареи',
			'settings.general.ignoreBatteryOptimizationsMsg' => 'Отключение ограничений для оптимальной производительности VPN',
			'settings.general.dynamicNotification' => 'Отображение скорости в уведомлении',
			'settings.general.hapticFeedback' => 'Тактильная обратная связь',
			'settings.general.autoIpCheck' => 'Автоматически проверять IP-адрес соединения',
			'settings.general.actionAtClosing' => 'Действие при закрытии',
			'settings.general.actionsAtClosing.askEachTime' => 'Каждый раз спрашивать',
			'settings.general.actionsAtClosing.hide' => 'Скрыть',
			'settings.general.actionsAtClosing.exit' => 'Выйти',
			'settings.advanced.sectionTitle' => 'Расширенные',
			'settings.advanced.debugMode' => 'Режим отладки',
			'settings.advanced.debugModeMsg' => 'Чтобы применить изменения, перезапустите приложение',
			'settings.advanced.memoryLimit' => 'Ограничение памяти',
			'settings.advanced.memoryLimitMsg' => 'Включите, если у вас возникают ошибки нехватки памяти или частые сбои приложения',
			'settings.advanced.resetTunnel' => 'Сбросить профиль VPN',
			'settings.network.perAppProxyPageTitle' => 'Раздельное проксирование приложений',
			'settings.network.perAppProxyModes.off' => 'Все',
			'settings.network.perAppProxyModes.offMsg' => 'Проксировать все приложения',
			'settings.network.perAppProxyModes.include' => 'Прокси',
			'settings.network.perAppProxyModes.includeMsg' => 'Проксировать выбранные приложения',
			'settings.network.perAppProxyModes.exclude' => 'Обход',
			'settings.network.perAppProxyModes.excludeMsg' => 'Не проксировать выбранные приложения',
			'settings.network.showSystemApps' => 'Показать системные приложения',
			'settings.network.hideSystemApps' => 'Скрыть системные приложения',
			'settings.network.clearSelection' => 'Очистить выбор',
			'about.pageTitle' => 'О программе',
			'about.version' => 'Версия',
			'about.sourceCode' => 'Исходный код',
			'about.originalProject' => 'Оригинальный Hiddify',
			'about.privacyPolicy' => 'Политика конфиденциальности',
			'about.termsAndConditions' => 'Условия и положения',
			'about.yumash.title' => 'Yumash Edition — что изменено',
			'about.yumash.added' => 'Добавлено',
			'about.yumash.removed' => 'Удалено',
			'about.yumash.improved' => 'Улучшено',
			'about.yumash.featureBypassRu' => 'Обход российских доменов и IP (geosite-ru, geoip-ru)',
			'about.yumash.featureBlockAds' => 'Блокировка рекламы с настраиваемыми URL',
			'about.yumash.featureProcessPicker' => 'Выбор процессов из списка запущенных',
			'about.yumash.featurePortable' => 'Portable режим (настройки рядом с exe)',
			'about.yumash.featureTunCgnat' => 'TUN подсеть CGNAT (100.64.0.1/28)',
			'about.yumash.featureDualCore' => 'Dual-core: sing-box + Xray-core',
			'about.yumash.featureHiddifyManager' => 'Полная поддержка Hiddify Manager (xhttp, TLS tricks)',
			'about.yumash.featureTlsTricks' => 'TLS Tricks: Mixed SNI Case, фрагментация',
			'about.yumash.featureRulesetCache' => 'Кэширование фильтров с настраиваемым интервалом',
			'about.yumash.featureProviderButtons' => 'Кнопки поддержки провайдера из подписки',
			'about.yumash.removedPlatforms' => 'Платформы: iOS, Android, Linux, macOS',
			'about.yumash.removedIpv6' => 'IPv6 поддержка',
			'about.yumash.removedWarp' => 'Cloudflare WARP',
			'about.yumash.removedClash' => 'Clash API',
			'about.yumash.removedExtensions' => 'Система расширений',
			'about.yumash.removedAutoupdate' => 'Автообновление',
			'about.yumash.removedLocales' => 'Локали кроме EN/RU',
			'about.yumash.improvedSingbox' => 'sing-box извлечён из сабмодуля для кастомизации',
			'about.yumash.improvedHotSwitch' => 'Горячее переключение прокси без реконнекта',
			'about.yumash.improvedFixedWindow' => 'Фиксированный размер окна 900x700',
			'about.yumash.donate' => 'Поддержать разработчика',
			'about.yumash.donateBtc' => 'BTC (ByBit)',
			'about.yumash.donateUsdt' => 'USDT TRC20',
			'about.yumash.donateTon' => 'TON',
			'tray.dashboard' => 'Панель',
			'tray.quit' => 'Выход',
			'tray.open' => 'Открыть',
			'tray.status.connect' => 'Подключиться',
			'tray.status.connecting' => 'Подключение',
			'tray.status.disconnect' => 'Отключиться',
			'tray.status.disconnecting' => 'Отключение',
			'failure.unexpected' => 'Непредвиденная ошибка',
			'failure.singbox.unexpected' => 'Непредвиденная ошибка (SingBox)',
			'failure.singbox.serviceNotRunning' => 'Сервис не запущен',
			'failure.singbox.missingPrivilege' => 'Отсутствуют права',
			'failure.singbox.missingPrivilegeMsg' => 'Режим VPN требует прав администратора. Перезапустите приложение от имени администратора или измените режим работы приложения.',
			'failure.singbox.invalidConfigOptions' => 'Неправильные параметры конфигурации',
			'failure.singbox.invalidConfig' => 'Неправильная конфигурация',
			'failure.singbox.create' => 'Ошибка создания сервиса',
			'failure.singbox.start' => 'Ошибка запуска сервиса',
			'failure.connectivity.unexpected' => 'Непредвиденная ошибка',
			'failure.connectivity.missingVpnPermission' => 'Отсутствует разрешение VPN',
			'failure.connectivity.missingNotificationPermission' => 'Отсутствует разрешение на показ уведомлений',
			'failure.connectivity.core' => 'Ошибка ядра',
			'failure.profiles.unexpected' => 'Непредвиденная ошибка',
			'failure.profiles.notFound' => 'Профиль не найден',
			'failure.profiles.invalidConfig' => 'Неправильная конфигурация',
			'failure.profiles.invalidUrl' => 'Неправильный URL',
			'failure.connection.unexpected' => 'Неожиданная ошибка подключения',
			'failure.connection.timeout' => 'Истекло время подключения',
			'failure.connection.badResponse' => 'Неправильный ответ',
			'failure.connection.connectionError' => 'Ошибка подключения',
			'failure.connection.badCertificate' => 'Неправильный сертификат',
			'connection.tapToConnect' => 'Нажмите для подключения',
			'connection.connecting' => 'Подключение',
			'connection.disconnecting' => 'Отключение',
			'connection.connected' => 'Подключено',
			'connection.reconnect' => 'Восстановить соединение',
			'connection.connectAnyWay' => 'Подключиться',
			'connection.experimentalNotice' => 'Экспериментальные функции в использовании',
			'connection.experimentalNoticeMsg' => 'Вы включили некоторые экспериментальные функции, которые могут повлиять на качество соединения и вызвать непредвиденные ошибки. Вы всегда можете изменить или сбросить эти параметры на странице параметров конфигурации.',
			'connection.disableExperimentalNotice' => 'Больше не показывать',
			'connection.reconnectMsg' => 'Переподключение для применения изменений...',
			'config.core' => 'Ядро',
			'config.useXrayCoreWhenPossible.Label' => 'Использовать Xray-core по возможности',
			'config.useXrayCoreWhenPossible.Description' => 'Использование Xray-core для анализа подписок. Чтобы включить эту опцию, вам необходимо повторно импортировать подписку.',
			'config.resetBtn' => 'Сбросить параметры',
			'config.serviceMode' => 'Режим работы',
			'config.quickSettings' => 'Быстрые настройки',
			'config.allOptions' => 'Все параметры ',
			'config.serviceModes.proxy' => 'Прокси',
			'config.serviceModes.systemProxy' => 'Системный прокси',
			'config.serviceModes.tun' => 'VPN',
			'config.serviceModes.tunService' => 'VPN Сервис',
			'config.shortServiceModes.proxy' => 'Прокси',
			'config.shortServiceModes.systemProxy' => 'Системный прокси',
			'config.shortServiceModes.tun' => 'VPN',
			'config.shortServiceModes.tunService' => 'VPN Сервис',
			'config.section.route' => 'Варианты маршрутизации',
			'config.section.dns' => 'Параметры DNS',
			'config.section.dnsExplanation' => 'Удалённый DNS используется для сайтов через VPN (зарубежные). Прямой DNS — для сайтов без VPN (российские, из списка обхода). Это гарантирует что российские сайты получают правильные IP адреса.',
			'config.section.inbound' => 'Входящие параметры',
			'config.section.mux' => 'Мультиплексор',
			'config.section.outbound' => 'Исходящие параметры',
			'config.section.tlsTricks' => 'Хитрости TLS',
			'config.section.misc' => 'Разные параметры',
			'config.pageTitle' => 'Параметры конфигурации',
			'config.logLevel' => 'Уровень логирования',
			'config.blockAds' => 'Блокировать рекламу',
			'config.blockAdsHint' => 'Блокирует рекламу в приложениях и браузерах',
			'config.blockAdsTooltip' => 'Рекламные запросы блокируются на сетевом уровне. Работает во всех приложениях, не только в браузерах. Некоторые сайты могут сломаться — отключите при проблемах.',
			'config.resolveDestination' => 'Определять назначение',
			'config.remoteDnsAddress' => 'Удалённый DNS',
			'config.remoteDnsDomainStrategy' => 'Стратегия удалённого домена DNS',
			'config.directDnsAddress' => 'Прямой DNS',
			'config.directDnsDomainStrategy' => 'Стратегия прямого домена DNS',
			'config.mixedPort' => 'Смешанный порт',
			'config.mixedPortHint' => 'Локальный прокси-порт для работы приложения (HTTP/SOCKS5)',
			'config.tproxyPort' => 'Прозрачный прокси порт',
			'config.tproxyPortHint' => 'Используется TUN режимом для перехвата трафика',
			'config.localDnsPort' => 'Локальный порт DNS',
			'config.localDnsPortHint' => 'Локальный DNS-сервер для обхода блокировок',
			'config.allowConnectionFromLan' => 'Общий доступ к VPN в локальной сети',
			'config.tunImplementation' => 'Реализация TUN',
			'config.mtu' => 'Размер пакета (MTU)',
			'config.connectionTestUrl' => 'URL для проверки подключения',
			'config.urlTestInterval' => 'Интервал проверки URL',
			'config.enableTun' => 'Использовать TUN',
			'config.setSystemProxy' => 'Установить системный прокси',
			'config.enableDnsRouting' => 'Использовать маршрутизацию DNS',
			'config.enableFakeDns' => 'Использовать поддельный DNS',
			'config.bypassLan' => 'Домашняя сеть напрямую',
			'config.bypassLanHint' => 'Доступ к роутеру, принтеру и другим устройствам в домашней сети (192.168.x.x)',
			'config.excludedDomains' => 'Свои сайты (вручную)',
			'config.excludedDomainsHint' => 'Сайты которые не работают через VPN (банки, госуслуги). Пример: *.sberbank.ru, gosuslugi.ru',
			'config.excludedIps' => 'Свои IP адреса (вручную)',
			'config.excludedIpsHint' => 'IP адреса которые должны работать напрямую. Пример: 192.168.1.100, 10.0.0.0/8',
			'config.excludedProcesses' => 'Свои программы (вручную)',
			'config.excludedProcessesHint' => 'Игры и программы которые плохо работают через VPN. Пример: Steam.exe, Discord.exe',
			'config.bypassRussianDomains' => 'Российские сайты напрямую',
			'config.bypassRussianDomainsHint' => 'Российские сайты быстрее без VPN (.ru, яндекс, вк, одноклассники и др.)',
			'config.bypassRussianIps' => 'Российские IP напрямую',
			'config.bypassRussianIpsHint' => 'Весь российский интернет напрямую (даже если домен не .ru)',
			'config.russianGeositeUrl' => 'URL фильтра российских доменов',
			'config.russianGeositeUrlHint' => 'URL бинарного файла правил sing-box (.srs) со списком российских доменов',
			'config.russianGeoipUrl' => 'URL фильтра российских IP',
			'config.russianGeoipUrlHint' => 'URL бинарного файла правил sing-box (.srs) с диапазонами российских IP',
			'config.blockAdsRuleSetUrls' => 'URL фильтров блокировки рекламы',
			'config.blockAdsRuleSetUrlsHint' => 'URL бинарных файлов правил sing-box (.srs) для блокировки рекламы. По одному на строку',
			'config.ruleSetUrlsSection' => 'Свои URL фильтров',
			'config.ruleSetUrlsSectionHint' => 'Заменить стандартные источники фильтров на свои URL (формат sing-box .srs)',
			'config.ruleSetUpdateInterval' => 'Интервал обновления фильтров',
			'config.ruleSetUpdateIntervalHint' => 'Как часто проверять обновления списков фильтров (кешируются локально)',
			'config.forceUpdateRuleSets' => 'Обновить фильтры сейчас',
			'config.forceUpdateRuleSetsHint' => 'Принудительно скачать последние списки фильтров',
			'config.ruleSetUpdated' => 'Списки фильтров обновлены',
			'config.ruleSetUpdateFailed' => 'Не удалось обновить списки фильтров',
			'config.ruleSetUpdating' => 'Обновление фильтров...',
			'config.requiresReconnect' => 'Требует переподключения',
			'config.requiresReconnectTooltip' => 'Изменения применятся после переподключения',
			'config.exclusionListHint' => 'По одному на строку',
			'config.exclusionItemSingular' => 'запись',
			'config.exclusionItemPlural' => 'записей',
			'config.ruleSetUrlInvalid' => 'Неверный формат URL',
			'config.ruleSetUrlMustEndWithSrs' => 'URL должен заканчиваться на .srs',
			'config.ruleSetUrlLine' => 'Строка',
			'config.ruleSetUrlFormat' => 'URL должны быть HTTP(S) и заканчиваться на .srs',
			'config.ruleSetUrlMoreErrors' => ({required Object count}) => 'ещё ${count} ошибок',
			'config.processPickerTabSelect' => 'Выбрать из списка',
			'config.processPickerTabManual' => 'Ввести вручную',
			'config.processPickerSearch' => 'Поиск процессов...',
			'config.processPickerRefresh' => 'Обновить список',
			'config.processPickerSelected' => 'Выбрано',
			'config.processPickerError' => 'Не удалось загрузить процессы',
			'config.processPickerEmpty' => 'Процессы не найдены',
			'config.processNotRunning' => 'не запущен',
			'config.strictRoute' => 'Строгая маршрутизация',
			'config.strictRouteHint' => 'Предотвращает утечки DNS и блокирует трафик вне VPN',
			'config.strictRouteTooltip' => 'Может вызвать проблемы с VirtualBox и похожими приложениями',
			'config.lanBypassIps' => 'Домашняя сеть (подсети)',
			'config.lanBypassIpsHint' => 'Диапазоны IP домашней сети которые обходят VPN. Пример: 192.168.0.0/16, 10.0.0.0/8',
			'config.lanBypassIpsDefault' => '192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12',
			'config.dayOne' => 'день',
			'config.dayFew' => 'дня',
			'config.dayMany' => 'дней',
			'config.minuteOne' => 'минута',
			'config.minuteFew' => 'минуты',
			'config.minuteMany' => 'минут',
			'config.tunAddress' => 'Подсеть VPN',
			'config.tunAddressHint' => 'IP-адрес TUN интерфейса в формате CIDR (напр. 100.64.0.1/28)',
			'config.enableTlsFragment' => 'Включить Фрагментацию TLS',
			'config.tlsFragmentSize' => 'Размер фрагмента TLS',
			'config.tlsFragmentSleep' => 'Сон фрагмента TLS',
			'config.enableTlsMixedSniCase' => 'Включить TLS Mixed SNI Case',
			'config.enableTlsPadding' => 'Включить TLS Padding',
			'config.tlsPaddingSize' => 'TLS Padding',
			'config.enableMux' => 'Включить Mux',
			'config.muxProtocol' => 'Протокол Mux',
			'config.muxMaxStreams' => 'Масимальное количество параллельных потоков',
			'config.wgServer.title' => 'Раздать VPN через WireGuard',
			'config.wgServer.enable' => 'Включить WireGuard сервер',
			'config.wgServer.enableHint' => 'Позволяет мобильным устройствам в вашей сети подключаться через WireGuard',
			'config.wgServer.port' => 'UDP порт',
			'config.wgServer.subnet' => 'Подсеть WireGuard',
			'config.wgServer.statusEnabled' => 'Включен',
			'config.wgServer.statusDisabled' => 'Выключен',
			'config.wgServer.enableToShowQR' => 'Включите WireGuard сервер, чтобы показать QR-код',
			'config.wgServer.scanInstructions' => 'Отсканируйте этот QR-код приложением WireGuard на телефоне',
			'config.wgServer.serverAddress' => 'Сервер',
			'config.wgServer.copyConfig' => 'Скопировать конфиг',
			'config.wgServer.configError' => 'Ключи ещё не сгенерированы. Перезапустите приложение.',
			'config.wgServer.securityWarning' => 'WireGuard сервер доступен только из вашей локальной сети. Не показывайте QR-код публично — он содержит приватные ключи.',
			'config.wgServer.keysGenerated' => 'Ключи WireGuard успешно сгенерированы',
			'config.wgServer.noKeys' => 'Ключи WireGuard ещё не сгенерированы',
			'config.wgServer.generateKeys' => 'Сгенерировать ключи',
			'config.wgServer.regenerateKeys' => 'Перегенерировать',
			'window.hide' => 'Скрыть',
			'window.close' => 'Закрыть',
			'window.alertMessage' => 'Скрыть приложение или выйти?',
			'window.remember' => 'Запомнить выбор',
			_ => null,
		};
	}
}
