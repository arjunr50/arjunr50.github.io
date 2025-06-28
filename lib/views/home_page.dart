import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/device_type.dart';
import 'package:portfolio/views/portfolio_mobile.dart';
import 'package:portfolio/views/portfolio_tab.dart';
import 'package:portfolio/views/portfolio_web.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());
  final ValueNotifier<bool> _hasScrolled = ValueNotifier(false);
  final ScrollController _scrollController = ScrollController();
  double _scrollOffsets = 0.0;
  DeviceType? _lastDeviceType;

  void onSectionSelected(int index) async {
    _scrollController.removeListener(_onScroll);
    final contextSection = _sectionKeys[index].currentContext;
    if (contextSection != null) {
      await Scrollable.ensureVisible(
        contextSection,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _selectedIndex.value = index;
      _scrollOffsets = _scrollController.offset;
    }
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    double minDiff = double.infinity;
    int currentSection = 0;
    final screenHeight = MediaQuery.of(context).size.height;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if ((maxScroll - currentScroll).abs() < 10) {
      currentSection = _sectionKeys.length - 1;
    } else {
      for (int i = 0; i < _sectionKeys.length; i++) {
        final context = _sectionKeys[i].currentContext;
        if (context != null) {
          final box = context.findRenderObject() as RenderBox;
          final position = box.localToGlobal(Offset.zero);
          final diff = position.dy.abs();

          if (position.dy <= screenHeight * 0.25 && diff < minDiff) {
            minDiff = diff;
            currentSection = i;
          }
        }
      }
    }

    if (_selectedIndex.value != currentSection) {
      _selectedIndex.value = currentSection;
    }
    _scrollOffsets = _scrollController.offset;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final deviceType = ScreenType(MediaQuery.of(context).size.width).screen;
    if (_lastDeviceType != deviceType) {
      _lastDeviceType = deviceType;
      WidgetsBinding.instance.addPostFrameCallback((__) {
        if (_scrollController.hasClients) {
          final offset = _scrollOffsets;
          _scrollController.jumpTo(offset);
          _onScroll();
        }
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _onScroll();
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      switch (ScreenType(constraints.maxWidth).screen) {
        case DeviceType.web:
          return PortfolioWeb(
              deviceType: DeviceType.web,
              sectionKeys: _sectionKeys,
              selectedIndex: _selectedIndex,
              onSectionSelected: onSectionSelected,
              hasScrolled: _hasScrolled,
              scrollController: _scrollController);
        case DeviceType.tab:
          return PortfolioTab(
              deviceType: DeviceType.tab,
              sectionKeys: _sectionKeys,
              onSectionSelected: onSectionSelected,
              selectedIndex: _selectedIndex,
              hasScrolled: _hasScrolled,
              scrollController: _scrollController);
        case DeviceType.phone:
          return PortfolioMobile(
              deviceType: DeviceType.phone,
              sectionKeys: _sectionKeys,
              onSectionSelected: onSectionSelected,
              selectedIndex: _selectedIndex,
              hasScrolled: _hasScrolled,
              scrollController: _scrollController);
      }
    });
  }
}
