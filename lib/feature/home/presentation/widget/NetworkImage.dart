

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget networkImage(String url) {
  if (url.endsWith('.svg')) {
    return SvgPicture.network(
      url,
      height: 60,
      width: 60,
      placeholderBuilder: (_) => const CircularProgressIndicator(),
    );
  } else {
    return Image.network(
      url,
      height: 60,
      width: 60,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
    );
  }
}
