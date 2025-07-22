import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../themes/app_theme.dart';
import '../bloc/todo_bloc.dart';

class EmptyState extends StatelessWidget {
  final TodoFilter filter;
  final String searchQuery;

  const EmptyState({
    super.key,
    required this.filter,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: _getEmptyStateColor().withAlpha((0.1 * 255).toInt()),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getEmptyStateIcon(),
                size: 60,
                color: _getEmptyStateColor().withAlpha((0.6 * 255).toInt()),
              ),
            ),

            const SizedBox(height: 24),

            // Title
            Text(
              _getEmptyStateTitle(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            // Subtitle
            Text(
              _getEmptyStateSubtitle(),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // Action button (if applicable)
            if (_shouldShowActionButton())
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.primary.withAlpha((0.8 * 255).toInt()),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withAlpha((0.3 * 255).toInt()),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // This will be handled by the floating action button
                    // Just for visual feedback
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  icon: const Icon(LucideIcons.plus, color: Colors.white),
                  label: const Text(
                    'Create your first todo',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getEmptyStateColor() {
    if (searchQuery.isNotEmpty) {
      return AppColors.info;
    }

    switch (filter) {
      case TodoFilter.completed:
        return AppColors.success;
      case TodoFilter.pending:
        return AppColors.warning;
      case TodoFilter.all:
        return AppColors.primary;
    }
  }

  IconData _getEmptyStateIcon() {
    if (searchQuery.isNotEmpty) {
      return LucideIcons.search;
    }

    switch (filter) {
      case TodoFilter.completed:
        return LucideIcons.checkCircle;
      case TodoFilter.pending:
        return LucideIcons.clock;
      case TodoFilter.all:
        return LucideIcons.clipboard;
    }
  }

  String _getEmptyStateTitle() {
    if (searchQuery.isNotEmpty) {
      return 'No todos found';
    }

    switch (filter) {
      case TodoFilter.completed:
        return 'No completed todos';
      case TodoFilter.pending:
        return 'No pending todos';
      case TodoFilter.all:
        return 'Your todo list is empty';
    }
  }

  String _getEmptyStateSubtitle() {
    if (searchQuery.isNotEmpty) {
      return 'Try adjusting your search terms or check the spelling.';
    }

    switch (filter) {
      case TodoFilter.completed:
        return 'Complete some todos to see them here.';
      case TodoFilter.pending:
        return 'Great! You have no pending tasks right now.';
      case TodoFilter.all:
        return 'Start by creating your first todo to get organized!';
    }
  }

  bool _shouldShowActionButton() {
    return filter == TodoFilter.all && searchQuery.isEmpty;
  }
}
