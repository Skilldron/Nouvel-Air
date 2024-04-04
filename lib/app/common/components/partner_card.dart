import 'package:flutter/material.dart';

enum HeigthSize { small, medium }

class PartnerCard extends StatelessWidget {
  final HeigthSize heightSize;
  final String title;
  final String imageURI;

  const PartnerCard(
      {super.key,
      required this.heightSize,
      required this.title,
      required this.imageURI});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('tapped'), // TODO: rediriger vers la bonne page
      child: Container(
        width: double.infinity,
        height: heightSize == HeigthSize.small ? 64 : 95,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: NetworkImage(imageURI),
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: const [
            BoxShadow(
              color: Color(0x1900537D),
              blurRadius: 12,
              offset: Offset(0, 12),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 8, left: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    color: Color(0xFF0D4535),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
