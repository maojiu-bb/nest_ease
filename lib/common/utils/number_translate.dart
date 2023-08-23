// 将数字转换成对应的字符

class NumberTranslate {
  final int count;

  NumberTranslate(this.count);

  // count 小于 5000 显示原数字
  // count 大于 5000 显示 0.5+K
  // count 大于 50K 显示 0.5+M
  // count 大于 50M 显示 0.5+B

  String translate() {
    if (count < 5000) {
      return count.toString();
    } else if (count < 50000) {
      double kCount = count / 1000;
      return '${kCount.toStringAsFixed(1)}K';
    } else if (count < 50000000) {
      double mCount = count / 1000000;
      return '${mCount.toStringAsFixed(1)}M';
    } else {
      double bCount = count / 1000000000;
      return '${bCount.toStringAsFixed(1)}B';
    }
  }
}
