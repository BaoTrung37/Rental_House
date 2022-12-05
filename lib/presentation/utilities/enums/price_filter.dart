enum PriceFilter {
  e500k,
  e1M,
  e2M,
  e3M,
  e4M,
  e5M,
  e6M,
  e7M,
  e8M,
  e9M,
  p10M,
}

extension PriceFilterFunction on PriceFilter {
  String get name {
    switch (this) {
      case PriceFilter.e500k:
        return '500 nghìn';
      case PriceFilter.e1M:
        return '1 triệu';
      case PriceFilter.e2M:
        return '2 triệu';
      case PriceFilter.e3M:
        return '3 triệu';
      case PriceFilter.e4M:
        return '4 triệu';
      case PriceFilter.e5M:
        return '5 triệu';
      case PriceFilter.e6M:
        return '6 triệu';
      case PriceFilter.e7M:
        return '7 triệu';
      case PriceFilter.e8M:
        return '8 triệu';
      case PriceFilter.e9M:
        return '9 triệu';
      case PriceFilter.p10M:
        return '10 triệu';
    }
  }

  int get value {
    switch (this) {
      case PriceFilter.e500k:
        return 500000;
      case PriceFilter.e1M:
        return 1000000;
      case PriceFilter.e2M:
        return 2000000;
      case PriceFilter.e3M:
        return 3000000;
      case PriceFilter.e4M:
        return 4000000;
      case PriceFilter.e5M:
        return 5000000;
      case PriceFilter.e6M:
        return 6000000;
      case PriceFilter.e7M:
        return 7000000;
      case PriceFilter.e8M:
        return 8000000;
      case PriceFilter.e9M:
        return 9000000;
      case PriceFilter.p10M:
        return 1000000;
    }
  }
}
