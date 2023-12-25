import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/categoriesViewModel/category-details-cubit/category_details_cubit.dart';
import 'package:news_app/categoriesViewModel/category-details-cubit/category_details_state.dart';
import 'package:news_app/home/category/tab_container.dart';
import 'package:news_app/model/category.dart';

// ignore: must_be_immutable
class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails(this.category);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = CategoryDetailsViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.loadSources(widget.category.id);
  }

  String? keyWord;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case SuccessState():
            {
              var sourcesList = state.sourcesList;
              return TabContainer(sourcesList!);
            }
          case LoadingState():
            {
              return Center(
                  child: Column(
                children: [
                  Text(state.message),
                  CircularProgressIndicator(),
                ],
              ));
            }
          case ErrorState():
            {
              return Column(
                children: [
                  Text(state.errorMessage),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.loadSources(widget.category.id);
                      },
                      child: Text('Try Again'))
                ],
              );
            }
        }
      },
    );
  }
}
