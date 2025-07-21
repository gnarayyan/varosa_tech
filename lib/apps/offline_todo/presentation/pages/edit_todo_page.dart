import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../themes/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/todo.dart';
import '../bloc/todo_bloc.dart';

@RoutePage()
class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({super.key, required this.todo});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late int selectedPriority;
  DateTime? selectedDueDate;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.todo.title);
    descriptionController = TextEditingController(
      text: widget.todo.description ?? '',
    );
    selectedPriority = widget.todo.priority;
    selectedDueDate = widget.todo.dueDate;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Edit Todo'),
        actions: [
          TextButton(
            onPressed: _saveTodo,
            child: const Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Enter todo title',
              ),
            ),
            const SizedBox(height: 16),

            // Description
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description (Optional)',
                hintText: 'Enter todo description',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            // Priority
            Text('Priority', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                PriorityChip(
                  label: 'Low',
                  priority: 1,
                  isSelected: selectedPriority == 1,
                  color: AppColors.success,
                  onTap: () => setState(() => selectedPriority = 1),
                ),
                const SizedBox(width: 8),
                PriorityChip(
                  label: 'Medium',
                  priority: 2,
                  isSelected: selectedPriority == 2,
                  color: AppColors.warning,
                  onTap: () => setState(() => selectedPriority = 2),
                ),
                const SizedBox(width: 8),
                PriorityChip(
                  label: 'High',
                  priority: 3,
                  isSelected: selectedPriority == 3,
                  color: AppColors.error,
                  onTap: () => setState(() => selectedPriority = 3),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Due Date
            Row(
              children: [
                Text(
                  'Due Date:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                TextButton.icon(
                  onPressed: _pickDueDate,
                  icon: const Icon(LucideIcons.calendar),
                  label: Text(
                    selectedDueDate != null
                        ? '${selectedDueDate!.day}/${selectedDueDate!.month}/${selectedDueDate!.year}'
                        : 'Select Date',
                  ),
                ),
                if (selectedDueDate != null)
                  IconButton(
                    onPressed: () => setState(() => selectedDueDate = null),
                    icon: const Icon(LucideIcons.x, size: 16),
                  ),
              ],
            ),
            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => context.back(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final title = titleController.text.trim();
                    if (title.isNotEmpty) {
                      final updatedTodo = widget.todo.copyWith(
                        title: title,
                        description: descriptionController.text.trim().isEmpty
                            ? null
                            : descriptionController.text.trim(),
                        priority: selectedPriority,
                        dueDate: selectedDueDate,
                      );
                      context.read<TodoBloc>().add(
                        UpdateTodoEvent(updatedTodo),
                      );
                      context.back();
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDueDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      setState(() => selectedDueDate = date);
    }
  }

  void _saveTodo() {
    final title = titleController.text.trim();
    if (title.isNotEmpty) {
      final updatedTodo = widget.todo.copyWith(
        title: title,
        description: descriptionController.text.trim().isEmpty
            ? null
            : descriptionController.text.trim(),
        priority: selectedPriority,
        dueDate: selectedDueDate,
      );

      context.read<TodoBloc>().add(UpdateTodoEvent(updatedTodo));
      Navigator.of(context).pop();
    }
  }
}

class PriorityChip extends StatelessWidget {
  final String label;
  final int priority;
  final bool isSelected;
  final Color color;
  final void Function() onTap;

  const PriorityChip({
    super.key,
    required this.label,
    required this.priority,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? color : color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color, width: isSelected ? 2 : 1),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isSelected ? Colors.white : color,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
