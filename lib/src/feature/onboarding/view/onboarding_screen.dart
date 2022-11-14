import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genware/src/feature/onboarding/widgets/onboarding_layout.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: OnboardingLayout(
        nextButtonTitle: 'iniciar sesión',
        items: [
          CustomOnBoardItem(
            imagePath: 'assets/neuralwel.png',
            title: 'COMENZÁ A VIVIR TU',
            content: 'NT EXPERIENCE',
          ),
          CustomOnBoardItem(
            imagePath: 'assets/conecta_con_cel.png',
            title: 'CONECTA',
            content:
                'Conecta tus neuro sensores a la aplicación  Neural Trainer y comienza a aumentar tu rendimiento cognitivo.',
          ),
          CustomOnBoardItem(
            imagePath: 'assets/entrena_con_cel.png',
            title: 'ENTRENA',
            content:
                'Selecciona una actividad creada por el equipo de Neural Trainer o crea tu propio entrenamiento específico.',
          ),
          CustomOnBoardItem(
            imagePath: 'assets/analiza_con_cel.png',
            title: 'ANALIZA',
            content:
                'Monitorea el desempeño de tus atletas, registra sus resultados y compártelos en tiempo real.',
          ),
        ],
      ),
    );
  }
}
