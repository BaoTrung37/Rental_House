import 'package:intl/intl.dart';

class NumberFormatHelper {
  static String formatShortPrice(int price) {
    if (price == 0) {
      return 'Miễn phí';
    }

    const oneThousand = 1000;
    const oneMillion = 1000000;
    if (price > oneMillion) {
      return '${(price / oneMillion).toStringAsFixed(price % 10 == 0 ? 0 : 1)} triệu VND';
    } else if (price >= oneThousand && price < oneMillion) {
      return '${(price / oneThousand).toStringAsFixed(price % 10 == 0 ? 0 : 1)}K';
    } else {
      return '$price VND';
    }
  }

  static String formatPrice(int price) {
    return NumberFormat('#,###,###,###', 'vi_VN').format(price);
  }
}
