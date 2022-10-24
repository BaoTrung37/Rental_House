import 'package:form_validator/form_validator.dart';

typedef GetCompareText = String Function();

class Validator extends ValidationBuilder {
  Validator({
    this.needTrimText = false,
  }) : super(optional: true);

  final bool needTrimText;

  static final RegExp passwordRegExp =
      RegExp(r'^[\wｧ-ﾝﾞﾟ!“#$%&()*+,\-./:;<=>?@[\]^_`{|}~]+$');

  static final nickNameRegex = RegExp(
      r'((070|080|090)\d{8})|(わらわ|わやわ|わまわ)|(電話|番号|メール教|メール欲|メール知|メアド教|メアド欲|メアド知|アドレス教|アドレス欲|アドレス知)|([_|＿]+)$');

  static final emailRegExp = RegExp(
      r'^[a-zA-Z0-9_\-+/!%]+(\.[a-zA-Z0-9_\-+/!%]+)*[a-zA-Z0-9_\-+/!%]*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9.-]+)?$');

  static final halfWidthAlphanumericalSymbolRegExp =
      RegExp(r"""^[\w\sｧ-ﾝﾞﾟ!@#$%^&*()-_=+{}|;:'"‘“’”,<.>/?]*$""");

  static final halfwidthRegExp = RegExp('[ｧ-ﾝﾞﾟ]');

  static final hiraganaRegExp = RegExp(r'^[ぁ-ん]+$');

  static final japanPhoneRegExp = RegExp(r'^(070|080|090)\d{8}$');

  static final anyPhoneRegExp = RegExp(r'^0\d{9}$');

  static final foreignPhoneRegExp = RegExp(r'^\+[1-9]\d*$');

  static final postcodeRegExp = RegExp(r'^\d{7}$');

  /// Custom build logic
  @override
  String? test(String? value) {
    final validatedValue = needTrimText ? value?.trim() : value;

    for (final validate in validations) {
      final result = validate(validatedValue);
      if (result != null) {
        return result;
      }
    }
    return null;
  }

  @override
  ValidationBuilder required([String? message]) {
    final error = message ?? 'Bạn cần điền thông tin này';

    // Handle execute required validation first before other validations
    validations.insert(
      0,
      (value) => (value == null || value.isEmpty) ? error : null,
    );
    return this;
  }

//   @override
//   ValidationBuilder email([String? message]) {
//     final error =
//         message ?? AppLocalizations.current.error_NFC_APP_MSG005_content;
//     return add(
//       (value) => (value == null || emailRegExp.hasMatch(value)) ? null : error,
//     );
//   }

  @override
  ValidationBuilder phone([String? message]) {
    final error = message ?? 'Số điện thoại không hợp lệ';
    return add(
      (value) => (value == null ||
              value.isEmpty ||
              Validator.anyPhoneRegExp.hasMatch(value) ||
              Validator.foreignPhoneRegExp.hasMatch(value))
          ? null
          : error,
    );
  }

//   @override
//   ValidationBuilder minLength(int minLength, [String? message]) {
//     final error =
//         message ?? AppLocalizations.current.validation_minLength('$minLength');
//     return add(
//       (value) => (value != null && value.length < minLength) ? error : null,
//     );
//   }

  @override
  ValidationBuilder maxLength(int maxLength, [String? message]) {
    final error = message ?? 'Tối đa $maxLength ký tự';
    return add(
      (value) => (value != null && value.length > maxLength) ? error : null,
    );
  }

//   /// If value contain text in regex, return error
//   @override
//   ValidationBuilder regExp(RegExp regExp, String message) {
//     final error = AppLocalizations.current.validation_invalid_value;
//     return add(
//         (value) => value != null && regExp.hasMatch(value) ? error : null);
//   }
// }

// extension ValidatorExtension on ValidationBuilder {
//   ValidationBuilder matchString(
//     GetCompareText compareText, [
//     String? message,
//   ]) {
//     final error =
//         message ?? AppLocalizations.current.error_NFC_APP_MSG006_content;

//     return add(
//       (value) => (value != null && value != compareText()) ? error : null,
//     );
//   }

//   ValidationBuilder password([String? message]) {
//     final error =
//         message ?? AppLocalizations.current.error_NFC_APP_MSG003_content;
//     return add(
//       (value) => (value == null ||
//               (Validator.passwordRegExp.hasMatch(value) &&
  // !Validator.halfwidthRegExp.hasMatch(value)))
  // ? null
//           : error,
//     );
//   }

//   ValidationBuilder halfWidthCharacters([String? message]) {
//     final error =
//         message ?? AppLocalizations.current.error_NFC_APP_MSG017_content;
//     return add(
//       (value) => (value == null ||
//               value.isEmpty ||
//               Validator.halfWidthAlphanumericalSymbolRegExp.hasMatch(value))
//           ? null
//           : error,
//     );
//   }

//   ValidationBuilder hiragana([String? message]) {
//     final error =
//         message ?? AppLocalizations.current.error_NFC_APP_MSG017_content;
//     return add(
//       (value) => (value == null ||
//               value.isEmpty ||
//               Validator.hiraganaRegExp.hasMatch(value))
//           ? null
//           : error,
//     );
//   }

//   ValidationBuilder postCode([String? message]) {
//     final error =
//         message ?? AppLocalizations.current.error_NFC_APP_MSG010_content;
//     return add(
//       (value) => (value == null ||
//               value.isEmpty ||
//               Validator.postcodeRegExp.hasMatch(value))
  // ? null
//           : error,
//     );
//   }
}
