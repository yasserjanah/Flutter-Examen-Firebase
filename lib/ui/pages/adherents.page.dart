
import 'package:bpi_examen/bloc/adherents/adherents_bloc.dart';
import 'package:bpi_examen/bloc/livres/livres_bloc.dart';
import 'package:bpi_examen/ui/widgets/drawer.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdherentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // navigation drawer
        drawer: AppDrawer(),
        appBar: AppBar(
          title: const Text('Adhérents'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<AdherentsBloc, AdherentsState>(
                builder: (context, state) {
                  if (state is AdherentsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is AdherentsLoaded) {
                    return ListView.builder(
                      itemCount: state.adherents.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(state.adherents[index].id_adherent.toString()),
                          onDismissed: (direction) {
                            BlocProvider.of<AdherentsBloc>(context).add(
                              DeleteAdherent(id_adherent: state.adherents[index].id_adherent),
                            );
                          },
                          child: Card(
                            elevation: 5.0,
                            child: ListTile(
                              title: Text("${state.adherents[index].nom} ${state.adherents[index].prenom}"),
                              subtitle: Text(state.adherents[index].email),
                              trailing: Text(state.adherents[index].tel),
                            ),
                          ),
                        );
                        // return ListTile(
                        //   title: Text(state.adherents[index].bnom),
                        //   subtitle: Text(state.adherents[index].prenom),
                        //   trailing: Text(state.adherents[index].tel),
                        
                        //   // delete
                        // );
                      },
                    );
                  }
                  if (state is AdherentsNotLoaded) {
                    return Text(state.error);
                  }
                  // fire FetchAdhrenets event
                  BlocProvider.of<AdherentsBloc>(context).add(FetchAdherents());
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