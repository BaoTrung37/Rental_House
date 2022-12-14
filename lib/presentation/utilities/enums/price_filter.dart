enum PriceFilter {
  tam500nghin,
  tam1trieu,
  tam2trieu,
  tam3trieu,
  tam4trieu,
  tam5trieu,
  tam6trieu,
  tam7trieu,
  tam8trieu,
  tam9trieu,
  tam10trieu,
}

extension PriceFilterFunction on PriceFilter {
  String get title {
    switch (this) {
      case PriceFilter.tam500nghin:
        return '500 nghìn';
      case PriceFilter.tam1trieu:
        return '1 triệu';
      case PriceFilter.tam2trieu:
        return '2 triệu';
      case PriceFilter.tam3trieu:
        return '3 triệu';
      case PriceFilter.tam4trieu:
        return '4 triệu';
      case PriceFilter.tam5trieu:
        return '5 triệu';
      case PriceFilter.tam6trieu:
        return '6 triệu';
      case PriceFilter.tam7trieu:
        return '7 triệu';
      case PriceFilter.tam8trieu:
        return '8 triệu';
      case PriceFilter.tam9trieu:
        return '9 triệu';
      case PriceFilter.tam10trieu:
        return '10 triệu';
    }
  }

  int get value {
    switch (this) {
      case PriceFilter.tam500nghin:
        return 500000;
      case PriceFilter.tam1trieu:
        return 1000000;
      case PriceFilter.tam2trieu:
        return 2000000;
      case PriceFilter.tam3trieu:
        return 3000000;
      case PriceFilter.tam4trieu:
        return 4000000;
      case PriceFilter.tam5trieu:
        return 5000000;
      case PriceFilter.tam6trieu:
        return 6000000;
      case PriceFilter.tam7trieu:
        return 7000000;
      case PriceFilter.tam8trieu:
        return 8000000;
      case PriceFilter.tam9trieu:
        return 9000000;
      case PriceFilter.tam10trieu:
        return 10000000;
    }
  }
}
