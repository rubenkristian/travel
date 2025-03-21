import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final String hint;
  final Function(String) onSearch;
  final TextEditingController controller;

  const SearchBox({
    super.key,
    required this.hint,
    required this.onSearch,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          autofocus: false,
          onTapOutside: (_) => FocusManager.instance.primaryFocus!.unfocus(),
          onChanged: (value) {
            onSearch(value);
          },
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.white70),
            isDense: true,
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
