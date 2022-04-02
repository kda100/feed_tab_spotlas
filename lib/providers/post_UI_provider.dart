class PostUIProvider {
  double _XXXXS = 1; //these are all different spacing used in each post widget.
  double _XXXS = 1;
  double _XXS = 2;
  double _XS = 4;
  double _S = 8;
  double _M = 12;
  double _L = 16;
  double _XL = 24;
  double _XXL = 32;
  double _XXXL = 48;
  double _XXXXL = 96;
  double _XXXXXL = 180;
  double _captionTextSize = 14;
  double _headerTextSize = 15;
  double _iconSize = 30;
  double _likeAnimationSize = 100;

  PostUIProvider({required Size deviceSize}) {
    final double height = deviceSize.height;
    final double width = deviceSize.width;

    if (height > 667 && width > 320) {
      if (height < 812 && width < 375) {
        // medium phone size
        _XXXS *= 2;
        _XXS *= 2;
        _XS *= 2;
        _S *= 1.1;
        _M *= 1.1;
        _L *= 1.1;
        _XL *= 4 / 3;
        _XXL *= 1.1;
        _XXXL *= 4 / 3;
        _XXXXL *= 4 / 3;
        _XXXXXL += 15;
        _captionTextSize += 1;
        _headerTextSize += 1;
        _iconSize += 1;
        _likeAnimationSize += 10;
      } else {
        //large phone size.
        _XXXS *= 3;
        _XXS *= 3;
        _XS *= 3;
        _S *= 1.2;
        _M *= 1.2;
        _L *= 1.2;
        _XL *= 5 / 3;
        _XXL *= 1.2;
        _XXXL *= 5 / 3;
        _XXXXL *= 5 / 3;
        _XXXXXL += 30;
        _captionTextSize += 2;
        _headerTextSize += 2;
        _iconSize += 2;
        _likeAnimationSize += 20;
      }
    }
  }

  double get XXXXS => _XXXXS;
  double get XXXS => _XXXS;
  double get XXS => _XXS;
  double get XS => _XS;
  double get S => _S;
  double get M => _M;
  double get L => _L;
  double get XL => _XL;
  double get XXL => _XXL;
  double get XXXL => _XXXL;
  double get XXXXL => _XXXXL;
  double get XXXXXL => _XXXXXL;
  double get bodyTextSize => _captionTextSize;
  double get headerTextSize => _headerTextSize;
  double get iconSize => _iconSize;
  double get likeAnimationSize => _likeAnimationSize;
}
