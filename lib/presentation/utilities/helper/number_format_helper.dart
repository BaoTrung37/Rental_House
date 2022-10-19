class NumberFormatHelper {
  static String formatPrice(int price) {
    const oneThousand = 1000;
    const oneMillion = 1000000;
    if (price < oneMillion) {
      return '${(price / oneThousand).toStringAsFixed(1)}K';
    } else {
      return '${(price / oneMillion).toStringAsFixed(1)} triệu VND';
    }
  }
}
