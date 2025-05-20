import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
    String? frText = '',
  }) =>
      [enText, arText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '1d7ft8ro': {
      'en': 'Welcome',
      'ar': '',
      'fr': '',
    },
    'lhszf1v0': {
      'en': 'Maintain your calories and stay healthy!',
      'ar': '',
      'fr': '',
    },
    'i5s7dkfz': {
      'en': 'What is your crrent weight?\n',
      'ar': '',
      'fr': '',
    },
    'en7y11zm': {
      'en': 'TextField',
      'ar': '',
      'fr': '',
    },
    '1cnzbqz9': {
      'en': 'Kg',
      'ar': '',
      'fr': '',
    },
    'n6onqtcm': {
      'en': 'cm',
      'ar': '',
      'fr': '',
    },
    'fnxbxn53': {
      'en': 'TextField',
      'ar': '',
      'fr': '',
    },
    'xit181hc': {
      'en': 'Next',
      'ar': '',
      'fr': '',
    },
    'v0xw0l80': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // splash
  {
    'qvcz5r7u': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // q1
  {
    '73ww6x8q': {
      'en': 'Welcome!',
      'ar': 'مرحباً!',
      'fr': 'Bienvenu!',
    },
    'b941bp4m': {
      'en': 'Let’s personalize your health journey with Soorat!',
      'ar': 'دعنا نخصص رحلتك الصحية مع سعرات! ',
      'fr': 'Personnalisons votre parcours santé avec Soorat!',
    },
    'u7rclt6l': {
      'en': 'What is your current weight?',
      'ar': 'ما هو وزنك الحالي؟',
      'fr': 'Quel est votre poids actuel ?',
    },
    'val96e8g': {
      'en': 'In kg',
      'ar': 'بالكيلوجرام',
      'fr': 'En kg',
    },
    'l84wv7qr': {
      'en': 'What is your current height?',
      'ar': 'ما هو طولك الحالي؟',
      'fr': 'Quelle est votre taille actuelle ?',
    },
    'cmannx16': {
      'en': 'In cm',
      'ar': 'بالسنتيمتر',
      'fr': 'En cm',
    },
    'd3ddb6m8': {
      'en': 'Next',
      'ar': 'التالي',
      'fr': 'Suivant',
    },
    '4ggksq1v': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // q2
  {
    'dadcie70': {
      'en': 'Welcome!',
      'ar': 'مرحباً!',
      'fr': 'Bienvenu!',
    },
    '9zkjt9g8': {
      'en': 'Let’s personalize your health journey with Soorat!',
      'ar': 'دعنا نخصص رحلتك الصحية مع سعرات! ',
      'fr': 'Personnalisons votre parcours santé avec Soorat!',
    },
    'pjeh8bf2': {
      'en': 'Select your date of birth',
      'ar': 'ما هو عمرك؟',
      'fr': 'Quel âge as-tu?',
    },
    'yag3w5r0': {
      'en': 'What is your gender?',
      'ar': 'ما هو جنسك؟',
      'fr': 'Quel est votre genre?',
    },
    'tjtnhxv7': {
      'en': 'Female',
      'ar': 'Female',
      'fr': 'Female',
    },
    'zzwmik0j': {
      'en': 'Male',
      'ar': 'Male',
      'fr': 'Male',
    },
    '49cv94vr': {
      'en': 'Next',
      'ar': 'التالي',
      'fr': 'Suivant',
    },
    'kpvmr8b1': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // q3
  {
    'dsycokik': {
      'en': 'Welcome!',
      'ar': 'مرحباً!',
      'fr': 'Bienvenu!',
    },
    'gbe9tjz0': {
      'en': 'Let’s personalize your health journey with Soorat!',
      'ar': 'دعنا نخصص رحلتك الصحية مع سعرات! ',
      'fr': 'Personnalisons votre parcours santé avec Soorat!',
    },
    'p6nhx77b': {
      'en': 'What is your goal?',
      'ar': 'ما هو هدفك؟',
      'fr': 'Quel est ton objectif ?',
    },
    'qofpvy7h': {
      'en': 'Select goal',
      'ar': 'حدد الهدف',
      'fr': 'Sélectionnez l\'objectif',
    },
    'o78b330p': {
      'en': 'Search...',
      'ar': 'يبحث...',
      'fr': 'Recherche...',
    },
    'xvhue7on': {
      'en': 'Lose weight',
      'ar': 'Lose weight',
      'fr': 'Lose weight',
    },
    'r6u81q33': {
      'en': 'Maintain weight',
      'ar': 'Maintain weight',
      'fr': 'Maintain weight',
    },
    'vfs71frm': {
      'en': 'Gain weight',
      'ar': 'Gain weight',
      'fr': 'Gain weight',
    },
    'b6mjnxms': {
      'en': 'What is your activity level?',
      'ar': 'ما هو مستوى نشاطك؟',
      'fr': 'Quel est votre niveau d\'activité ?',
    },
    'qdavpoek': {
      'en': 'Select activity level',
      'ar': 'حدد مستوى النشاط',
      'fr': 'Sélectionnez le niveau d\'activité',
    },
    '8nj310jy': {
      'en': 'Search...',
      'ar': 'يبحث...',
      'fr': 'Recherche...',
    },
    'ykx30j03': {
      'en': 'Sedentary (little/ no exercise)',
      'ar': 'Sedentary (little/ no exercise)',
      'fr': 'Sedentary (little/ no exercise)',
    },
    'byc5wj6n': {
      'en': 'Lightly active (exercise1-3 days/week)',
      'ar': 'Lightly active (exercise1-3 days/week)',
      'fr': 'Lightly active (exercise1-3 days/week)',
    },
    'y3khnzrw': {
      'en': 'Moderately active (exercise 3-5 days week)',
      'ar': 'Moderately active (exercise 3-5 days week)',
      'fr': 'Moderately active (exercise 3-5 days week)',
    },
    'rzeghp2i': {
      'en': 'Very active (exercise 6-7 days/week)',
      'ar': 'Very active (exercise 6-7 days/week)',
      'fr': 'Very active (exercise 6-7 days/week)',
    },
    '3m0m5ifw': {
      'en': 'Extra active (very intense activity)',
      'ar': 'Extra active (very intense activity)',
      'fr': 'Extra active (very intense activity)',
    },
    'ofj4ernz': {
      'en': 'Next',
      'ar': 'التالي',
      'fr': 'Suivant',
    },
    '5jfziwmu': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // signUp
  {
    'cxphg8p7': {
      'en': 'SOORAT',
      'ar': 'سعرات',
      'fr': 'SOORAT',
    },
    'oc4o1kws': {
      'en': 'Create an account',
      'ar': 'إنشاء حساب',
      'fr': 'Créer un compte',
    },
    'njr2vsic': {
      'en': 'Let’s sign up to your account and start your calorie management.',
      'ar': 'دعنا نسجل حسابك ونبدأ في إدارة السعرات الحرارية الخاصة بك.',
      'fr':
          'Inscrivez-vous à votre compte et commencez votre gestion des calories.',
    },
    'ljj9o0xx': {
      'en': 'Name',
      'ar': 'الاسم',
      'fr': 'Nom',
    },
    'n8so6p3p': {
      'en': 'Name is required',
      'ar': '',
      'fr': '',
    },
    '87fiuism': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fr': '',
    },
    'r6jw0szw': {
      'en': 'Email',
      'ar': 'الإيميل',
      'fr': 'Email',
    },
    'tzlifg2w': {
      'en': 'Email is required',
      'ar': '',
      'fr': '',
    },
    '6mullajk': {
      'en': 'example@example.com',
      'ar': 'example@example.com',
      'fr': 'example@example.com',
    },
    'gim20qcp': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fr': '',
    },
    'giogjmvi': {
      'en': 'Password',
      'ar': 'الرمز السري',
      'fr': 'Mot de passe',
    },
    '7sv2h9pc': {
      'en': 'Password is required',
      'ar': '',
      'fr': '',
    },
    'w0rbdhn3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fr': '',
    },
    '93ipwd0a': {
      'en': 'Confirm Password',
      'ar': 'تأكيد الرمز السري',
      'fr': 'Confirmez le mot de passe',
    },
    'mexbntt7': {
      'en': 'Confirm Password is required',
      'ar': '',
      'fr': '',
    },
    'f8dxye09': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fr': '',
    },
    'nwrp45lg': {
      'en': 'Create Account',
      'ar': 'إنشاء الحساب',
      'fr': 'Créer un compte',
    },
    'fspov3z3': {
      'en': 'Already have an account? ',
      'ar': 'لديك حساب بالفعل؟',
      'fr': 'Vous avez déjà un compte ?',
    },
    'i4hq9lt0': {
      'en': 'Sign In here',
      'ar': 'تسجيل الدخول هنا',
      'fr': 'Connectez-vous ici',
    },
    '13h0tw8c': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // signIn
  {
    'v94vbusy': {
      'en': 'SOORAT',
      'ar': 'سعرات',
      'fr': 'SOORAT',
    },
    'b6eho6yf': {
      'en': 'Welcome Back',
      'ar': 'مرحبًا بعودتك',
      'fr': 'Content de te revoir',
    },
    's8kv93aa': {
      'en': 'Email',
      'ar': 'الإيميل',
      'fr': 'Email',
    },
    'z5cw3k9d': {
      'en': 'Password',
      'ar': 'الرمز السري',
      'fr': 'Mot de passe',
    },
    'e122f5r8': {
      'en': 'Sign In',
      'ar': 'تسجيل دخول',
      'fr': 'Se connecter',
    },
    'u7beon3h': {
      'en': 'Don\'t have an account? ',
      'ar': 'ليس لديك حساب؟',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    'zerse2uc': {
      'en': ' Sign Up here',
      'ar': 'سجل هنا',
      'fr': 'Inscrivez-vous ici',
    },
    'joesh5ia': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // testbackendsupabase
  {
    'fsntxlz4': {
      'en': 'Manage your team below.',
      'ar': '',
      'fr': '',
    },
    '5tanl6p8': {
      'en': 'My Team',
      'ar': '',
      'fr': '',
    },
    'bba4jmqp': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // Home
  {
    '0se4w1f8': {
      'en': 'Needed Calories',
      'ar': 'السعرات المطلوبة',
      'fr': 'Calories nécessaires',
    },
    'zhyk2tty': {
      'en': ' Nutritions',
      'ar': 'القيم الغذائية',
      'fr': 'Valeurs nutritionnelles',
    },
    'x5ylnk9v': {
      'en': 'Remaining',
      'ar': 'المتبقي',
      'fr': 'Restant',
    },
    'dullg12h': {
      'en': 'Needed',
      'ar': 'الاحتياج',
      'fr': 'Besoin',
    },
    'vqq2k3q2': {
      'en': 'Carbs ',
      'ar': 'كارب',
      'fr': 'Crabes',
    },
    'i5lhi1x7': {
      'en': 'Protein',
      'ar': 'بروتين',
      'fr': 'Protéine',
    },
    'sblbh11u': {
      'en': 'Fat',
      'ar': 'دهون',
      'fr': 'Gras',
    },
    'xn7x6gz1': {
      'en': 'My Meals',
      'ar': 'وجباتي',
      'fr': 'Mes repas',
    },
    'zu7l7n3o': {
      'en': 'Calories',
      'ar': 'السعرات',
      'fr': 'Calories',
    },
    '69356a30': {
      'en': '  Cal',
      'ar': 'ك',
      'fr': '  Cal',
    },
    'vmq0tvgs': {
      'en': 'Carbs',
      'ar': 'كارب',
      'fr': 'Crabes',
    },
    'e7gt0r5p': {
      'en': '  g',
      'ar': 'جم',
      'fr': 'g',
    },
    'gq2u9sh6': {
      'en': ' Protein',
      'ar': 'بروتين',
      'fr': 'Protéine',
    },
    'i4ausen0': {
      'en': '  g',
      'ar': 'جم',
      'fr': 'g',
    },
    'tqcrnfmg': {
      'en': 'Fat',
      'ar': 'دهون',
      'fr': 'Gras',
    },
    'ag0rrart': {
      'en': '  g',
      'ar': 'جم',
      'fr': 'g',
    },
    'crnctn9b': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // progress
  {
    '9koxgdvn': {
      'en': 'Progress',
      'ar': '',
      'fr': '',
    },
  },
  // profileCopy
  {
    't8moq19f': {
      'en': 'Name',
      'ar': '',
      'fr': '',
    },
    'jvi0qdi4': {
      'en': 'Weight',
      'ar': '',
      'fr': '',
    },
    'b54sjyt4': {
      'en': 'Height',
      'ar': '',
      'fr': '',
    },
    '0ngnpnpg': {
      'en': 'Age',
      'ar': '',
      'fr': '',
    },
    '2zcrmlei': {
      'en': 'Gender',
      'ar': '',
      'fr': '',
    },
    '39r57ehw': {
      'en': 'Edit',
      'ar': '',
      'fr': '',
    },
    'kw42l3ps': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // Profile
  {
    'nknjhkev': {
      'en': 'Name',
      'ar': 'الاسم',
      'fr': 'Nom',
    },
    'lllj100w': {
      'en': 'Email',
      'ar': 'الإيميل',
      'fr': 'Email',
    },
    'foj9gses': {
      'en': 'Weight',
      'ar': 'الوزن',
      'fr': 'Poids',
    },
    '8x05dymh': {
      'en': 'Height',
      'ar': 'الطول',
      'fr': 'Hauteur',
    },
    'ch7qb6y5': {
      'en': 'Age',
      'ar': 'العمر',
      'fr': 'Âge',
    },
    'rczeki3w': {
      'en': 'Gender',
      'ar': 'الجنس',
      'fr': 'Genre',
    },
    'dv4evc0d': {
      'en': 'Goal',
      'ar': 'الهدف',
      'fr': 'But',
    },
    '8vxowdib': {
      'en': 'Activty ',
      'ar': 'مستوى النشاط',
      'fr': 'Niveau d\'activité',
    },
    'gnhgn8yo': {
      'en': 'Porfile',
      'ar': 'الحساب تعريفي',
      'fr': 'profil',
    },
    'r4mbq1c6': {
      'en': 'English',
      'ar': 'English',
      'fr': 'English',
    },
    'u5q237fn': {
      'en': 'العربية',
      'ar': 'العربية',
      'fr': 'العربية',
    },
    'je83izxz': {
      'en': 'français',
      'ar': 'français',
      'fr': 'français',
    },
    '9g9h27fa': {
      'en': 'Languages',
      'ar': 'اللغات',
      'fr': 'Langues',
    },
    'az37h66q': {
      'en': 'Contact us',
      'ar': 'تواصل معنا',
      'fr': 'Contactez-nous',
    },
    'bzva5yyz': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // editProfileCopy
  {
    'h3ay1xx8': {
      'en': 'Name',
      'ar': '',
      'fr': '',
    },
    'rhgkn9ga': {
      'en': 'Weghit',
      'ar': '',
      'fr': '',
    },
    'd3awb6bk': {
      'en': 'Height',
      'ar': '',
      'fr': '',
    },
    '5bwf54w8': {
      'en': 'Age',
      'ar': '',
      'fr': '',
    },
    'r9wq3j64': {
      'en': 'Gender',
      'ar': '',
      'fr': '',
    },
    'bhhat80g': {
      'en': 'Goal',
      'ar': '',
      'fr': '',
    },
    'jwvhibhh': {
      'en': 'Edit',
      'ar': '',
      'fr': '',
    },
    'q2wgfc01': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // camera
  {
    'ns00he7y': {
      'en': 'Position food within frame',
      'ar': '',
      'fr': '',
    },
    'bxcgdd79': {
      'en': 'Capture',
      'ar': '',
      'fr': '',
    },
    '6oehi40i': {
      'en': '______',
      'ar': '',
      'fr': '',
    },
  },
  // q3Copy
  {
    'fb7kzkgb': {
      'en': 'Welcome!',
      'ar': 'مرحباً!',
      'fr': 'Bienvenu!',
    },
    '6zninl1p': {
      'en': 'Maintain your calories and stay healthy!',
      'ar': 'حافظ على سعراتك الحرارية وحافظ على صحتك!',
      'fr': 'Maintenez vos calories et restez en bonne santé !',
    },
    '5n3tw0tm': {
      'en': 'What is your goal?',
      'ar': '',
      'fr': '',
    },
    'mmx64kz6': {
      'en': 'Lose weight',
      'ar': '',
      'fr': '',
    },
    'qt993qvp': {
      'en': 'Maintain weight',
      'ar': '',
      'fr': '',
    },
    'd4br984x': {
      'en': 'Gain weight',
      'ar': '',
      'fr': '',
    },
    '96l53hdj': {
      'en': 'Next',
      'ar': 'التالي',
      'fr': 'Suivant',
    },
    'zri8gqgf': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // HomeCopy
  {
    '28tz8du4': {
      'en': '1900 Cal',
      'ar': '',
      'fr': '',
    },
    '080f0grw': {
      'en': '\n732.8 cals\n      left',
      'ar': '',
      'fr': '',
    },
    '3dmbpatm': {
      'en': 'Carbs ',
      'ar': '',
      'fr': '',
    },
    'acpmd8lz': {
      'en': '200g',
      'ar': '',
      'fr': '',
    },
    'g021ju4f': {
      'en': 'Protein',
      'ar': '',
      'fr': '',
    },
    'zfltx4p1': {
      'en': '121g',
      'ar': '',
      'fr': '',
    },
    'huaijm76': {
      'en': 'Fat',
      'ar': '',
      'fr': '',
    },
    'l1o6n63f': {
      'en': '64g',
      'ar': '',
      'fr': '',
    },
    'ip85woip': {
      'en': 'Breakfast',
      'ar': '',
      'fr': '',
    },
    'bar9ylp5': {
      'en': '35 Carbs',
      'ar': '',
      'fr': '',
    },
    'zs7brzv8': {
      'en': ' 35 Protein',
      'ar': '',
      'fr': '',
    },
    'vlhed3x2': {
      'en': '20.2 Fat',
      'ar': '',
      'fr': '',
    },
    'risjs8j2': {
      'en': 'Lunch',
      'ar': '',
      'fr': '',
    },
    'tehg75sk': {
      'en': 'Dinner',
      'ar': '',
      'fr': '',
    },
    'b8v8sq0w': {
      'en': 'Snacks',
      'ar': '',
      'fr': '',
    },
    'wkf4761x': {
      'en': '             No meal logged yet',
      'ar': '',
      'fr': '',
    },
    'f8v9eljk': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // testDisplay
  {
    'mwuu73cf': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // cameraNotWorking
  {
    'jr4l5czr': {
      'en': 'log my Meal',
      'ar': '',
      'fr': '',
    },
    'thwzz7lx': {
      'en': 'Upload Image',
      'ar': '',
      'fr': '',
    },
    'ryyqqxpm': {
      'en': 'Tap to select image',
      'ar': '',
      'fr': '',
    },
    '2ddq1k3w': {
      'en': 'Upload image',
      'ar': '',
      'fr': '',
    },
    'rianlkvy': {
      'en': 'Analysis Results',
      'ar': '',
      'fr': '',
    },
    '35n3jwnh': {
      'en': 'Calories',
      'ar': '',
      'fr': '',
    },
    '9bob76i1': {
      'en': 'Protein',
      'ar': '',
      'fr': '',
    },
    '9axpe9rv': {
      'en': 'Carbs',
      'ar': '',
      'fr': '',
    },
    '6mryimtv': {
      'en': 'Fat',
      'ar': '',
      'fr': '',
    },
    'd0jpjo6k': {
      'en': 'Hello World',
      'ar': '',
      'fr': '',
    },
    'v0834gkm': {
      'en': 'Hello World',
      'ar': '',
      'fr': '',
    },
    'b3ecqb05': {
      'en': 'Hello World',
      'ar': '',
      'fr': '',
    },
    '4jrc5nwc': {
      'en': 'Hello World',
      'ar': '',
      'fr': '',
    },
  },
  // cameraPage
  {
    '4o1vmr5t': {
      'en': 'Image of the meal',
      'ar': 'صورة الطبق',
      'fr': 'Image du repas',
    },
    'xb743y99': {
      'en': 'Upload a meal',
      'ar': 'اختر طبق',
      'fr': 'Télécharger un repas',
    },
    'dttw8v98': {
      'en': 'Result',
      'ar': 'النتائج',
      'fr': 'Résultat',
    },
    'f484rltw': {
      'en': 'Calories ✅',
      'ar': 'السعرات الحرارية ✅',
      'fr': 'Calories ✅',
    },
    'rfn5t76k': {
      'en': 'Protein 💪',
      'ar': 'البروتين 💪',
      'fr': 'Protéines 💪',
    },
    'a611z2ri': {
      'en': 'Carbs 🥖',
      'ar': 'الكاربوهيدرات 🥖',
      'fr': 'Glucides 🥖',
    },
    'pce3wora': {
      'en': 'Fat 🧈',
      'ar': 'الدهون 🧈',
      'fr': 'Gras 🧈',
    },
    'vhkfwv8r': {
      'en': 'Advice',
      'ar': 'نصيحة اقتراحية',
      'fr': 'Conseiller',
    },
  },
  // Feedback
  {
    'kucvdf3u': {
      'en': 'How was your result?',
      'ar': 'كيف كانت نتيجتك؟',
      'fr': 'Comment s\'est passé votre résultat ?',
    },
    '8utqzcti': {
      'en': 'Skip',
      'ar': 'تخطي',
      'fr': 'Sauter',
    },
  },
  // ProfileCopyLanguageSelector
  {
    '2k5i12n8': {
      'en': 'Name',
      'ar': 'الاسم',
      'fr': 'Nom',
    },
    'cvqmmepj': {
      'en': 'Email',
      'ar': 'الإيميل',
      'fr': 'Email',
    },
    'rp7lxqmv': {
      'en': 'Weight',
      'ar': 'الوزن',
      'fr': 'Poids',
    },
    'f8nvzudy': {
      'en': 'Height',
      'ar': 'الطول',
      'fr': 'Hauteur',
    },
    'uoa52ax7': {
      'en': 'Age',
      'ar': 'العمر',
      'fr': 'Âge',
    },
    '09dkz082': {
      'en': 'Gender',
      'ar': 'الجنس',
      'fr': 'Genre',
    },
    'g9jgtslc': {
      'en': 'Goal',
      'ar': 'الهدف',
      'fr': 'But',
    },
    'cbn860pe': {
      'en': 'Activty ',
      'ar': 'مستوى النشاط',
      'fr': 'Niveau d\'activité',
    },
    'a3f2yv4m': {
      'en': 'Porfile',
      'ar': 'الحساب تعريفي',
      'fr': 'Compte définitionnel',
    },
    '82kyi4w7': {
      'en': 'Contact us',
      'ar': 'تواصل معنا',
      'fr': 'Contactez-nous',
    },
    'z942u5jy': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
  },
  // navbar
  {
    'p89i7b5b': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
    'fy3ljkk6': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fr': 'Maison',
    },
    'p3m6mblf': {
      'en': 'Profile',
      'ar': 'الحساب تعريفي',
      'fr': 'profil',
    },
    '9ycvw47o': {
      'en': 'Profile',
      'ar': 'الحساب تعريفي',
      'fr': 'profil',
    },
  },
  // feedback1
  {
    'y2svwcwf': {
      'en': 'How was our estimation?',
      'ar': 'كيف كانت نتيجتك؟',
      'fr': 'Comment s\'est passé votre résultat ?',
    },
    'nfzgede5': {
      'en': 'Skip',
      'ar': 'تخطي',
      'fr': 'Sauter',
    },
  },
  // share
  {
    '177cj4cg': {
      'en': 'Enter Your Friend\'s Number',
      'ar': 'أدخل رقم صديقك',
      'fr': 'Entrez le numéro de votre ami',
    },
    'uw4089f4': {
      'en': '9665XXXXXXXX',
      'ar': '9665XXXXXXXX',
      'fr': '9665XXXXXXXX',
    },
    'uuxuujot': {
      'en': 'Send',
      'ar': 'ارسل',
      'fr': 'Envoyer',
    },
  },
  // aboutus
  {
    'ujyw36lr': {
      'en': 'About Us',
      'ar': 'معلومات عنا',
      'fr': 'À propos de nous',
    },
    '26u9acr8': {
      'en': 'Our Vision',
      'ar': 'رؤيتنا',
      'fr': 'Notre vision',
    },
    '1lntv03y': {
      'en':
          'At SOORAT, we envision a world where healthy eating is effortless and accessible to everyone. Aligned with Saudi Vision 2030, we embrace innovation to enhance well-being and promote healthier lifestyles. Using AI with personalized insights, we simplify nutrition tracking and empower users to make smarter food choices. Our goal is to transform the way people approach health, one meal at a time.',
      'ar':
          'في \"سعرات\"، نتطلع إلى عالمٍ يكون فيه تناول الطعام الصحي سهلاً وفي متناول الجميع. تماشياً مع رؤية السعودية 2030، نتبنى الابتكار لتعزيز الصحة والترويج لأنماط حياة صحية. باستخدام الذكاء الاصطناعي مع رؤى شخصية، نُبسّط عملية تتبع التغذية ونمكّن المستخدمين من اتخاذ خيارات غذائية أكثر ذكاءً. هدفنا هو تغيير طريقة تعامل الناس مع صحتهم، وجبةً تلو الأخرى.',
      'fr':
          'Chez SOORAT, nous imaginons un monde où une alimentation saine est accessible à tous et sans effort. Fidèles à la Vision 2030 de l\'Arabie saoudite, nous misons sur l\'innovation pour améliorer le bien-être et promouvoir des modes de vie plus sains. Grâce à l\'IA et à des analyses personnalisées, nous simplifions le suivi nutritionnel et permettons aux utilisateurs de faire des choix alimentaires plus judicieux. Notre objectif est de transformer la façon dont chacun aborde la santé, un repas à la fois.',
    },
    '3vjpmh5v': {
      'en': 'Meet Our Team',
      'ar': 'تعرف على فريقنا',
      'fr': 'Rencontrez notre équipe',
    },
    's5vehnau': {
      'en': 'Alanoud Altuwaijri',
      'ar': 'العنود التويجري',
      'fr': 'Alanoud Altuwaijri',
    },
    '2fwwt6iq': {
      'en': 'Layan Alsalloum',
      'ar': 'ليان السلوم',
      'fr': 'Layan Alsalloum',
    },
    'bcys8urp': {
      'en': 'Deem Alqasir',
      'ar': 'ديم القصير',
      'fr': 'Deem Alqasir',
    },
    '2d3gzw3f': {
      'en':
          '© 2025 Our Amazing Team. Both the predictions result and advice are generated automatically through AI models.',
      'ar': '© ٢٠٢٥ فريقنا الرائع. جميع الحقوق محفوظة.',
      'fr': '© 2025 Notre équipe formidable. Tous droits réservés.',
    },
  },
  // languages
  {
    'exbeuder': {
      'en': 'Choose Your Language',
      'ar': 'اختر لغتك ',
      'fr': 'Choisissez votre langue',
    },
    'ocyd1aam': {
      'en': 'English',
      'ar': 'English',
      'fr': 'English',
    },
    'tfmtv7ip': {
      'en': 'العربية',
      'ar': 'العربية',
      'fr': 'العربية',
    },
    'rbuo5epi': {
      'en': 'Français',
      'ar': 'Français',
      'fr': 'Français',
    },
    'ouanc10k': {
      'en': 'Apply',
      'ar': 'تطبيق',
      'fr': 'Appliquer',
    },
  },
  // Instructions
  {
    'r4sq6k38': {
      'en': 'How to Take a Great Food Photo ',
      'ar': 'كيفية التقاط صورة جيدة للطعام',
      'fr': 'Comment prendre une bonne photo de nourriture',
    },
    'mmghjhgw': {
      'en': 'Tips for Better Food Photos:',
      'ar': 'نصائح للحصول على صور طعام أفضل:',
      'fr': 'Conseils pour prendre de meilleures photos de nourriture :',
    },
    '7ooeey5j': {
      'en':
          'For the best results, Snap your food like a pro! 📸 from above (top-down) 🔝, with good lighting 🌞 and no shadows. Make sure the whole dish is visible and avoid blurry or dark images ❌.',
      'ar':
          'للحصول على أفضل النتائج، التقط صور طعامك باحترافية! 📸 من الأعلى (من الأعلى إلى الأسفل) 🔝، بإضاءة جيدة 🌞 وبدون ظلال. تأكد من أن الطبق كاملاً مرئي، وتجنب الصور الضبابية أو المظلمة ❌.',
      'fr':
          'Pour un résultat optimal, prenez vos plats en photo comme un pro ! 📸 de haut en bas 🔝, avec un bon éclairage 🌞 et sans ombres. Assurez-vous que tout le plat est visible et évitez les images floues ou sombres ❌.',
    },
  },
  // instructions00
  {
    'js65ooqn': {
      'en': 'How to Take Great Food Photos',
      'ar': '',
      'fr': '',
    },
    '06tabxbx': {
      'en': '1',
      'ar': '',
      'fr': '',
    },
    'zmxilydt': {
      'en': 'Find Natural Light',
      'ar': '',
      'fr': '',
    },
    'rgvpbrsn': {
      'en':
          'Position your plate near a window for soft, natural lighting. Avoid harsh direct sunlight or flash.',
      'ar': '',
      'fr': '',
    },
    'ea9f1kqo': {
      'en': '2',
      'ar': '',
      'fr': '',
    },
    'et0t9yr4': {
      'en': 'Choose the Right Angle',
      'ar': '',
      'fr': '',
    },
    'xhip7oq4': {
      'en':
          'Try shooting from directly above (flat lay) or at a 45-degree angle to showcase your dish\'s best features.',
      'ar': '',
      'fr': '',
    },
    'opcftrh6': {
      'en': '3',
      'ar': '',
      'fr': '',
    },
    'pzpsq2mx': {
      'en': 'Keep It Simple',
      'ar': '',
      'fr': '',
    },
    '1padeezx': {
      'en':
          'Use a clean, uncluttered background. White plates and neutral surfaces work best to make your food stand out.',
      'ar': '',
      'fr': '',
    },
    'yv7iqlzb': {
      'en': '4',
      'ar': '',
      'fr': '',
    },
    '52feqftu': {
      'en': 'Focus on Details',
      'ar': '',
      'fr': '',
    },
    'qjlmpjt5': {
      'en':
          'Make sure your dish is the star. Capture textures, colors, and garnishes that make your food special.',
      'ar': '',
      'fr': '',
    },
    'swvfnw56': {
      'en': 'Take Your Photo',
      'ar': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'w2cyjsqn': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '50ny2cdm': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '3mlwrr45': {
      'en': 'This app requires camera access to take food pictures.',
      'ar': '',
      'fr': '',
    },
    'turnboi0': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'hpal1ce9': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'oe54jfqw': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'jduslurg': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'zv8tifak': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'k2lwjdpt': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'eh7cnhyh': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '0v6li1ii': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'd30lae24': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'to7dsjh6': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'tvbd8few': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'fdf7rbif': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ov07plsq': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'kk3kdh8g': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'zsmvn0hh': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '4p80f62u': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '8w64ewrz': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'sa6wvgm2': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '9h41ppmu': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'hohpx38e': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '5jm8kxnu': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'm9aktmjz': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'qgzclolg': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    't1u8xgne': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'm60fgzmw': {
      'en': '',
      'ar': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
