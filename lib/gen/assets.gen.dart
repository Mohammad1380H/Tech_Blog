/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/Icons/hashTag.png
  AssetGenImage get hashTag => const AssetGenImage('assets/Icons/hashTag.png');

  /// File path: assets/Icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/Icons/home.png');

  /// File path: assets/Icons/penLogo.png
  AssetGenImage get penLogo => const AssetGenImage('assets/Icons/penLogo.png');

  /// File path: assets/Icons/podIcon.png
  AssetGenImage get podIcon => const AssetGenImage('assets/Icons/podIcon.png');

  /// File path: assets/Icons/techBot.svg
  SvgGenImage get techBot => const SvgGenImage('assets/Icons/techBot.svg');

  /// File path: assets/Icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/Icons/user.png');

  /// File path: assets/Icons/writer.png
  AssetGenImage get writer => const AssetGenImage('assets/Icons/writer.png');

  /// List of all assets
  List<dynamic> get values =>
      [hashTag, home, penLogo, podIcon, techBot, user, writer];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/Images/ArtPic.png
  AssetGenImage get artPic => const AssetGenImage('assets/Images/ArtPic.png');

  /// File path: assets/Images/appBarLogo.png
  AssetGenImage get appBarLogo =>
      const AssetGenImage('assets/Images/appBarLogo.png');

  /// File path: assets/Images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/Images/profile.png');

  /// File path: assets/Images/programming.png
  AssetGenImage get programming =>
      const AssetGenImage('assets/Images/programming.png');

  /// File path: assets/Images/salidity.png
  AssetGenImage get salidity =>
      const AssetGenImage('assets/Images/salidity.png');

  /// File path: assets/Images/splashIcon.png
  AssetGenImage get splashIcon =>
      const AssetGenImage('assets/Images/splashIcon.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [artPic, appBarLogo, profile, programming, salidity, splashIcon];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
