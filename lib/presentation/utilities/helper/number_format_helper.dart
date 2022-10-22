class NumberFormatHelper {
  static String formatPrice(int price) {
    const oneThousand = 1000;
    const oneMillion = 1000000;
    if (price < oneMillion) {
      return '${(price / oneThousand).toStringAsFixed(price % 10 == 0 ? 0 : 1)}K';
    } else {
      return '${(price / oneMillion).toStringAsFixed(price % 10 == 0 ? 0 : 1)} triệu VND';
    }
  }
}
