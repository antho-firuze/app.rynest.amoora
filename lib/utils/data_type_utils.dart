extension DataTypeUtilDynamic on dynamic {
  bool toBool() {
    return this is String
        ? this == 'true'
            ? true
            : this == '1'
                ? true
                : false
        : this is int
            ? this == 1
                ? true
                : false
            : false;
  }
}
