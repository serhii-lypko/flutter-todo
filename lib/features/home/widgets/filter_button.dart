import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ViewFilter { all, activeOnly, completedOnly }

// extension FilterButton on ViewFilter {
//   bool apply() {
//     return false;
//   }
// }

class TodosOverviewFilterButton extends StatelessWidget {
  const TodosOverviewFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ViewFilter>(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      tooltip: "Hello world",
      onSelected: (filter) {
        //
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: ViewFilter.all,
            child: Text("hello"),
          ),
        ];
      },
      icon: const Icon(Icons.filter_list_rounded),
    );
  }
}
