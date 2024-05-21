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
}

class AppImgAssets {
  AppImgAssets._();

  static const _prefix = 'assets/images';

  static const profileImage = '$_prefix/profile_image.png';
}
