import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../themes/app_theme.dart';
import '../bloc/todo_bloc.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        final currentFilter = state is TodoLoaded
            ? state.currentFilter
            : TodoFilter.all;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _buildFilterChip(
                context,
                label: 'All',
                icon: LucideIcons.list,
                filter: TodoFilter.all,
                isSelected: currentFilter == TodoFilter.all,
              ),
              const SizedBox(width: 8),
              _buildFilterChip(
                context,
                label: 'Pending',
                icon: LucideIcons.clock,
                filter: TodoFilter.pending,
                isSelected: currentFilter == TodoFilter.pending,
              ),
              const SizedBox(width: 8),
              _buildFilterChip(
                context,
                label: 'Completed',
                icon: LucideIcons.checkCircle,
                filter: TodoFilter.completed,
                isSelected: currentFilter == TodoFilter.completed,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterChip(
    BuildContext context, {
    required String label,
    required IconData icon,
    required TodoFilter filter,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        context.read<TodoBloc>().add(FilterTodosEvent(filter));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.textHint.withAlpha((0.3 * 255).toInt()),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : AppColors.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isSelected ? Colors.white : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
