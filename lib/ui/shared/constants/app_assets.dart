class AppSvgAssets {
  AppSvgAssets._();

  static const _prefix = 'assets/svgs';

  static const btcUsdt = '$_prefix/btc_usdt.svg';
  static const companyLogoDark = '$_prefix/company_logo_dark.svg';
  static const companyLogoLight = '$_prefix/company_logo_light.svg';
  static String companyLogo(String brightness) =>
      '$_prefix/company_logo_$brightness.svg';
  static const expand = '$_prefix/expand.svg';
  static const globe = '$_prefix/globe.svg';
  static const menu = '$_prefix/menu.svg';
  static const arrangement1 = '$_prefix/arrangement1.svg';
  static const arrangement2 = '$_prefix/arrangement2.svg';
  static const arrangement3 = '$_prefix/arrangement3.svg';
}

class AppImgAssets {
  AppImgAssets._();

  static const _prefix = 'assets/images';

  static const profileImage = '$_prefix/profile_image.png';
}
