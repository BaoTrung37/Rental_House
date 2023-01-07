enum LoginType {
  customer,
  admin,
}

extension LoginTypeFunction on LoginType {
  String get name {
    switch (this) {
      case LoginType.customer:
        return 'Khách hàng';
      case LoginType.admin:
        return 'Quản trị viên';
    }
  }

  String get index {
    switch (this) {
      case LoginType.customer:
        return '0';
      case LoginType.admin:
        return '1';
    }
  }
}
