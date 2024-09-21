abstract class Assets {
  static const _iconPath = 'assets/icons';
  static const _imagePath = 'assets/images';

  static const filter = '$_iconPath/filter.svg';
  static const glamping = '$_iconPath/glamping.svg';
  static final houses =
      List.generate(8, (index) => '$_iconPath/house_$index.svg');
  static const map = '$_iconPath/map.svg';
  static const menu = '$_iconPath/menu.svg';
  static const menu2 = '$_iconPath/menu2.svg';
  static const search = '$_iconPath/search.svg';
  static const send = '$_iconPath/send.svg';

  static const image = '$_imagePath/image.png';
  static final images =
      List.generate(8, (index) => '$_imagePath/image_$index.png');
}
