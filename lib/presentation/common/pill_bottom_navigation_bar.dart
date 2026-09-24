import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class PillNavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const PillNavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

class PillBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onIndexChanged;
  final List<PillNavItem> items;

  const PillBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(
                  color: AppColors.border,
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0F172A).withValues(alpha: 0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                  BoxShadow(
                    color: const Color(0xFF0F172A).withValues(alpha: 0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(items.length, (index) {
                  final isSelected = currentIndex == index;
                  final item = items[index];

                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => onIndexChanged(index),
                          borderRadius: BorderRadius.circular(24),
                          splashColor: AppColors.primaryLight,
                          highlightColor: Colors.transparent,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeOutCubic,
                            height: 48,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primaryLight
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primaryBorder
                                    : Colors.transparent,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  isSelected ? item.activeIcon : item.icon,
                                  size: 22,
                                  color: isSelected
                                      ? AppColors.primary
                                      : const Color(0xFF64748B),
                                ),
                                if (isSelected) ...[
                                  const SizedBox(width: 8),
                                  Flexible(
                                    child: Text(
                                      item.label,
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primary,
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
