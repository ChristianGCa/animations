import 'package:flutter/material.dart';

import 'list_data.dart';

class AnimatedListView extends StatelessWidget {

  final Animation<EdgeInsets> listSlidePosition;

  const AnimatedListView({super.key, required this.listSlidePosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ListData(
          title: 'Estudar Flutter',
          subtitle: 'Com o curso novo',
          image: AssetImage('images/profile.png'),
          margin: listSlidePosition.value * 3,
        ),
        ListData(
          title: 'Estudar Java',
          subtitle: 'Com o curso de Java',
          image: AssetImage('images/profile.png'),
          margin: listSlidePosition.value * 2,
        ),
        ListData(
          title: 'Aula de Matemática',
          subtitle: 'Professor João',
          image: AssetImage('images/profile.png'),
          margin: listSlidePosition.value * 1,
        ),
        ListData(
          title: 'Aula de Física',
          subtitle: 'Professora Júlia',
          image: AssetImage('images/profile.png'),
          margin: listSlidePosition.value * 0,
        ),
      ],
    );
  }
}
