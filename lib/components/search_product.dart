import 'package:flutter/material.dart';

class GlobalSearchBar extends StatefulWidget{
  const GlobalSearchBar({super.key, required this.onSearch});

  final Function(String) onSearch;
  @override
  State<GlobalSearchBar> createState() => _GlobalSearchBarState();
}

class _GlobalSearchBarState extends State<GlobalSearchBar>{
  final TextEditingController _textEditingController = TextEditingController();

  void _onChanged(String value){
    widget.onSearch(value);
  }

  @override
  Widget build(BuildContext context){
    return TextField(
      controller: _textEditingController,
      onChanged: _onChanged,
      decoration:  InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        hintText: 'Search Product',
        prefixIcon: const Icon(Icons.search,),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
      ),
    );
  }
}

//Class for Search Icon to use globally
class SearchIcon extends StatelessWidget{
  final VoidCallback onTap;
  const SearchIcon({super.key, required this.onTap});

  @override
  Widget build(BuildContext context){
    return IconButton(onPressed: onTap, icon: const Icon(Icons.search), tooltip: 'Search', color: Colors.black,);
  }
}

class FavoriteIcon extends StatelessWidget{
  final bool isFavorite;
  final VoidCallback onToggle;

  const FavoriteIcon({super.key, required this.isFavorite, required this.onToggle});

  @override
  Widget build(BuildContext context){
    return IconButton(onPressed: onToggle, icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border), color: isFavorite ? Colors.red : Colors.black, tooltip: isFavorite ? 'Remove from favorites' : 'Add to favorites',);
  }
}

class NotificationIcon extends StatelessWidget {
  final int notificationCount;
  final VoidCallback onTap;

  const NotificationIcon({
    super.key,
    required this.notificationCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          color: Colors.black,
          onPressed: onTap,
          tooltip: 'Notifications',
        ),
        if (notificationCount > 0)
          Positioned(
            right: 4,
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
              child: Center(
                child: Text(
                  notificationCount > 99 ? '99+' : '$notificationCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

