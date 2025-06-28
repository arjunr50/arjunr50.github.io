enum DeviceType { phone, web, tab }

class ScreenType {
  final double maxWidth;

  ScreenType(this.maxWidth);

  DeviceType get screen {
    if (maxWidth > 950) return DeviceType.web;
    if (maxWidth > 650) return DeviceType.tab;
    return DeviceType.phone;
  }
}