///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsGeneralEn general = TranslationsGeneralEn.internal(_root);
	late final TranslationsIntroEn intro = TranslationsIntroEn.internal(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn.internal(_root);
	late final TranslationsStatsEn stats = TranslationsStatsEn.internal(_root);
	late final TranslationsProfileEn profile = TranslationsProfileEn.internal(_root);
	late final TranslationsProxiesEn proxies = TranslationsProxiesEn.internal(_root);
	late final TranslationsLogsEn logs = TranslationsLogsEn.internal(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn.internal(_root);
	late final TranslationsAboutEn about = TranslationsAboutEn.internal(_root);
	late final TranslationsTrayEn tray = TranslationsTrayEn.internal(_root);
	late final TranslationsFailureEn failure = TranslationsFailureEn.internal(_root);
	late final TranslationsConnectionEn connection = TranslationsConnectionEn.internal(_root);
	late final TranslationsConfigEn config = TranslationsConfigEn.internal(_root);
	late final TranslationsWindowEn window = TranslationsWindowEn.internal(_root);
}

// Path: general
class TranslationsGeneralEn {
	TranslationsGeneralEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hiddify'
	String get appTitle => 'Hiddify';

	/// en: 'Reset'
	String get reset => 'Reset';

	late final TranslationsGeneralToggleEn toggle = TranslationsGeneralToggleEn.internal(_root);
	late final TranslationsGeneralStateEn state = TranslationsGeneralStateEn.internal(_root);

	/// en: 'Sort'
	String get sort => 'Sort';

	/// en: 'Sort by'
	String get sortBy => 'Sort by';

	/// en: 'Add To Clipboard'
	String get addToClipboard => 'Add To Clipboard';

	/// en: 'Not Set'
	String get notSet => 'Not Set';

	/// en: 'Agree'
	String get agree => 'Agree';

	/// en: 'Decline'
	String get decline => 'Decline';

	/// en: 'Unknown'
	String get unknown => 'Unknown';

	/// en: 'Hidden'
	String get hidden => 'Hidden';

	/// en: 'Timeout'
	String get timeout => 'Timeout';

	/// en: 'Added To Clipboard'
	String get clipboardExportSuccessMsg => 'Added To Clipboard';

	/// en: 'Show More'
	String get showMore => 'Show More';

	/// en: 'Show Less'
	String get showLess => 'Show Less';

	/// en: 'Open App Settings'
	String get openAppSettings => 'Open App Settings';

	/// en: 'Grant Permission'
	String get grantPermission => 'Grant Permission';
}

// Path: intro
class TranslationsIntroEn {
	TranslationsIntroEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'By Continuing You Agree With ${tap(Terms and Conditions)}'
	TextSpan termsAndPolicyCaution({required InlineSpanBuilder tap}) => TextSpan(children: [
		const TextSpan(text: 'By Continuing You Agree With '),
		tap(_root.about.termsAndConditions),
	]);

	/// en: 'Start'
	String get start => 'Start';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get pageTitle => 'Home';

	/// en: 'Begin by Adding a Subscription Profile'
	String get emptyProfilesMsg => 'Begin by Adding a Subscription Profile';

	/// en: 'Choose a Profile'
	String get noActiveProfileMsg => 'Choose a Profile';
}

// Path: stats
class TranslationsStatsEn {
	TranslationsStatsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Traffic'
	String get traffic => 'Traffic';

	/// en: 'Live Traffic'
	String get trafficLive => 'Live Traffic';

	/// en: 'Total Traffic'
	String get trafficTotal => 'Total Traffic';

	/// en: 'Uplink'
	String get uplink => 'Uplink';

	/// en: 'Downlink'
	String get downlink => 'Downlink';

	/// en: 'Connection'
	String get connection => 'Connection';

	/// en: 'Speed'
	String get speed => 'Speed';

	/// en: 'Total Transferred'
	String get totalTransferred => 'Total Transferred';
}

// Path: profile
class TranslationsProfileEn {
	TranslationsProfileEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profiles'
	String get overviewPageTitle => 'Profiles';

	/// en: 'Profile'
	String get detailsPageTitle => 'Profile';

	/// en: 'Active Profile Name: "${name}".'
	String activeProfileNameSemanticLabel({required Object name}) => 'Active Profile Name: "${name}".';

	/// en: 'View All Profiles'
	String get activeProfileBtnSemanticLabel => 'View All Profiles';

	/// en: 'Select "${name}" as Active Profile'
	String nonActiveProfileBtnSemanticLabel({required Object name}) => 'Select "${name}" as Active Profile';

	late final TranslationsProfileSubscriptionEn subscription = TranslationsProfileSubscriptionEn.internal(_root);
	late final TranslationsProfileSortByEn sortBy = TranslationsProfileSortByEn.internal(_root);
	late final TranslationsProfileAddEn add = TranslationsProfileAddEn.internal(_root);
	late final TranslationsProfileUpdateEn update = TranslationsProfileUpdateEn.internal(_root);
	late final TranslationsProfileShareEn share = TranslationsProfileShareEn.internal(_root);
	late final TranslationsProfileEditEn edit = TranslationsProfileEditEn.internal(_root);
	late final TranslationsProfileDeleteEn delete = TranslationsProfileDeleteEn.internal(_root);
	late final TranslationsProfileSaveEn save = TranslationsProfileSaveEn.internal(_root);
	late final TranslationsProfileDetailsFormEn detailsForm = TranslationsProfileDetailsFormEn.internal(_root);
}

// Path: proxies
class TranslationsProxiesEn {
	TranslationsProxiesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Proxies'
	String get pageTitle => 'Proxies';

	/// en: 'No Proxies Available'
	String get emptyProxiesMsg => 'No Proxies Available';

	/// en: 'Test Delay'
	String get delayTestTooltip => 'Test Delay';

	/// en: 'Sort Proxies'
	String get sortTooltip => 'Sort Proxies';

	/// en: 'Check IP'
	String get checkIp => 'Check IP';

	/// en: 'Unknown IP'
	String get unknownIp => 'Unknown IP';

	late final TranslationsProxiesSortOptionsEn sortOptions = TranslationsProxiesSortOptionsEn.internal(_root);

	/// en: 'Active Proxy'
	String get activeProxySemanticLabel => 'Active Proxy';

	late final TranslationsProxiesDelaySemanticsEn delaySemantics = TranslationsProxiesDelaySemanticsEn.internal(_root);
	late final TranslationsProxiesIpInfoSemanticsEn ipInfoSemantics = TranslationsProxiesIpInfoSemanticsEn.internal(_root);
}

// Path: logs
class TranslationsLogsEn {
	TranslationsLogsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Logs'
	String get pageTitle => 'Logs';

	/// en: 'Filter'
	String get filterHint => 'Filter';

	/// en: 'All'
	String get allLevelsFilter => 'All';

	/// en: 'Share Core Logs'
	String get shareCoreLogs => 'Share Core Logs';

	/// en: 'Share App Logs'
	String get shareAppLogs => 'Share App Logs';

	/// en: 'Pause'
	String get pauseTooltip => 'Pause';

	/// en: 'Resume'
	String get resumeTooltip => 'Resume';

	/// en: 'Clear'
	String get clearTooltip => 'Clear';
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get pageTitle => 'Settings';

	/// en: 'For this to take effect restart the app'
	String get requiresRestartMsg => 'For this to take effect restart the app';

	/// en: 'Experimental'
	String get experimental => 'Experimental';

	/// en: 'Features with Experimental flag are still in development and might cause issues.'
	String get experimentalMsg => 'Features with Experimental flag are still in development and might cause issues.';

	/// en: 'Copy Anonymous Options to Clipboard'
	String get exportOptions => 'Copy Anonymous Options to Clipboard';

	/// en: 'Copy All Options to Clipboard'
	String get exportAllOptions => 'Copy All Options to Clipboard';

	/// en: 'Import Options From Clipboard'
	String get importOptions => 'Import Options From Clipboard';

	/// en: 'This will rewrite all config options with provided values. Are you sure?'
	String get importOptionsMsg => 'This will rewrite all config options with provided values. Are you sure?';

	late final TranslationsSettingsGeneralEn general = TranslationsSettingsGeneralEn.internal(_root);
	late final TranslationsSettingsAdvancedEn advanced = TranslationsSettingsAdvancedEn.internal(_root);
	late final TranslationsSettingsNetworkEn network = TranslationsSettingsNetworkEn.internal(_root);
}

// Path: about
class TranslationsAboutEn {
	TranslationsAboutEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About'
	String get pageTitle => 'About';

	/// en: 'Version'
	String get version => 'Version';

	/// en: 'Source Code'
	String get sourceCode => 'Source Code';

	/// en: 'Original Hiddify'
	String get originalProject => 'Original Hiddify';

	/// en: 'Privacy Policy'
	String get privacyPolicy => 'Privacy Policy';

	/// en: 'Terms and Conditions'
	String get termsAndConditions => 'Terms and Conditions';

	late final TranslationsAboutYumashEn yumash = TranslationsAboutYumashEn.internal(_root);
}

// Path: tray
class TranslationsTrayEn {
	TranslationsTrayEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dashboard'
	String get dashboard => 'Dashboard';

	/// en: 'Quit'
	String get quit => 'Quit';

	/// en: 'Open'
	String get open => 'Open';

	late final TranslationsTrayStatusEn status = TranslationsTrayStatusEn.internal(_root);
}

// Path: failure
class TranslationsFailureEn {
	TranslationsFailureEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unexpected Error'
	String get unexpected => 'Unexpected Error';

	late final TranslationsFailureSingboxEn singbox = TranslationsFailureSingboxEn.internal(_root);
	late final TranslationsFailureConnectivityEn connectivity = TranslationsFailureConnectivityEn.internal(_root);
	late final TranslationsFailureProfilesEn profiles = TranslationsFailureProfilesEn.internal(_root);
	late final TranslationsFailureConnectionEn connection = TranslationsFailureConnectionEn.internal(_root);
}

// Path: connection
class TranslationsConnectionEn {
	TranslationsConnectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tap To Connect'
	String get tapToConnect => 'Tap To Connect';

	/// en: 'Connecting'
	String get connecting => 'Connecting';

	/// en: 'Disconnecting'
	String get disconnecting => 'Disconnecting';

	/// en: 'Connected'
	String get connected => 'Connected';

	/// en: 'Reconnect'
	String get reconnect => 'Reconnect';

	/// en: 'Connect'
	String get connectAnyWay => 'Connect';

	/// en: 'Experimental Features In Use'
	String get experimentalNotice => 'Experimental Features In Use';

	/// en: 'You've enabled some experimental features which might affect connection quality and cause unexpected errors. You can always change or reset these options from Config options page.'
	String get experimentalNoticeMsg => 'You\'ve enabled some experimental features which might affect connection quality and cause unexpected errors. You can always change or reset these options from Config options page.';

	/// en: 'Don't Show Again'
	String get disableExperimentalNotice => 'Don\'t Show Again';

	/// en: 'Reconnecting for taking into account the changes...'
	String get reconnectMsg => 'Reconnecting for taking into account the changes...';
}

// Path: config
class TranslationsConfigEn {
	TranslationsConfigEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Core'
	String get core => 'Core';

	late final TranslationsConfigUseXrayCoreWhenPossibleEn useXrayCoreWhenPossible = TranslationsConfigUseXrayCoreWhenPossibleEn.internal(_root);

	/// en: 'Reset Options'
	String get resetBtn => 'Reset Options';

	/// en: 'Service Mode'
	String get serviceMode => 'Service Mode';

	/// en: 'Quick Settings'
	String get quickSettings => 'Quick Settings';

	/// en: 'All Config Options'
	String get allOptions => 'All Config Options';

	late final TranslationsConfigServiceModesEn serviceModes = TranslationsConfigServiceModesEn.internal(_root);
	late final TranslationsConfigShortServiceModesEn shortServiceModes = TranslationsConfigShortServiceModesEn.internal(_root);
	late final TranslationsConfigSectionEn section = TranslationsConfigSectionEn.internal(_root);

	/// en: 'Config Options'
	String get pageTitle => 'Config Options';

	/// en: 'Log Level'
	String get logLevel => 'Log Level';

	/// en: 'Block Advertisements'
	String get blockAds => 'Block Advertisements';

	/// en: 'Blocks ads in apps and browsers'
	String get blockAdsHint => 'Blocks ads in apps and browsers';

	/// en: 'Ad requests are blocked at the network level. Works in all apps, not just browsers. Some sites may break — disable if you have issues.'
	String get blockAdsTooltip => 'Ad requests are blocked at the network level. Works in all apps, not just browsers. Some sites may break — disable if you have issues.';

	/// en: 'Resolve Destination'
	String get resolveDestination => 'Resolve Destination';

	/// en: 'Remote DNS'
	String get remoteDnsAddress => 'Remote DNS';

	/// en: 'Remote DNS Domain Strategy'
	String get remoteDnsDomainStrategy => 'Remote DNS Domain Strategy';

	/// en: 'Direct DNS'
	String get directDnsAddress => 'Direct DNS';

	/// en: 'Direct DNS Domain Strategy'
	String get directDnsDomainStrategy => 'Direct DNS Domain Strategy';

	/// en: 'Mixed Port'
	String get mixedPort => 'Mixed Port';

	/// en: 'Local proxy port for the app to work (HTTP/SOCKS5)'
	String get mixedPortHint => 'Local proxy port for the app to work (HTTP/SOCKS5)';

	/// en: 'Transparent Proxy Port'
	String get tproxyPort => 'Transparent Proxy Port';

	/// en: 'Used by TUN mode to intercept traffic'
	String get tproxyPortHint => 'Used by TUN mode to intercept traffic';

	/// en: 'Local DNS Port'
	String get localDnsPort => 'Local DNS Port';

	/// en: 'Local DNS server for bypassing blocks'
	String get localDnsPortHint => 'Local DNS server for bypassing blocks';

	/// en: 'Share VPN in Local Network'
	String get allowConnectionFromLan => 'Share VPN in Local Network';

	/// en: 'TUN Implementation'
	String get tunImplementation => 'TUN Implementation';

	/// en: 'Packet Size (MTU)'
	String get mtu => 'Packet Size (MTU)';

	/// en: 'Connection Test URL'
	String get connectionTestUrl => 'Connection Test URL';

	/// en: 'URL Test Interval'
	String get urlTestInterval => 'URL Test Interval';

	/// en: 'Enable TUN'
	String get enableTun => 'Enable TUN';

	/// en: 'Set System Proxy'
	String get setSystemProxy => 'Set System Proxy';

	/// en: 'Enable DNS Routing'
	String get enableDnsRouting => 'Enable DNS Routing';

	/// en: 'Enable Fake DNS'
	String get enableFakeDns => 'Enable Fake DNS';

	/// en: 'Home network direct'
	String get bypassLan => 'Home network direct';

	/// en: 'Access router, printer and other devices on home network (192.168.x.x)'
	String get bypassLanHint => 'Access router, printer and other devices on home network (192.168.x.x)';

	/// en: 'Custom sites (manual)'
	String get excludedDomains => 'Custom sites (manual)';

	/// en: 'Sites that don't work through VPN (banks, government). Example: *.bank.com, gov.site'
	String get excludedDomainsHint => 'Sites that don\'t work through VPN (banks, government). Example: *.bank.com, gov.site';

	/// en: 'Custom IP addresses (manual)'
	String get excludedIps => 'Custom IP addresses (manual)';

	/// en: 'IP addresses that should work directly. Example: 192.168.1.100, 10.0.0.0/8'
	String get excludedIpsHint => 'IP addresses that should work directly. Example: 192.168.1.100, 10.0.0.0/8';

	/// en: 'Custom programs (manual)'
	String get excludedProcesses => 'Custom programs (manual)';

	/// en: 'Games and apps that work poorly through VPN. Example: Steam.exe, Discord.exe'
	String get excludedProcessesHint => 'Games and apps that work poorly through VPN. Example: Steam.exe, Discord.exe';

	/// en: 'Russian sites direct'
	String get bypassRussianDomains => 'Russian sites direct';

	/// en: 'Russian sites faster without VPN (.ru, yandex, vk, ok and others)'
	String get bypassRussianDomainsHint => 'Russian sites faster without VPN (.ru, yandex, vk, ok and others)';

	/// en: 'Russian IPs direct'
	String get bypassRussianIps => 'Russian IPs direct';

	/// en: 'All Russian internet direct (even if domain is not .ru)'
	String get bypassRussianIpsHint => 'All Russian internet direct (even if domain is not .ru)';

	/// en: 'Russian domains filter URL'
	String get russianGeositeUrl => 'Russian domains filter URL';

	/// en: 'URL to sing-box binary rule-set (.srs) containing Russian domain list'
	String get russianGeositeUrlHint => 'URL to sing-box binary rule-set (.srs) containing Russian domain list';

	/// en: 'Russian IPs filter URL'
	String get russianGeoipUrl => 'Russian IPs filter URL';

	/// en: 'URL to sing-box binary rule-set (.srs) containing Russian IP ranges'
	String get russianGeoipUrlHint => 'URL to sing-box binary rule-set (.srs) containing Russian IP ranges';

	/// en: 'Ad blocking filter URLs'
	String get blockAdsRuleSetUrls => 'Ad blocking filter URLs';

	/// en: 'URLs to sing-box binary rule-sets (.srs) for blocking ads/malware. One URL per line'
	String get blockAdsRuleSetUrlsHint => 'URLs to sing-box binary rule-sets (.srs) for blocking ads/malware. One URL per line';

	/// en: 'Custom filter URLs'
	String get ruleSetUrlsSection => 'Custom filter URLs';

	/// en: 'Override default filter sources with custom URLs (sing-box .srs format)'
	String get ruleSetUrlsSectionHint => 'Override default filter sources with custom URLs (sing-box .srs format)';

	/// en: 'Rule-set update interval'
	String get ruleSetUpdateInterval => 'Rule-set update interval';

	/// en: 'How often to check for filter list updates (cached locally)'
	String get ruleSetUpdateIntervalHint => 'How often to check for filter list updates (cached locally)';

	/// en: 'Update filters now'
	String get forceUpdateRuleSets => 'Update filters now';

	/// en: 'Force download latest filter lists'
	String get forceUpdateRuleSetsHint => 'Force download latest filter lists';

	/// en: 'Filter lists updated'
	String get ruleSetUpdated => 'Filter lists updated';

	/// en: 'Failed to update filter lists'
	String get ruleSetUpdateFailed => 'Failed to update filter lists';

	/// en: 'Updating filters...'
	String get ruleSetUpdating => 'Updating filters...';

	/// en: 'Requires reconnect'
	String get requiresReconnect => 'Requires reconnect';

	/// en: 'Changes will apply after reconnecting'
	String get requiresReconnectTooltip => 'Changes will apply after reconnecting';

	/// en: 'One item per line'
	String get exclusionListHint => 'One item per line';

	/// en: 'item'
	String get exclusionItemSingular => 'item';

	/// en: 'items'
	String get exclusionItemPlural => 'items';

	/// en: 'Invalid URL format'
	String get ruleSetUrlInvalid => 'Invalid URL format';

	/// en: 'URL must end with .srs'
	String get ruleSetUrlMustEndWithSrs => 'URL must end with .srs';

	/// en: 'Line'
	String get ruleSetUrlLine => 'Line';

	/// en: 'URLs must be HTTP(S) and end with .srs'
	String get ruleSetUrlFormat => 'URLs must be HTTP(S) and end with .srs';

	/// en: '${count} more errors'
	String ruleSetUrlMoreErrors({required Object count}) => '${count} more errors';

	/// en: 'Select from list'
	String get processPickerTabSelect => 'Select from list';

	/// en: 'Enter manually'
	String get processPickerTabManual => 'Enter manually';

	/// en: 'Search processes...'
	String get processPickerSearch => 'Search processes...';

	/// en: 'Refresh list'
	String get processPickerRefresh => 'Refresh list';

	/// en: 'Selected'
	String get processPickerSelected => 'Selected';

	/// en: 'Failed to load processes'
	String get processPickerError => 'Failed to load processes';

	/// en: 'No processes found'
	String get processPickerEmpty => 'No processes found';

	/// en: 'not running'
	String get processNotRunning => 'not running';

	/// en: 'Strict Route'
	String get strictRoute => 'Strict Route';

	/// en: 'Prevents DNS leaks and blocks traffic outside VPN'
	String get strictRouteHint => 'Prevents DNS leaks and blocks traffic outside VPN';

	/// en: 'May cause issues with VirtualBox and similar apps'
	String get strictRouteTooltip => 'May cause issues with VirtualBox and similar apps';

	/// en: 'LAN Bypass Subnets'
	String get lanBypassIps => 'LAN Bypass Subnets';

	/// en: 'IP ranges that bypass VPN (local network). Example: 192.168.0.0/16, 10.0.0.0/8'
	String get lanBypassIpsHint => 'IP ranges that bypass VPN (local network). Example: 192.168.0.0/16, 10.0.0.0/8';

	/// en: '192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12'
	String get lanBypassIpsDefault => '192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12';

	/// en: 'day'
	String get dayOne => 'day';

	/// en: 'days'
	String get dayFew => 'days';

	/// en: 'days'
	String get dayMany => 'days';

	/// en: 'minute'
	String get minuteOne => 'minute';

	/// en: 'minutes'
	String get minuteFew => 'minutes';

	/// en: 'minutes'
	String get minuteMany => 'minutes';

	/// en: 'VPN Subnet'
	String get tunAddress => 'VPN Subnet';

	/// en: 'TUN interface IP address in CIDR format (e.g. 100.64.0.1/28)'
	String get tunAddressHint => 'TUN interface IP address in CIDR format (e.g. 100.64.0.1/28)';

	/// en: 'Enable TLS Fragment'
	String get enableTlsFragment => 'Enable TLS Fragment';

	/// en: 'TLS Fragment Size'
	String get tlsFragmentSize => 'TLS Fragment Size';

	/// en: 'TLS Fragment Sleep'
	String get tlsFragmentSleep => 'TLS Fragment Sleep';

	/// en: 'Enable TLS Mixed SNI Case'
	String get enableTlsMixedSniCase => 'Enable TLS Mixed SNI Case';

	/// en: 'Enable TLS Padding'
	String get enableTlsPadding => 'Enable TLS Padding';

	/// en: 'TLS Padding'
	String get tlsPaddingSize => 'TLS Padding';

	/// en: 'Enable Mux'
	String get enableMux => 'Enable Mux';

	/// en: 'Mux Protocol'
	String get muxProtocol => 'Mux Protocol';

	/// en: 'Max Concurrent Streams'
	String get muxMaxStreams => 'Max Concurrent Streams';

	late final TranslationsConfigWgServerEn wgServer = TranslationsConfigWgServerEn.internal(_root);
}

// Path: window
class TranslationsWindowEn {
	TranslationsWindowEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hide'
	String get hide => 'Hide';

	/// en: 'Exit'
	String get close => 'Exit';

	/// en: 'Hide or Exit the application?'
	String get alertMessage => 'Hide or Exit the application?';

	/// en: 'Remember my choice'
	String get remember => 'Remember my choice';
}

// Path: general.toggle
class TranslationsGeneralToggleEn {
	TranslationsGeneralToggleEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Enabled'
	String get enabled => 'Enabled';

	/// en: 'Disabled'
	String get disabled => 'Disabled';
}

// Path: general.state
class TranslationsGeneralStateEn {
	TranslationsGeneralStateEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Disable'
	String get disable => 'Disable';
}

// Path: profile.subscription
class TranslationsProfileSubscriptionEn {
	TranslationsProfileSubscriptionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Traffic'
	String get traffic => 'Traffic';

	/// en: 'Updated ${timeago}'
	String updatedTimeAgo({required Object timeago}) => 'Updated ${timeago}';

	/// en: '${duration} Days Remaining'
	String remainingDuration({required Object duration}) => '${duration} Days Remaining';

	/// en: '${consumed} of ${total} Traffic Consumed'
	String remainingTrafficSemanticLabel({required Object consumed, required Object total}) => '${consumed} of ${total} Traffic Consumed';

	/// en: 'Expired'
	String get expired => 'Expired';

	/// en: 'Out of Quota'
	String get noTraffic => 'Out of Quota';

	/// en: 'Upload'
	String get upload => 'Upload';

	/// en: 'Download'
	String get download => 'Download';

	/// en: 'Total Traffic'
	String get total => 'Total Traffic';

	/// en: 'Expire Date'
	String get expireDate => 'Expire Date';

	/// en: 'Support'
	String get support => 'Support';

	/// en: 'Web Page'
	String get webPage => 'Web Page';
}

// Path: profile.sortBy
class TranslationsProfileSortByEn {
	TranslationsProfileSortByEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Recently Updated'
	String get lastUpdate => 'Recently Updated';

	/// en: 'Alphabetically'
	String get name => 'Alphabetically';
}

// Path: profile.add
class TranslationsProfileAddEn {
	TranslationsProfileAddEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'New Profile'
	String get buttonText => 'New Profile';

	/// en: 'New Profile'
	String get shortBtnTxt => 'New Profile';

	/// en: 'Add From Clipboard'
	String get fromClipboard => 'Add From Clipboard';

	/// en: 'Scan QR Code'
	String get scanQr => 'Scan QR Code';

	late final TranslationsProfileAddQrScannerEn qrScanner = TranslationsProfileAddQrScannerEn.internal(_root);

	/// en: 'Manual Entry'
	String get manually => 'Manual Entry';

	/// en: 'Adding Profile'
	String get addingProfileMsg => 'Adding Profile';

	/// en: 'Failed to Add Profile'
	String get failureMsg => 'Failed to Add Profile';
}

// Path: profile.update
class TranslationsProfileUpdateEn {
	TranslationsProfileUpdateEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Update'
	String get buttonTxt => 'Update';

	/// en: 'Update Profile'
	String get tooltip => 'Update Profile';

	/// en: 'Update Subscriptions'
	String get updateSubscriptions => 'Update Subscriptions';

	/// en: 'Failed to Update Profile'
	String get failureMsg => 'Failed to Update Profile';

	/// en: 'Profile Updated Successfully'
	String get successMsg => 'Profile Updated Successfully';

	/// en: 'Failed to Update "${name}"'
	String namedFailureMsg({required Object name}) => 'Failed to Update "${name}"';

	/// en: '"${name}" Updated Successfully'
	String namedSuccessMsg({required Object name}) => '"${name}" Updated Successfully';
}

// Path: profile.share
class TranslationsProfileShareEn {
	TranslationsProfileShareEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Share'
	String get buttonText => 'Share';

	/// en: 'Exported to Clipboard'
	String get exportToClipboardSuccess => 'Exported to Clipboard';

	/// en: 'Export Subscription Link to Clipboard'
	String get exportSubLinkToClipboard => 'Export Subscription Link to Clipboard';

	/// en: 'Subscription Link QR Code'
	String get subLinkQrCode => 'Subscription Link QR Code';

	/// en: 'Export Configuration to Clipboard'
	String get exportConfigToClipboard => 'Export Configuration to Clipboard';

	/// en: 'Configuration Copied to Clipboard'
	String get exportConfigToClipboardSuccess => 'Configuration Copied to Clipboard';
}

// Path: profile.edit
class TranslationsProfileEditEn {
	TranslationsProfileEditEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Edit'
	String get buttonTxt => 'Edit';

	/// en: 'Select Active Profile'
	String get selectActiveTxt => 'Select Active Profile';
}

// Path: profile.delete
class TranslationsProfileDeleteEn {
	TranslationsProfileDeleteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete'
	String get buttonTxt => 'Delete';

	/// en: 'Delete Profile Permanently?'
	String get confirmationMsg => 'Delete Profile Permanently?';

	/// en: 'Profile Deleted Successfully'
	String get successMsg => 'Profile Deleted Successfully';
}

// Path: profile.save
class TranslationsProfileSaveEn {
	TranslationsProfileSaveEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Save'
	String get buttonText => 'Save';

	/// en: 'Profile Saved Successfully'
	String get successMsg => 'Profile Saved Successfully';

	/// en: 'Failed to Save Profile'
	String get failureMsg => 'Failed to Save Profile';
}

// Path: profile.detailsForm
class TranslationsProfileDetailsFormEn {
	TranslationsProfileDetailsFormEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Name'
	String get nameLabel => 'Name';

	/// en: 'Profile Name'
	String get nameHint => 'Profile Name';

	/// en: 'URL'
	String get urlLabel => 'URL';

	/// en: 'Full Config URL'
	String get urlHint => 'Full Config URL';

	/// en: 'Name Is Required'
	String get emptyNameMsg => 'Name Is Required';

	/// en: 'Invalid URL'
	String get invalidUrlMsg => 'Invalid URL';

	/// en: 'Last Update'
	String get lastUpdate => 'Last Update';

	/// en: 'Auto Update'
	String get updateInterval => 'Auto Update';

	/// en: 'Auto Update Interval (in Hours)'
	String get updateIntervalDialogTitle => 'Auto Update Interval (in Hours)';
}

// Path: proxies.sortOptions
class TranslationsProxiesSortOptionsEn {
	TranslationsProxiesSortOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Default'
	String get unsorted => 'Default';

	/// en: 'Alphabetically'
	String get name => 'Alphabetically';

	/// en: 'By Delay'
	String get delay => 'By Delay';
}

// Path: proxies.delaySemantics
class TranslationsProxiesDelaySemanticsEn {
	TranslationsProxiesDelaySemanticsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delay: ${delay}ms'
	String result({required Object delay}) => 'Delay: ${delay}ms';

	/// en: 'Delay Test Timeout'
	String get timeout => 'Delay Test Timeout';

	/// en: 'Delay: Testing...'
	String get testing => 'Delay: Testing...';
}

// Path: proxies.ipInfoSemantics
class TranslationsProxiesIpInfoSemanticsEn {
	TranslationsProxiesIpInfoSemanticsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'IP Address'
	String get address => 'IP Address';

	/// en: 'Country'
	String get country => 'Country';
}

// Path: settings.general
class TranslationsSettingsGeneralEn {
	TranslationsSettingsGeneralEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'General'
	String get sectionTitle => 'General';

	/// en: 'Language'
	String get locale => 'Language';

	/// en: 'Region'
	String get region => 'Region';

	/// en: 'Helps set default options to bypass domestic addresses'
	String get regionMsg => 'Helps set default options to bypass domestic addresses';

	late final TranslationsSettingsGeneralRegionsEn regions = TranslationsSettingsGeneralRegionsEn.internal(_root);

	/// en: 'Theme Mode'
	String get themeMode => 'Theme Mode';

	late final TranslationsSettingsGeneralThemeModesEn themeModes = TranslationsSettingsGeneralThemeModesEn.internal(_root);

	/// en: 'Enable Analytics'
	String get enableAnalytics => 'Enable Analytics';

	/// en: 'Give permission to collect analytics and send crash reports to improve the app'
	String get enableAnalyticsMsg => 'Give permission to collect analytics and send crash reports to improve the app';

	/// en: 'Start At Login'
	String get autoStart => 'Start At Login';

	/// en: 'Start Minimized'
	String get silentStart => 'Start Minimized';

	/// en: 'Open Working Directory'
	String get openWorkingDir => 'Open Working Directory';

	/// en: 'Disable Battery Optimization'
	String get ignoreBatteryOptimizations => 'Disable Battery Optimization';

	/// en: 'Remove Restrictions For Optimal VPN Performance'
	String get ignoreBatteryOptimizationsMsg => 'Remove Restrictions For Optimal VPN Performance';

	/// en: 'Display Speed in Notification'
	String get dynamicNotification => 'Display Speed in Notification';

	/// en: 'Haptic Feedback'
	String get hapticFeedback => 'Haptic Feedback';

	/// en: 'Automatically Check Connection IP'
	String get autoIpCheck => 'Automatically Check Connection IP';

	/// en: 'Action at closing'
	String get actionAtClosing => 'Action at closing';

	late final TranslationsSettingsGeneralActionsAtClosingEn actionsAtClosing = TranslationsSettingsGeneralActionsAtClosingEn.internal(_root);
}

// Path: settings.advanced
class TranslationsSettingsAdvancedEn {
	TranslationsSettingsAdvancedEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Advanced'
	String get sectionTitle => 'Advanced';

	/// en: 'Debug Mode'
	String get debugMode => 'Debug Mode';

	/// en: 'Restart the app for applying this change'
	String get debugModeMsg => 'Restart the app for applying this change';

	/// en: 'Memory Limit'
	String get memoryLimit => 'Memory Limit';

	/// en: 'Enable if you're experiencing out of memory errors or frequent app crash'
	String get memoryLimitMsg => 'Enable if you\'re experiencing out of memory errors or frequent app crash';

	/// en: 'Reset VPN Profile'
	String get resetTunnel => 'Reset VPN Profile';
}

// Path: settings.network
class TranslationsSettingsNetworkEn {
	TranslationsSettingsNetworkEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Per-App Proxy'
	String get perAppProxyPageTitle => 'Per-App Proxy';

	late final TranslationsSettingsNetworkPerAppProxyModesEn perAppProxyModes = TranslationsSettingsNetworkPerAppProxyModesEn.internal(_root);

	/// en: 'Show System Apps'
	String get showSystemApps => 'Show System Apps';

	/// en: 'Hide System Apps'
	String get hideSystemApps => 'Hide System Apps';

	/// en: 'Clear Selection'
	String get clearSelection => 'Clear Selection';
}

// Path: about.yumash
class TranslationsAboutYumashEn {
	TranslationsAboutYumashEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Yumash Edition — What's changed'
	String get title => 'Yumash Edition — What\'s changed';

	/// en: 'Added'
	String get added => 'Added';

	/// en: 'Removed'
	String get removed => 'Removed';

	/// en: 'Improved'
	String get improved => 'Improved';

	/// en: 'Bypass Russian domains and IPs (geosite-ru, geoip-ru)'
	String get featureBypassRu => 'Bypass Russian domains and IPs (geosite-ru, geoip-ru)';

	/// en: 'Block ads with customizable filter URLs'
	String get featureBlockAds => 'Block ads with customizable filter URLs';

	/// en: 'Process picker from running list'
	String get featureProcessPicker => 'Process picker from running list';

	/// en: 'Portable mode (settings next to exe)'
	String get featurePortable => 'Portable mode (settings next to exe)';

	/// en: 'TUN subnet CGNAT (100.64.0.1/28)'
	String get featureTunCgnat => 'TUN subnet CGNAT (100.64.0.1/28)';

	/// en: 'Dual-core: sing-box + Xray-core'
	String get featureDualCore => 'Dual-core: sing-box + Xray-core';

	/// en: 'Full Hiddify Manager support (xhttp, TLS tricks)'
	String get featureHiddifyManager => 'Full Hiddify Manager support (xhttp, TLS tricks)';

	/// en: 'TLS Tricks: Mixed SNI Case, fragmentation'
	String get featureTlsTricks => 'TLS Tricks: Mixed SNI Case, fragmentation';

	/// en: 'Rule-set caching with configurable interval'
	String get featureRulesetCache => 'Rule-set caching with configurable interval';

	/// en: 'Provider support buttons from subscription'
	String get featureProviderButtons => 'Provider support buttons from subscription';

	/// en: 'Platforms: iOS, Android, Linux, macOS'
	String get removedPlatforms => 'Platforms: iOS, Android, Linux, macOS';

	/// en: 'IPv6 support'
	String get removedIpv6 => 'IPv6 support';

	/// en: 'Cloudflare WARP'
	String get removedWarp => 'Cloudflare WARP';

	/// en: 'Clash API'
	String get removedClash => 'Clash API';

	/// en: 'Extension system'
	String get removedExtensions => 'Extension system';

	/// en: 'Auto-update'
	String get removedAutoupdate => 'Auto-update';

	/// en: 'Locales except EN/RU'
	String get removedLocales => 'Locales except EN/RU';

	/// en: 'sing-box extracted from submodule for customization'
	String get improvedSingbox => 'sing-box extracted from submodule for customization';

	/// en: 'Hot proxy switching without reconnect'
	String get improvedHotSwitch => 'Hot proxy switching without reconnect';

	/// en: 'Fixed window size 900x700'
	String get improvedFixedWindow => 'Fixed window size 900x700';

	/// en: 'Support developer'
	String get donate => 'Support developer';

	/// en: 'BTC (ByBit)'
	String get donateBtc => 'BTC (ByBit)';

	/// en: 'USDT TRC20'
	String get donateUsdt => 'USDT TRC20';

	/// en: 'TON'
	String get donateTon => 'TON';
}

// Path: tray.status
class TranslationsTrayStatusEn {
	TranslationsTrayStatusEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Connect'
	String get connect => 'Connect';

	/// en: 'Connecting'
	String get connecting => 'Connecting';

	/// en: 'Disconnect'
	String get disconnect => 'Disconnect';

	/// en: 'Disconnecting'
	String get disconnecting => 'Disconnecting';
}

// Path: failure.singbox
class TranslationsFailureSingboxEn {
	TranslationsFailureSingboxEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unexpected Service Error'
	String get unexpected => 'Unexpected Service Error';

	/// en: 'Service is Not Running'
	String get serviceNotRunning => 'Service is Not Running';

	/// en: 'Missing Privilege'
	String get missingPrivilege => 'Missing Privilege';

	/// en: 'VPN Mode Requires Administrator Privileges. Either relaunch the app as administrator or change service mode.'
	String get missingPrivilegeMsg => 'VPN Mode Requires Administrator Privileges. Either relaunch the app as administrator or change service mode.';

	/// en: 'Invalid Configuration Options'
	String get invalidConfigOptions => 'Invalid Configuration Options';

	/// en: 'Invalid Configuration'
	String get invalidConfig => 'Invalid Configuration';

	/// en: 'Service Creation Error'
	String get create => 'Service Creation Error';

	/// en: 'Service Startup Error'
	String get start => 'Service Startup Error';
}

// Path: failure.connectivity
class TranslationsFailureConnectivityEn {
	TranslationsFailureConnectivityEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unexpected Failure'
	String get unexpected => 'Unexpected Failure';

	/// en: 'Missing VPN Permission'
	String get missingVpnPermission => 'Missing VPN Permission';

	/// en: 'Missing Notification Permission'
	String get missingNotificationPermission => 'Missing Notification Permission';

	/// en: 'Core Error'
	String get core => 'Core Error';
}

// Path: failure.profiles
class TranslationsFailureProfilesEn {
	TranslationsFailureProfilesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unexpected Error'
	String get unexpected => 'Unexpected Error';

	/// en: 'Profile Not Found'
	String get notFound => 'Profile Not Found';

	/// en: 'Invalid Configs'
	String get invalidConfig => 'Invalid Configs';

	/// en: 'Invalid URL'
	String get invalidUrl => 'Invalid URL';
}

// Path: failure.connection
class TranslationsFailureConnectionEn {
	TranslationsFailureConnectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unexpected Connection Error'
	String get unexpected => 'Unexpected Connection Error';

	/// en: 'Connection Timeout'
	String get timeout => 'Connection Timeout';

	/// en: 'Bad Response'
	String get badResponse => 'Bad Response';

	/// en: 'Connection Error'
	String get connectionError => 'Connection Error';

	/// en: 'Bad Certificate'
	String get badCertificate => 'Bad Certificate';
}

// Path: config.useXrayCoreWhenPossible
class TranslationsConfigUseXrayCoreWhenPossibleEn {
	TranslationsConfigUseXrayCoreWhenPossibleEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Use Xray-core When Possible'
	String get Label => 'Use Xray-core When Possible';

	/// en: 'Use Xray-core during parsing sub links. You need to reimport the sub link to enable this option.'
	String get Description => 'Use Xray-core during parsing sub links. You need to reimport the sub link to enable this option.';
}

// Path: config.serviceModes
class TranslationsConfigServiceModesEn {
	TranslationsConfigServiceModesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Proxy Service Only'
	String get proxy => 'Proxy Service Only';

	/// en: 'Set System Proxy'
	String get systemProxy => 'Set System Proxy';

	/// en: 'VPN'
	String get tun => 'VPN';

	/// en: 'VPN Service'
	String get tunService => 'VPN Service';
}

// Path: config.shortServiceModes
class TranslationsConfigShortServiceModesEn {
	TranslationsConfigShortServiceModesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Proxy'
	String get proxy => 'Proxy';

	/// en: 'System Proxy'
	String get systemProxy => 'System Proxy';

	/// en: 'VPN'
	String get tun => 'VPN';

	/// en: 'VPN Service'
	String get tunService => 'VPN Service';
}

// Path: config.section
class TranslationsConfigSectionEn {
	TranslationsConfigSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Route Options'
	String get route => 'Route Options';

	/// en: 'DNS Options'
	String get dns => 'DNS Options';

	/// en: 'Remote DNS is used for sites through VPN (foreign). Direct DNS is for sites without VPN (Russian, from bypass list). This ensures Russian sites get correct IP addresses.'
	String get dnsExplanation => 'Remote DNS is used for sites through VPN (foreign). Direct DNS is for sites without VPN (Russian, from bypass list). This ensures Russian sites get correct IP addresses.';

	/// en: 'Inbound Options'
	String get inbound => 'Inbound Options';

	/// en: 'MultiPlexer'
	String get mux => 'MultiPlexer';

	/// en: 'Outbound Options'
	String get outbound => 'Outbound Options';

	/// en: 'TLS Tricks'
	String get tlsTricks => 'TLS Tricks';

	/// en: 'Misc Options'
	String get misc => 'Misc Options';
}

// Path: config.wgServer
class TranslationsConfigWgServerEn {
	TranslationsConfigWgServerEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Share VPN via WireGuard'
	String get title => 'Share VPN via WireGuard';

	/// en: 'Enable WireGuard Server'
	String get enable => 'Enable WireGuard Server';

	/// en: 'Allow mobile devices in your LAN to connect via WireGuard'
	String get enableHint => 'Allow mobile devices in your LAN to connect via WireGuard';

	/// en: 'UDP Port'
	String get port => 'UDP Port';

	/// en: 'WireGuard Subnet'
	String get subnet => 'WireGuard Subnet';

	/// en: 'Enabled'
	String get statusEnabled => 'Enabled';

	/// en: 'Disabled'
	String get statusDisabled => 'Disabled';

	/// en: 'Enable WireGuard server to show QR code'
	String get enableToShowQR => 'Enable WireGuard server to show QR code';

	/// en: 'Scan this QR code with WireGuard app on your phone'
	String get scanInstructions => 'Scan this QR code with WireGuard app on your phone';

	/// en: 'Server'
	String get serverAddress => 'Server';

	/// en: 'Copy Config'
	String get copyConfig => 'Copy Config';

	/// en: 'Keys not generated yet. Please restart the app.'
	String get configError => 'Keys not generated yet. Please restart the app.';

	/// en: 'WireGuard server is only accessible from your local network. Do not share the QR code publicly — it contains private keys.'
	String get securityWarning => 'WireGuard server is only accessible from your local network. Do not share the QR code publicly — it contains private keys.';

	/// en: 'WireGuard keys generated successfully'
	String get keysGenerated => 'WireGuard keys generated successfully';

	/// en: 'WireGuard keys not generated yet'
	String get noKeys => 'WireGuard keys not generated yet';

	/// en: 'Generate Keys'
	String get generateKeys => 'Generate Keys';

	/// en: 'Regenerate'
	String get regenerateKeys => 'Regenerate';
}

// Path: profile.add.qrScanner
class TranslationsProfileAddQrScannerEn {
	TranslationsProfileAddQrScannerEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Permission Denied'
	String get permissionDeniedError => 'Permission Denied';

	/// en: 'Something Went Wrong'
	String get unexpectedError => 'Something Went Wrong';

	/// en: 'Flash Light'
	String get torchSemanticLabel => 'Flash Light';

	/// en: 'Camera Facing'
	String get facingSemanticLabel => 'Camera Facing';

	/// en: 'Permission to camera to scan QR Code'
	String get permissionRequest => 'Permission to camera to scan QR Code';
}

// Path: settings.general.regions
class TranslationsSettingsGeneralRegionsEn {
	TranslationsSettingsGeneralRegionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Iran (ir) 🇮🇷'
	String get ir => 'Iran (ir) 🇮🇷';

	/// en: 'China (cn) 🇨🇳'
	String get cn => 'China (cn) 🇨🇳';

	/// en: 'Russia (ru) 🇷🇺'
	String get ru => 'Russia (ru) 🇷🇺';

	/// en: 'Afghanistan (af) 🇦🇫'
	String get af => 'Afghanistan (af) 🇦🇫';

	/// en: 'Indonesia (id) 🇮🇩'
	String get id => 'Indonesia (id) 🇮🇩';

	/// en: 'Türkiye (tr) 🇹🇷'
	String get tr => 'Türkiye (tr) 🇹🇷';

	/// en: 'Brazil (br) 🇧🇷'
	String get br => 'Brazil (br) 🇧🇷';

	/// en: 'Other'
	String get other => 'Other';
}

// Path: settings.general.themeModes
class TranslationsSettingsGeneralThemeModesEn {
	TranslationsSettingsGeneralThemeModesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Follow System Theme'
	String get system => 'Follow System Theme';

	/// en: 'Dark Mode'
	String get dark => 'Dark Mode';

	/// en: 'Light Mode'
	String get light => 'Light Mode';

	/// en: 'Black Mode'
	String get black => 'Black Mode';
}

// Path: settings.general.actionsAtClosing
class TranslationsSettingsGeneralActionsAtClosingEn {
	TranslationsSettingsGeneralActionsAtClosingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Ask each time'
	String get askEachTime => 'Ask each time';

	/// en: 'Hide'
	String get hide => 'Hide';

	/// en: 'Exit'
	String get exit => 'Exit';
}

// Path: settings.network.perAppProxyModes
class TranslationsSettingsNetworkPerAppProxyModesEn {
	TranslationsSettingsNetworkPerAppProxyModesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'All'
	String get off => 'All';

	/// en: 'Proxy All Apps'
	String get offMsg => 'Proxy All Apps';

	/// en: 'Proxy'
	String get include => 'Proxy';

	/// en: 'Proxy Only Selected Apps'
	String get includeMsg => 'Proxy Only Selected Apps';

	/// en: 'Bypass'
	String get exclude => 'Bypass';

	/// en: 'Do Not Proxy Selected Apps'
	String get excludeMsg => 'Do Not Proxy Selected Apps';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'general.appTitle' => 'Hiddify',
			'general.reset' => 'Reset',
			'general.toggle.enabled' => 'Enabled',
			'general.toggle.disabled' => 'Disabled',
			'general.state.disable' => 'Disable',
			'general.sort' => 'Sort',
			'general.sortBy' => 'Sort by',
			'general.addToClipboard' => 'Add To Clipboard',
			'general.notSet' => 'Not Set',
			'general.agree' => 'Agree',
			'general.decline' => 'Decline',
			'general.unknown' => 'Unknown',
			'general.hidden' => 'Hidden',
			'general.timeout' => 'Timeout',
			'general.clipboardExportSuccessMsg' => 'Added To Clipboard',
			'general.showMore' => 'Show More',
			'general.showLess' => 'Show Less',
			'general.openAppSettings' => 'Open App Settings',
			'general.grantPermission' => 'Grant Permission',
			'intro.termsAndPolicyCaution' => ({required InlineSpanBuilder tap}) => TextSpan(children: [ const TextSpan(text: 'By Continuing You Agree With '), tap(_root.about.termsAndConditions), ]), 
			'intro.start' => 'Start',
			'home.pageTitle' => 'Home',
			'home.emptyProfilesMsg' => 'Begin by Adding a Subscription Profile',
			'home.noActiveProfileMsg' => 'Choose a Profile',
			'stats.traffic' => 'Traffic',
			'stats.trafficLive' => 'Live Traffic',
			'stats.trafficTotal' => 'Total Traffic',
			'stats.uplink' => 'Uplink',
			'stats.downlink' => 'Downlink',
			'stats.connection' => 'Connection',
			'stats.speed' => 'Speed',
			'stats.totalTransferred' => 'Total Transferred',
			'profile.overviewPageTitle' => 'Profiles',
			'profile.detailsPageTitle' => 'Profile',
			'profile.activeProfileNameSemanticLabel' => ({required Object name}) => 'Active Profile Name: "${name}".',
			'profile.activeProfileBtnSemanticLabel' => 'View All Profiles',
			'profile.nonActiveProfileBtnSemanticLabel' => ({required Object name}) => 'Select "${name}" as Active Profile',
			'profile.subscription.traffic' => 'Traffic',
			'profile.subscription.updatedTimeAgo' => ({required Object timeago}) => 'Updated ${timeago}',
			'profile.subscription.remainingDuration' => ({required Object duration}) => '${duration} Days Remaining',
			'profile.subscription.remainingTrafficSemanticLabel' => ({required Object consumed, required Object total}) => '${consumed} of ${total} Traffic Consumed',
			'profile.subscription.expired' => 'Expired',
			'profile.subscription.noTraffic' => 'Out of Quota',
			'profile.subscription.upload' => 'Upload',
			'profile.subscription.download' => 'Download',
			'profile.subscription.total' => 'Total Traffic',
			'profile.subscription.expireDate' => 'Expire Date',
			'profile.subscription.support' => 'Support',
			'profile.subscription.webPage' => 'Web Page',
			'profile.sortBy.lastUpdate' => 'Recently Updated',
			'profile.sortBy.name' => 'Alphabetically',
			'profile.add.buttonText' => 'New Profile',
			'profile.add.shortBtnTxt' => 'New Profile',
			'profile.add.fromClipboard' => 'Add From Clipboard',
			'profile.add.scanQr' => 'Scan QR Code',
			'profile.add.qrScanner.permissionDeniedError' => 'Permission Denied',
			'profile.add.qrScanner.unexpectedError' => 'Something Went Wrong',
			'profile.add.qrScanner.torchSemanticLabel' => 'Flash Light',
			'profile.add.qrScanner.facingSemanticLabel' => 'Camera Facing',
			'profile.add.qrScanner.permissionRequest' => 'Permission to camera to scan QR Code',
			'profile.add.manually' => 'Manual Entry',
			'profile.add.addingProfileMsg' => 'Adding Profile',
			'profile.add.failureMsg' => 'Failed to Add Profile',
			'profile.update.buttonTxt' => 'Update',
			'profile.update.tooltip' => 'Update Profile',
			'profile.update.updateSubscriptions' => 'Update Subscriptions',
			'profile.update.failureMsg' => 'Failed to Update Profile',
			'profile.update.successMsg' => 'Profile Updated Successfully',
			'profile.update.namedFailureMsg' => ({required Object name}) => 'Failed to Update "${name}"',
			'profile.update.namedSuccessMsg' => ({required Object name}) => '"${name}" Updated Successfully',
			'profile.share.buttonText' => 'Share',
			'profile.share.exportToClipboardSuccess' => 'Exported to Clipboard',
			'profile.share.exportSubLinkToClipboard' => 'Export Subscription Link to Clipboard',
			'profile.share.subLinkQrCode' => 'Subscription Link QR Code',
			'profile.share.exportConfigToClipboard' => 'Export Configuration to Clipboard',
			'profile.share.exportConfigToClipboardSuccess' => 'Configuration Copied to Clipboard',
			'profile.edit.buttonTxt' => 'Edit',
			'profile.edit.selectActiveTxt' => 'Select Active Profile',
			'profile.delete.buttonTxt' => 'Delete',
			'profile.delete.confirmationMsg' => 'Delete Profile Permanently?',
			'profile.delete.successMsg' => 'Profile Deleted Successfully',
			'profile.save.buttonText' => 'Save',
			'profile.save.successMsg' => 'Profile Saved Successfully',
			'profile.save.failureMsg' => 'Failed to Save Profile',
			'profile.detailsForm.nameLabel' => 'Name',
			'profile.detailsForm.nameHint' => 'Profile Name',
			'profile.detailsForm.urlLabel' => 'URL',
			'profile.detailsForm.urlHint' => 'Full Config URL',
			'profile.detailsForm.emptyNameMsg' => 'Name Is Required',
			'profile.detailsForm.invalidUrlMsg' => 'Invalid URL',
			'profile.detailsForm.lastUpdate' => 'Last Update',
			'profile.detailsForm.updateInterval' => 'Auto Update',
			'profile.detailsForm.updateIntervalDialogTitle' => 'Auto Update Interval (in Hours)',
			'proxies.pageTitle' => 'Proxies',
			'proxies.emptyProxiesMsg' => 'No Proxies Available',
			'proxies.delayTestTooltip' => 'Test Delay',
			'proxies.sortTooltip' => 'Sort Proxies',
			'proxies.checkIp' => 'Check IP',
			'proxies.unknownIp' => 'Unknown IP',
			'proxies.sortOptions.unsorted' => 'Default',
			'proxies.sortOptions.name' => 'Alphabetically',
			'proxies.sortOptions.delay' => 'By Delay',
			'proxies.activeProxySemanticLabel' => 'Active Proxy',
			'proxies.delaySemantics.result' => ({required Object delay}) => 'Delay: ${delay}ms',
			'proxies.delaySemantics.timeout' => 'Delay Test Timeout',
			'proxies.delaySemantics.testing' => 'Delay: Testing...',
			'proxies.ipInfoSemantics.address' => 'IP Address',
			'proxies.ipInfoSemantics.country' => 'Country',
			'logs.pageTitle' => 'Logs',
			'logs.filterHint' => 'Filter',
			'logs.allLevelsFilter' => 'All',
			'logs.shareCoreLogs' => 'Share Core Logs',
			'logs.shareAppLogs' => 'Share App Logs',
			'logs.pauseTooltip' => 'Pause',
			'logs.resumeTooltip' => 'Resume',
			'logs.clearTooltip' => 'Clear',
			'settings.pageTitle' => 'Settings',
			'settings.requiresRestartMsg' => 'For this to take effect restart the app',
			'settings.experimental' => 'Experimental',
			'settings.experimentalMsg' => 'Features with Experimental flag are still in development and might cause issues.',
			'settings.exportOptions' => 'Copy Anonymous Options to Clipboard',
			'settings.exportAllOptions' => 'Copy All Options to Clipboard',
			'settings.importOptions' => 'Import Options From Clipboard',
			'settings.importOptionsMsg' => 'This will rewrite all config options with provided values. Are you sure?',
			'settings.general.sectionTitle' => 'General',
			'settings.general.locale' => 'Language',
			'settings.general.region' => 'Region',
			'settings.general.regionMsg' => 'Helps set default options to bypass domestic addresses',
			'settings.general.regions.ir' => 'Iran (ir) 🇮🇷',
			'settings.general.regions.cn' => 'China (cn) 🇨🇳',
			'settings.general.regions.ru' => 'Russia (ru) 🇷🇺',
			'settings.general.regions.af' => 'Afghanistan (af) 🇦🇫',
			'settings.general.regions.id' => 'Indonesia (id) 🇮🇩',
			'settings.general.regions.tr' => 'Türkiye (tr) 🇹🇷',
			'settings.general.regions.br' => 'Brazil (br) 🇧🇷',
			'settings.general.regions.other' => 'Other',
			'settings.general.themeMode' => 'Theme Mode',
			'settings.general.themeModes.system' => 'Follow System Theme',
			'settings.general.themeModes.dark' => 'Dark Mode',
			'settings.general.themeModes.light' => 'Light Mode',
			'settings.general.themeModes.black' => 'Black Mode',
			'settings.general.enableAnalytics' => 'Enable Analytics',
			'settings.general.enableAnalyticsMsg' => 'Give permission to collect analytics and send crash reports to improve the app',
			'settings.general.autoStart' => 'Start At Login',
			'settings.general.silentStart' => 'Start Minimized',
			'settings.general.openWorkingDir' => 'Open Working Directory',
			'settings.general.ignoreBatteryOptimizations' => 'Disable Battery Optimization',
			'settings.general.ignoreBatteryOptimizationsMsg' => 'Remove Restrictions For Optimal VPN Performance',
			'settings.general.dynamicNotification' => 'Display Speed in Notification',
			'settings.general.hapticFeedback' => 'Haptic Feedback',
			'settings.general.autoIpCheck' => 'Automatically Check Connection IP',
			'settings.general.actionAtClosing' => 'Action at closing',
			'settings.general.actionsAtClosing.askEachTime' => 'Ask each time',
			'settings.general.actionsAtClosing.hide' => 'Hide',
			'settings.general.actionsAtClosing.exit' => 'Exit',
			'settings.advanced.sectionTitle' => 'Advanced',
			'settings.advanced.debugMode' => 'Debug Mode',
			'settings.advanced.debugModeMsg' => 'Restart the app for applying this change',
			'settings.advanced.memoryLimit' => 'Memory Limit',
			'settings.advanced.memoryLimitMsg' => 'Enable if you\'re experiencing out of memory errors or frequent app crash',
			'settings.advanced.resetTunnel' => 'Reset VPN Profile',
			'settings.network.perAppProxyPageTitle' => 'Per-App Proxy',
			'settings.network.perAppProxyModes.off' => 'All',
			'settings.network.perAppProxyModes.offMsg' => 'Proxy All Apps',
			'settings.network.perAppProxyModes.include' => 'Proxy',
			'settings.network.perAppProxyModes.includeMsg' => 'Proxy Only Selected Apps',
			'settings.network.perAppProxyModes.exclude' => 'Bypass',
			'settings.network.perAppProxyModes.excludeMsg' => 'Do Not Proxy Selected Apps',
			'settings.network.showSystemApps' => 'Show System Apps',
			'settings.network.hideSystemApps' => 'Hide System Apps',
			'settings.network.clearSelection' => 'Clear Selection',
			'about.pageTitle' => 'About',
			'about.version' => 'Version',
			'about.sourceCode' => 'Source Code',
			'about.originalProject' => 'Original Hiddify',
			'about.privacyPolicy' => 'Privacy Policy',
			'about.termsAndConditions' => 'Terms and Conditions',
			'about.yumash.title' => 'Yumash Edition — What\'s changed',
			'about.yumash.added' => 'Added',
			'about.yumash.removed' => 'Removed',
			'about.yumash.improved' => 'Improved',
			'about.yumash.featureBypassRu' => 'Bypass Russian domains and IPs (geosite-ru, geoip-ru)',
			'about.yumash.featureBlockAds' => 'Block ads with customizable filter URLs',
			'about.yumash.featureProcessPicker' => 'Process picker from running list',
			'about.yumash.featurePortable' => 'Portable mode (settings next to exe)',
			'about.yumash.featureTunCgnat' => 'TUN subnet CGNAT (100.64.0.1/28)',
			'about.yumash.featureDualCore' => 'Dual-core: sing-box + Xray-core',
			'about.yumash.featureHiddifyManager' => 'Full Hiddify Manager support (xhttp, TLS tricks)',
			'about.yumash.featureTlsTricks' => 'TLS Tricks: Mixed SNI Case, fragmentation',
			'about.yumash.featureRulesetCache' => 'Rule-set caching with configurable interval',
			'about.yumash.featureProviderButtons' => 'Provider support buttons from subscription',
			'about.yumash.removedPlatforms' => 'Platforms: iOS, Android, Linux, macOS',
			'about.yumash.removedIpv6' => 'IPv6 support',
			'about.yumash.removedWarp' => 'Cloudflare WARP',
			'about.yumash.removedClash' => 'Clash API',
			'about.yumash.removedExtensions' => 'Extension system',
			'about.yumash.removedAutoupdate' => 'Auto-update',
			'about.yumash.removedLocales' => 'Locales except EN/RU',
			'about.yumash.improvedSingbox' => 'sing-box extracted from submodule for customization',
			'about.yumash.improvedHotSwitch' => 'Hot proxy switching without reconnect',
			'about.yumash.improvedFixedWindow' => 'Fixed window size 900x700',
			'about.yumash.donate' => 'Support developer',
			'about.yumash.donateBtc' => 'BTC (ByBit)',
			'about.yumash.donateUsdt' => 'USDT TRC20',
			'about.yumash.donateTon' => 'TON',
			'tray.dashboard' => 'Dashboard',
			'tray.quit' => 'Quit',
			'tray.open' => 'Open',
			'tray.status.connect' => 'Connect',
			'tray.status.connecting' => 'Connecting',
			'tray.status.disconnect' => 'Disconnect',
			'tray.status.disconnecting' => 'Disconnecting',
			'failure.unexpected' => 'Unexpected Error',
			'failure.singbox.unexpected' => 'Unexpected Service Error',
			'failure.singbox.serviceNotRunning' => 'Service is Not Running',
			'failure.singbox.missingPrivilege' => 'Missing Privilege',
			'failure.singbox.missingPrivilegeMsg' => 'VPN Mode Requires Administrator Privileges. Either relaunch the app as administrator or change service mode.',
			'failure.singbox.invalidConfigOptions' => 'Invalid Configuration Options',
			'failure.singbox.invalidConfig' => 'Invalid Configuration',
			'failure.singbox.create' => 'Service Creation Error',
			'failure.singbox.start' => 'Service Startup Error',
			'failure.connectivity.unexpected' => 'Unexpected Failure',
			'failure.connectivity.missingVpnPermission' => 'Missing VPN Permission',
			'failure.connectivity.missingNotificationPermission' => 'Missing Notification Permission',
			'failure.connectivity.core' => 'Core Error',
			'failure.profiles.unexpected' => 'Unexpected Error',
			'failure.profiles.notFound' => 'Profile Not Found',
			'failure.profiles.invalidConfig' => 'Invalid Configs',
			'failure.profiles.invalidUrl' => 'Invalid URL',
			'failure.connection.unexpected' => 'Unexpected Connection Error',
			'failure.connection.timeout' => 'Connection Timeout',
			'failure.connection.badResponse' => 'Bad Response',
			'failure.connection.connectionError' => 'Connection Error',
			'failure.connection.badCertificate' => 'Bad Certificate',
			'connection.tapToConnect' => 'Tap To Connect',
			'connection.connecting' => 'Connecting',
			'connection.disconnecting' => 'Disconnecting',
			'connection.connected' => 'Connected',
			'connection.reconnect' => 'Reconnect',
			'connection.connectAnyWay' => 'Connect',
			'connection.experimentalNotice' => 'Experimental Features In Use',
			'connection.experimentalNoticeMsg' => 'You\'ve enabled some experimental features which might affect connection quality and cause unexpected errors. You can always change or reset these options from Config options page.',
			'connection.disableExperimentalNotice' => 'Don\'t Show Again',
			'connection.reconnectMsg' => 'Reconnecting for taking into account the changes...',
			'config.core' => 'Core',
			'config.useXrayCoreWhenPossible.Label' => 'Use Xray-core When Possible',
			'config.useXrayCoreWhenPossible.Description' => 'Use Xray-core during parsing sub links. You need to reimport the sub link to enable this option.',
			'config.resetBtn' => 'Reset Options',
			'config.serviceMode' => 'Service Mode',
			'config.quickSettings' => 'Quick Settings',
			'config.allOptions' => 'All Config Options',
			'config.serviceModes.proxy' => 'Proxy Service Only',
			'config.serviceModes.systemProxy' => 'Set System Proxy',
			'config.serviceModes.tun' => 'VPN',
			'config.serviceModes.tunService' => 'VPN Service',
			'config.shortServiceModes.proxy' => 'Proxy',
			'config.shortServiceModes.systemProxy' => 'System Proxy',
			'config.shortServiceModes.tun' => 'VPN',
			'config.shortServiceModes.tunService' => 'VPN Service',
			'config.section.route' => 'Route Options',
			'config.section.dns' => 'DNS Options',
			'config.section.dnsExplanation' => 'Remote DNS is used for sites through VPN (foreign). Direct DNS is for sites without VPN (Russian, from bypass list). This ensures Russian sites get correct IP addresses.',
			'config.section.inbound' => 'Inbound Options',
			'config.section.mux' => 'MultiPlexer',
			'config.section.outbound' => 'Outbound Options',
			'config.section.tlsTricks' => 'TLS Tricks',
			'config.section.misc' => 'Misc Options',
			'config.pageTitle' => 'Config Options',
			'config.logLevel' => 'Log Level',
			'config.blockAds' => 'Block Advertisements',
			'config.blockAdsHint' => 'Blocks ads in apps and browsers',
			'config.blockAdsTooltip' => 'Ad requests are blocked at the network level. Works in all apps, not just browsers. Some sites may break — disable if you have issues.',
			'config.resolveDestination' => 'Resolve Destination',
			'config.remoteDnsAddress' => 'Remote DNS',
			'config.remoteDnsDomainStrategy' => 'Remote DNS Domain Strategy',
			'config.directDnsAddress' => 'Direct DNS',
			'config.directDnsDomainStrategy' => 'Direct DNS Domain Strategy',
			'config.mixedPort' => 'Mixed Port',
			'config.mixedPortHint' => 'Local proxy port for the app to work (HTTP/SOCKS5)',
			'config.tproxyPort' => 'Transparent Proxy Port',
			'config.tproxyPortHint' => 'Used by TUN mode to intercept traffic',
			'config.localDnsPort' => 'Local DNS Port',
			'config.localDnsPortHint' => 'Local DNS server for bypassing blocks',
			'config.allowConnectionFromLan' => 'Share VPN in Local Network',
			'config.tunImplementation' => 'TUN Implementation',
			'config.mtu' => 'Packet Size (MTU)',
			'config.connectionTestUrl' => 'Connection Test URL',
			'config.urlTestInterval' => 'URL Test Interval',
			'config.enableTun' => 'Enable TUN',
			'config.setSystemProxy' => 'Set System Proxy',
			'config.enableDnsRouting' => 'Enable DNS Routing',
			'config.enableFakeDns' => 'Enable Fake DNS',
			'config.bypassLan' => 'Home network direct',
			'config.bypassLanHint' => 'Access router, printer and other devices on home network (192.168.x.x)',
			'config.excludedDomains' => 'Custom sites (manual)',
			'config.excludedDomainsHint' => 'Sites that don\'t work through VPN (banks, government). Example: *.bank.com, gov.site',
			'config.excludedIps' => 'Custom IP addresses (manual)',
			'config.excludedIpsHint' => 'IP addresses that should work directly. Example: 192.168.1.100, 10.0.0.0/8',
			'config.excludedProcesses' => 'Custom programs (manual)',
			'config.excludedProcessesHint' => 'Games and apps that work poorly through VPN. Example: Steam.exe, Discord.exe',
			'config.bypassRussianDomains' => 'Russian sites direct',
			'config.bypassRussianDomainsHint' => 'Russian sites faster without VPN (.ru, yandex, vk, ok and others)',
			'config.bypassRussianIps' => 'Russian IPs direct',
			'config.bypassRussianIpsHint' => 'All Russian internet direct (even if domain is not .ru)',
			'config.russianGeositeUrl' => 'Russian domains filter URL',
			'config.russianGeositeUrlHint' => 'URL to sing-box binary rule-set (.srs) containing Russian domain list',
			'config.russianGeoipUrl' => 'Russian IPs filter URL',
			'config.russianGeoipUrlHint' => 'URL to sing-box binary rule-set (.srs) containing Russian IP ranges',
			'config.blockAdsRuleSetUrls' => 'Ad blocking filter URLs',
			'config.blockAdsRuleSetUrlsHint' => 'URLs to sing-box binary rule-sets (.srs) for blocking ads/malware. One URL per line',
			'config.ruleSetUrlsSection' => 'Custom filter URLs',
			'config.ruleSetUrlsSectionHint' => 'Override default filter sources with custom URLs (sing-box .srs format)',
			'config.ruleSetUpdateInterval' => 'Rule-set update interval',
			'config.ruleSetUpdateIntervalHint' => 'How often to check for filter list updates (cached locally)',
			'config.forceUpdateRuleSets' => 'Update filters now',
			'config.forceUpdateRuleSetsHint' => 'Force download latest filter lists',
			'config.ruleSetUpdated' => 'Filter lists updated',
			'config.ruleSetUpdateFailed' => 'Failed to update filter lists',
			'config.ruleSetUpdating' => 'Updating filters...',
			'config.requiresReconnect' => 'Requires reconnect',
			'config.requiresReconnectTooltip' => 'Changes will apply after reconnecting',
			'config.exclusionListHint' => 'One item per line',
			'config.exclusionItemSingular' => 'item',
			'config.exclusionItemPlural' => 'items',
			'config.ruleSetUrlInvalid' => 'Invalid URL format',
			'config.ruleSetUrlMustEndWithSrs' => 'URL must end with .srs',
			'config.ruleSetUrlLine' => 'Line',
			'config.ruleSetUrlFormat' => 'URLs must be HTTP(S) and end with .srs',
			'config.ruleSetUrlMoreErrors' => ({required Object count}) => '${count} more errors',
			'config.processPickerTabSelect' => 'Select from list',
			'config.processPickerTabManual' => 'Enter manually',
			'config.processPickerSearch' => 'Search processes...',
			'config.processPickerRefresh' => 'Refresh list',
			'config.processPickerSelected' => 'Selected',
			'config.processPickerError' => 'Failed to load processes',
			'config.processPickerEmpty' => 'No processes found',
			'config.processNotRunning' => 'not running',
			'config.strictRoute' => 'Strict Route',
			'config.strictRouteHint' => 'Prevents DNS leaks and blocks traffic outside VPN',
			'config.strictRouteTooltip' => 'May cause issues with VirtualBox and similar apps',
			'config.lanBypassIps' => 'LAN Bypass Subnets',
			'config.lanBypassIpsHint' => 'IP ranges that bypass VPN (local network). Example: 192.168.0.0/16, 10.0.0.0/8',
			'config.lanBypassIpsDefault' => '192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12',
			'config.dayOne' => 'day',
			'config.dayFew' => 'days',
			'config.dayMany' => 'days',
			'config.minuteOne' => 'minute',
			'config.minuteFew' => 'minutes',
			'config.minuteMany' => 'minutes',
			'config.tunAddress' => 'VPN Subnet',
			'config.tunAddressHint' => 'TUN interface IP address in CIDR format (e.g. 100.64.0.1/28)',
			'config.enableTlsFragment' => 'Enable TLS Fragment',
			'config.tlsFragmentSize' => 'TLS Fragment Size',
			'config.tlsFragmentSleep' => 'TLS Fragment Sleep',
			'config.enableTlsMixedSniCase' => 'Enable TLS Mixed SNI Case',
			'config.enableTlsPadding' => 'Enable TLS Padding',
			'config.tlsPaddingSize' => 'TLS Padding',
			'config.enableMux' => 'Enable Mux',
			'config.muxProtocol' => 'Mux Protocol',
			'config.muxMaxStreams' => 'Max Concurrent Streams',
			'config.wgServer.title' => 'Share VPN via WireGuard',
			'config.wgServer.enable' => 'Enable WireGuard Server',
			'config.wgServer.enableHint' => 'Allow mobile devices in your LAN to connect via WireGuard',
			'config.wgServer.port' => 'UDP Port',
			'config.wgServer.subnet' => 'WireGuard Subnet',
			'config.wgServer.statusEnabled' => 'Enabled',
			'config.wgServer.statusDisabled' => 'Disabled',
			'config.wgServer.enableToShowQR' => 'Enable WireGuard server to show QR code',
			'config.wgServer.scanInstructions' => 'Scan this QR code with WireGuard app on your phone',
			'config.wgServer.serverAddress' => 'Server',
			'config.wgServer.copyConfig' => 'Copy Config',
			'config.wgServer.configError' => 'Keys not generated yet. Please restart the app.',
			'config.wgServer.securityWarning' => 'WireGuard server is only accessible from your local network. Do not share the QR code publicly — it contains private keys.',
			'config.wgServer.keysGenerated' => 'WireGuard keys generated successfully',
			'config.wgServer.noKeys' => 'WireGuard keys not generated yet',
			'config.wgServer.generateKeys' => 'Generate Keys',
			'config.wgServer.regenerateKeys' => 'Regenerate',
			'window.hide' => 'Hide',
			'window.close' => 'Exit',
			'window.alertMessage' => 'Hide or Exit the application?',
			'window.remember' => 'Remember my choice',
			_ => null,
		};
	}
}
