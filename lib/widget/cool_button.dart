import 'package:flutter/material.dart';

class CoolButton extends StatelessWidget {
  const CoolButton({super.key, required this.nameButton});

      final String nameButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: GestureDetector(
        onTap: () {
          debugPrint('Clicked');
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.redAccent, // Màu nền nút
            borderRadius: BorderRadius.circular(12), // Bo góc tròn
            border: Border.all(color: Colors.red), // Viền xanh đậm
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(2, 2), // Đổ bóng
              ),
            ],
          ),
          child: Text(
            nameButton ,
            style: TextStyle(
              color: Colors.white, // Chữ trắng
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
