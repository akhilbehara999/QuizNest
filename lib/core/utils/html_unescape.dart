/// Utility to unescape HTML entities commonly returned by trivia APIs such as OpenTDB.
class HtmlUnescape {
  static final RegExp _namedEntityRegex = RegExp(r'&([a-zA-Z]+);');
  static final RegExp _decimalEntityRegex = RegExp(r'&#(\d+);');
  static final RegExp _hexEntityRegex = RegExp(r'&#x([0-9a-fA-F]+);');

  static const Map<String, String> _namedEntities = {
    'quot': '"',
    'amp': '&',
    'apos': "'",
    'lt': '<',
    'gt': '>',
    'nbsp': ' ',
    'deg': '°',
    'copy': '©',
    'reg': '®',
    'euro': '€',
    'pound': '£',
    'yen': '¥',
    'cent': '¢',
    'plusmn': '±',
    'acute': '´',
    'micro': 'µ',
    'para': '¶',
    'middot': '·',
    'frac14': '¼',
    'frac12': '½',
    'frac34': '¾',
    'times': '×',
    'divide': '÷',
    'Agrave': 'À',
    'Aacute': 'Á',
    'Acirc': 'Â',
    'Atilde': 'Ã',
    'Auml': 'Ä',
    'Aring': 'Å',
    'Eacute': 'É',
    'Egrave': 'È',
    'Oacute': 'Ó',
    'Uacute': 'Ú',
    'aacute': 'á',
    'agrave': 'à',
    'acirc': 'â',
    'auml': 'ä',
    'atilde': 'ã',
    'aring': 'å',
    'eacute': 'é',
    'egrave': 'è',
    'ecirc': 'ê',
    'euml': 'ë',
    'iacute': 'í',
    'igrave': 'ì',
    'icirc': 'î',
    'iuml': 'ï',
    'oacute': 'ó',
    'ograve': 'ò',
    'ocirc': 'ô',
    'ouml': 'ö',
    'otilde': 'õ',
    'uacute': 'ú',
    'ugrave': 'ù',
    'ucirc': 'û',
    'uuml': 'ü',
    'ntilde': 'ñ',
    'ccedil': 'ç',
  };

  static String unescape(String input) {
    if (input.isEmpty) return input;

    var result = input;

    // Handle named entities: &quot;, &#039;, &amp;
    result = result.replaceAllMapped(_namedEntityRegex, (match) {
      final name = match.group(1);
      if (name != null && _namedEntities.containsKey(name)) {
        return _namedEntities[name]!;
      }
      return match.group(0)!;
    });

    // Handle decimal entities: &#039;, &#39;, &#8220;, etc.
    result = result.replaceAllMapped(_decimalEntityRegex, (match) {
      final codeStr = match.group(1);
      if (codeStr != null) {
        final code = int.tryParse(codeStr);
        if (code != null) {
          return String.fromCharCode(code);
        }
      }
      return match.group(0)!;
    });

    // Handle hex entities: &#x27;, &#x201C;, etc.
    result = result.replaceAllMapped(_hexEntityRegex, (match) {
      final codeStr = match.group(1);
      if (codeStr != null) {
        final code = int.tryParse(codeStr, radix: 16);
        if (code != null) {
          return String.fromCharCode(code);
        }
      }
      return match.group(0)!;
    });

    return result;
  }
}
