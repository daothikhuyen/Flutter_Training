import 'package:flutter/material.dart';
import 'package:flutter_practice/models/destination.dart';
import 'package:flutter_practice/flow/res/custom_color.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key, this.selectedIndex, required this.onTapped});

  // ignore: prefer_typing_uninitialized_variables
  final selectedIndex;
  final Function(int selectedIndex) onTapped;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  int _selectedItem = 0;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFfafafa),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            color: CustomColors.blue_gray,
            width: double.infinity,
            height: 150,
            child: Center(
              child: Text(
                'Flow',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Container(height: 2, width: double.maxFinite, color: Colors.white24),
          ...destinations.asMap().entries.map((d) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedItem = d.key;
                      widget.onTapped(_selectedItem);
                    });
                  },
                  child: Item(
                    d.key,
                    d.value.label,
                    _selectedItem,
                    d.value.icon,
                  ),
                ),
                Container(
                  height: 2,
                  width: double.maxFinite,
                  color: Colors.white24,
                ),
              ],
            );
          }),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20.0, bottom: 20.0),
            child: Row(
              children: [
                Icon(
                  Icons.notifications,
                  size: 24,
                  color: CustomColors.neon_green,
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.8,
                      child: Container(
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 2, width: double.maxFinite, color: Colors.white24),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20.0, bottom: 20.0),
            child: Row(
              children: [
                Icon(Icons.settings, size: 24, color: CustomColors.neon_green),
                SizedBox(width: 16.0),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.8,
                      child: Container(
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Item extends StatefulWidget {
  final int id;
  final String title;
  final int selected;
  final IconData icon;

  const Item(this.id, this.title, this.selected, this.icon, {super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            widget.selected == widget.id
                ? Border.all(width: 2.0, color: CustomColors.blue_gray)
                : null,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 20.0, bottom: 20.0),
        child: Row(
          children: [
            Icon(widget.icon, size: 24, color: CustomColors.neon_green),
            SizedBox(width: 16.0),
            Text(
              widget.title,
              style: TextStyle(color: CustomColors.neon_green),
            ),
          ],
        ),
      ),
    );
  }
}
