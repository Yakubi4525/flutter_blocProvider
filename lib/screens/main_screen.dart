import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_bloc_provider/blocs/get_list_persons_blocs.dart';
import 'package:rick_and_morty_bloc_provider/blocs/person_bloc_models.dart';
import 'package:rick_and_morty_bloc_provider/models/person.dart';
import 'package:rick_and_morty_bloc_provider/models/person_response.dart';
import 'package:rick_and_morty_bloc_provider/screens/detail_screen.dart';
import 'package:rick_and_morty_bloc_provider/styles/theme.dart';
import 'package:rick_and_morty_bloc_provider/widget/avatar_widget.dart';
import 'package:rick_and_morty_bloc_provider/widget/green_shape_widget.dart';
import 'package:rick_and_morty_bloc_provider/widget/loading_widget.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            appTittle,
            style: kTittleTextStyle,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async => BlocProvider.of<GetPersonsBloc>(context)
                    .add(RefreshPageEvent()),
                child: BlocBuilder<GetPersonsBloc, PersonStates>(
                    builder: (context, personState) {
                  if (personState is LoadingPersonState) {
                    return buildLoadingWidget();
                  }
                  if (personState is NoInternetPersonState) {
                    return _buildNoInternrtWidget(personState.message);
                  }
                  if (personState is SuccesPersonState) {
                    return _buildListOfPersons(personState.personResponse);
                  }
                  if (personState is FailedPersonState) {
                    return _buildErrorWidget(personState.error);
                  }
                  return Container();
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Text(
        error,
        style: kMainTextStyle,
      ),
    );
  }

  Widget _buildNoInternrtWidget(String message) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: kMainTextStyle,
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<GetPersonsBloc>(context)
                    .add(RefreshPageEvent());
              },
              child: Text(
                'Try again',
                style: TextStyle(color: Colors.orange, fontSize: 18),
              ),
            )
          ],
        ));
  }

  Widget _buildListOfPersons(PersonResponseModel data) {
    List<PersonModel> persons = data.persons;
    if (persons.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "No more persons",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      );
    } else
      return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 20),
          itemCount: persons.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              model: persons[index],
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF323247).withOpacity(0.08),
                        spreadRadius: 0,
                        blurRadius: 32,
                        offset: Offset(0, 24), // changes position of shadow
                      ),
                      BoxShadow(
                        color: Color(0xFF323247).withOpacity(0.08),
                        spreadRadius: 0,
                        blurRadius: 16,
                        offset: Offset(0, 16), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: kGreyPrimaryColor,
                  ),
                  height: 85,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 12, right: 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: [
                            avatarWidget(
                                url: persons[index].image,
                                radius: 30,
                                heroIndex: persons[index].id),
                            SizedBox(
                              width: 14,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 135,
                                  child: Text(
                                    '${persons[index].name}',
                                    overflow: TextOverflow.ellipsis,
                                    style: kTittleTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                greenshapeWidget(
                                    status: persons[index].status,
                                    species: persons[index].species,
                                    textStyle: kGreyTextStyle)
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                '${persons[index].gender}',
                                overflow: TextOverflow.ellipsis,
                                style: kGreyTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
  }
}
