import 'package:bloc_08_00/bloc/cats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsScreen extends StatelessWidget {
  const CatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocBuilder<CatsBloc, CatsState>(
            builder: (context, state) {
              if (state is CatsSucces) {
                return Image.network(state.image ?? '');
              }
              if (state is CatsError) {
                return Image.network(
                    'https://www.prestashop.com/sites/default/files/wysiwyg/404_not_found.png');
              }
              return Image.network(
                  'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_2x1.jpg');
            },
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<CatsBloc>(context).add(PressButtonEvent());
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
