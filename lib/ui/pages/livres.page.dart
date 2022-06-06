// ignore_for_file: unused_import

import 'package:bpi_examen/bloc/livres/livres_bloc.dart';
import 'package:bpi_examen/ui/widgets/drawer.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LivresPage extends StatelessWidget {
  // init

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // navigation drawer
        drawer: AppDrawer(),
        appBar: AppBar(
          title: const Text('Livres'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Rechercher un livre',
                ),
                onChanged: (value) {
                  BlocProvider.of<LivresBloc>(context).add(
                    FindLivres(keyword: value),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<LivresBloc, LivresState>(
                builder: (context, state) {
                  if (state is LivresLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is LivresLoaded) {
                    return ListView.builder(
                      itemCount: state.livres.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(state.livres[index].id_livre.toString()),
                          onDismissed: (direction) {
                            BlocProvider.of<LivresBloc>(context).add(
                              DeleteLivre(id_livre: state.livres[index].id_livre),
                            );
                          },
                          child: Card(
                            elevation: 5.0,
                            child: ListTile(
                              title: Text(state.livres[index].titre),
                              subtitle: Text(state.livres[index].auteur),
                              trailing: Text("${state.livres[index].prix}\$"),
                            ),
                          ),
                        );
                        // return ListTile(
                        //   title: Text(state.livres[index].titre),
                        //   subtitle: Text(state.livres[index].auteur),
                        //   trailing: Text(state.livres[index].prix.toString()),
                        
                        //   // delete
                        // );
                      },
                    );
                  }
                  if (state is LivresNotLoaded) {
                    return Text(state.error);
                  }
                  // fire FetchLivres event
                  BlocProvider.of<LivresBloc>(context).add(FetchLivres());
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              ),
            ),
          ],
        )
      );
  }
}
