import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../themes/app_theme.dart';
import '../bloc/todo_bloc.dart';
import '../widgets/todo_list.dart';
import '../widgets/filter_chips.dart';

@RoutePage()
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Offline Todo'),
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(LucideIcons.search),
        //     onPressed: () => _showSearchDialog(context),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          // Search and Filter Section
          Container(
            color: AppColors.surface,
            child: Column(
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search todos...',
                      prefixIcon: const Icon(LucideIcons.search, size: 20),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(LucideIcons.x, size: 16),
                              onPressed: () {
                                _searchController.clear();
                                context.read<TodoBloc>().add(LoadTodos());
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: AppColors.background,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    onChanged: (query) {
                      setState(() {});
                      context.read<TodoBloc>().add(SearchTodosEvent(query));
                    },
                  ),
                ),

                // Filter Chips
                const FilterChips(),

                const SizedBox(height: 8),
              ],
            ),
          ),

          // Todo List
          Expanded(
            child: Builder(
              builder: (context) {
                return TodoList();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushRoute(const AddTodoRoute()),
        backgroundColor: AppColors.primary,
        child: const Icon(LucideIcons.plus),
      ),
    );
  }

  // void _showSearchDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Search Todos'),
  //       content: TextField(
  //         controller: _searchController,
  //         decoration: const InputDecoration(
  //           hintText: 'Enter search term...',
  //           prefixIcon: Icon(LucideIcons.search),
  //         ),
  //         autofocus: true,
  //         onSubmitted: (query) {
  //           context.read<TodoBloc>().add(SearchTodosEvent(query));
  //           Navigator.of(context).pop();
  //         },
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(),
  //           child: const Text('Cancel'),
  //         ),
  //         ElevatedButton(
  //           onPressed: () {
  //             context.read<TodoBloc>().add(
  //               SearchTodosEvent(_searchController.text),
  //             );
  //             Navigator.of(context).pop();
  //           },
  //           child: const Text('Search'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
