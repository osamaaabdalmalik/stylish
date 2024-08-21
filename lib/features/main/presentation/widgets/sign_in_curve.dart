import 'package:flutter/material.dart';
import 'package:stylish/core/constants/app_colors.dart';

class SignInCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = AppColors.transparent;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(402.861, 60.9327);
    path_1.cubicTo(232.739, 18.4911, 315.924, 150.229, 211.663, 94.4465);
    path_1.cubicTo(138.989, 55.5638, 77.175, 129.157, 46.3912, 177.317);
    path_1.cubicTo(36.3173, 193.077, 12.1982, 194.499, 1.79882, 178.952);
    path_1.lineTo(-67.732, 75.0023);
    path_1.cubicTo(-75.1014, 63.9849, -72.1441, 49.0795, -61.1267, 41.7101);
    path_1.lineTo(215.89, -143.583);
    path_1.cubicTo(224.347, -149.24, 235.359, -149.013, 243.441, -142.83);
    path_1.cubicTo(305.197, -95.5818, 552.488, 98.2611, 402.861, 60.9327);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = AppColors.materialPrimary.shade500.withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(363.361, 42.925);
    path_2.cubicTo(222.893, 8.11109, 291.447, 116.698, 205.395, 70.7998);
    path_2.cubicTo(148.43, 40.416, 99.4359, 93.7155, 72.823, 133.219);
    path_2.cubicTo(62.3804, 135.719, 10, 230.13, 0, 134.595);
    path_2.lineTo(-23.012, 58.5944);
    path_2.cubicTo(-30.3814, 47.5771, -27.4241, 32.6716, -16.4067, 25.3023);
    path_2.lineTo(206.737, -123.956);
    path_2.cubicTo(215.187, -129.608, 226.171, -129.4, 234.243, -123.218);
    path_2.cubicTo(288.746, -81.4796, 485.109, 73.0991, 363.361, 42.925);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    final gradient = LinearGradient(
      colors: [
        AppColors.materialPrimary.shade100.withOpacity(0.9),
        AppColors.materialPrimary.shade200.withOpacity(0.9),
        AppColors.materialPrimary.shade300.withOpacity(0.8),
        AppColors.materialPrimary.shade300.withOpacity(0.4),
        AppColors.materialPrimary.shade300.withOpacity(0.2),
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    );
    paint2Fill.shader = gradient.createShader(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
