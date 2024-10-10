import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum ImageProviderTyep { asset, network }

class XImageProvider extends StatelessWidget {
  final String path;
  final BoxFit fit;
  final Widget? child;
  final double? height;
  final double? width;
  const XImageProvider({
    super.key,
    required this.path,
    this.fit = BoxFit.cover,
    this.child,
    this.height,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return _findWidget(path._findType);
  }

  dynamic _findWidget(ImageProviderTyep tyep) {
    switch (tyep) {
      case ImageProviderTyep.asset:
        return _assetProviderDecorion();
      default:
        return _networkImage();
    }
  }

  Widget _assetProviderDecorion() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: fit,
          image: AssetImage(path),
        ),
      ),
      child: child,
    );
  }

  Widget _networkImage() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: fit,
          image: CachedNetworkImageProvider(path),
        ),
      ),
      child: child,
    );
  }
}

extension ImageProvider on String {
  ImageProviderTyep get _findType {
    var isAsset = startsWith("assets");
    if (isAsset) {
      return ImageProviderTyep.asset;
    }
    return ImageProviderTyep.network;
  }
}
