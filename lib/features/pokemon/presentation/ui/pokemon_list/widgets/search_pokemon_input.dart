import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';

class SearchPokemonInput extends StatelessWidget {
  const SearchPokemonInput({
    super.key,
    required this.onChanged,
    this.controller,
  });

  final TextEditingController? controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 16, color: Colors.black87),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade400,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: BaseColors.pokedexRed,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
