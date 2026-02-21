// lib/utils/link_sanitizer.dart
import 'package:loggy/loggy.dart';

final _loggy = Loggy('LinkSanitizer');

class LinkSanitizer {
  /// Sanitize V2ray subscription links to fix common issues
  static String sanitizeLink(String link) {
    if (link.isEmpty) return link;

    String sanitized = link;

    // Fix fake_ip_for_sub_link in SNI fields
    if (sanitized.contains('fake_ip_for_sub_link')) {
      _loggy.debug('Sanitizing fake_ip_for_sub_link -> 1.1.1.1');
      sanitized = sanitized.replaceAll('fake_ip_for_sub_link', '1.1.1.1');
    }

    // Fix invalid hostnames (basic pattern)
    // Look for patterns like digits.digits--digits.digits.time
    final invalidHostnamePattern = RegExp(r'\d+\.\d+--\d+\.\d+\.time');
    if (invalidHostnamePattern.hasMatch(sanitized)) {
      _loggy.debug('Found invalid hostname pattern, replacing with cloudflare-dns.com');
      sanitized = invalidHostnamePattern.allMatches(sanitized).fold(sanitized, (acc, match) {
        return acc.replaceRange(match.start, match.end, 'cloudflare-dns.com');
      });
    }

    // Normalize mixed case domains (simple approach)
    // This is tricky because we need to preserve the protocol part
    try {
      final uri = Uri.parse(sanitized);
      if (uri.host.isNotEmpty) {
        final normalizedHost = uri.host.toLowerCase();
        if (uri.host != normalizedHost) {
          _loggy.debug('Normalizing mixed case domain: ${uri.host} -> $normalizedHost');
          // Reconstruct URI with normalized host
          final newUri = uri.replace(host: normalizedHost);
          sanitized = newUri.toString();
        }
      }
    } catch (e) {
      _loggy.debug('Failed to parse URI for normalization: $e');
    }

    // Handle encoded special characters in remarks
    // This is particularly for the %E2%8F%B3 pattern
    if (sanitized.contains('%E2%8F%B3')) {
      _loggy.debug('Removing problematic encoded characters from remarks');
      // Remove or replace problematic encoded sequences
      sanitized = sanitized.replaceAll('%E2%8F%B3', '');
    }

    return sanitized;
  }

  /// Sanitize a list of V2ray links
  static List<String> sanitizeLinks(List<String> links) {
    final sanitizedLinks = <String>[];
    int fixedCount = 0;

    for (final link in links) {
      final original = link;
      final sanitized = sanitizeLink(link);

      if (sanitized != original) {
        fixedCount++;
      }

      // Only add non-empty links
      if (sanitized.trim().isNotEmpty) {
        sanitizedLinks.add(sanitized);
      }
    }

    if (fixedCount > 0) {
      _loggy.info('Sanitized $fixedCount problematic links out of ${links.length}');
    }

    return sanitizedLinks;
  }

  /// Check if a link has known problematic patterns
  static bool hasProblematicPatterns(String link) {
    return link.contains('fake_ip_for_sub_link') ||
           RegExp(r'\d+\.\d+--\d+\.\d+\.time').hasMatch(link) ||
           link.contains('%E2%8F%B3');
  }
}
