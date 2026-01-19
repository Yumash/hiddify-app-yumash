/// https://gist.github.com/dperini/729294
final _urlRegex = RegExp(
  r'^(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?:[0-9]{1,3}\.){3}[0-9]{1,3}|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?#?.*$',
);

/// https://stackoverflow.com/a/12968117
final _portRegex = RegExp(
  r"^([1-9][0-9]{0,3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$",
);

/// https://stackoverflow.com/questions/3809401/what-is-a-good-regular-expression-to-match-a-url/3809435#3809435
bool isUrl(String input) {
  return _urlRegex.hasMatch(input.trim().toLowerCase());
}

bool isPort(String input) {
  return _portRegex.hasMatch(input);
}
