import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_bloc_provider/cubits/navigator_cubt.dart';
import 'package:rick_and_morty_bloc_provider/models/person.dart';
import 'package:rick_and_morty_bloc_provider/styles/theme.dart';
import 'package:rick_and_morty_bloc_provider/widget/avatar_widget.dart';
import 'package:rick_and_morty_bloc_provider/widget/green_shape_widget.dart';
import 'package:rick_and_morty_bloc_provider/widget/grey_line_widget.dart';

class DetailScreen extends StatefulWidget {
  final PersonModel model;

  const DetailScreen({Key key, this.model}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState(model: model);
}

class _DetailScreenState extends State<DetailScreen> {
  final PersonModel model;

  _DetailScreenState({this.model});
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: IconButton(
            iconSize: 18,
            icon: Icon(
              Icons.arrow_back_ios,
              color: kIconGreyColor,
            ),
            onPressed: () {
              BlocProvider.of<NavigatorCubit>(context).backToMainScreen();
            },
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          model.name,
          style: kTittleTextStyle,
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          BlocProvider.of<NavigatorCubit>(context).backToMainScreen();
          return null;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 36,
              vertical: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    avatarWidget(
                        url: model.image,
                        radius: _size.width * 0.25,
                        heroIndex: model.id),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        greenshapeWidget(
                            status: model.status,
                            species: model.species,
                            textStyle: kMainTextStyle),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: _size.height * 0.04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customTextContainer(originalLocationText, model.originName),
                    greyLineWidget(),
                    customTextContainer(genderText, model.gender),
                    greyLineWidget(),
                    customTextContainer(locationText, model.location),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextContainer(String firstText, String secondText) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            firstText,
            style: kGreyTextStyle,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            secondText,
            style: kTittleTextStyle,
          ),
        ],
      )),
    );
  }
}
