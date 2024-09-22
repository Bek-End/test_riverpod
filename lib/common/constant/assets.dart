abstract class Assets {
  static const _iconPath = 'assets/icons';
  static const _imagePath = 'assets/images';

  static const arrowLeft = '$_iconPath/arrow_left.svg';
  static const calendar = '$_iconPath/calendar.svg';
  static const divideCircle = '$_iconPath/divide_circle.svg';
  static final facilities =
      List.generate(7, (index) => '$_iconPath/facility_$index.svg');
  static const filter = '$_iconPath/filter.svg';
  static const glamping = '$_iconPath/glamping.svg';
  static const heart = '$_iconPath/heart.svg';
  static final houses =
      List.generate(8, (index) => '$_iconPath/house_$index.svg');
  static const logOut = '$_iconPath/log_out.svg';
  static const map = '$_iconPath/map.svg';
  static const menu = '$_iconPath/menu.svg';
  static const menu2 = '$_iconPath/menu2.svg';
  static const messageCircle = '$_iconPath/message_circle.svg';
  static const phone = '$_iconPath/phone.svg';
  static const plusCircle = '$_iconPath/plus_circle.svg';
  static const search = '$_iconPath/search.svg';
  static const send = '$_iconPath/send.svg';
  static const track = '$_iconPath/track.svg';

  static final images =
      List.generate(8, (index) => '$_imagePath/image_$index.png');
  static const image = '$_imagePath/image.png';
  static const mapImage = '$_imagePath/map.png';
}
