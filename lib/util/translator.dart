import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'All Countries': 'All Countries',
          'Best Countries': 'Best Countries',
        },
        'si_LK': {
          'hello': 'ආයුබෝවන්',
          'All Countries': 'සියලූ රටවල්',
          'Best Countries': 'අනුග්‍රාම රටවල්',
        },
      };
}
