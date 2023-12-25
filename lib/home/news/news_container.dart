import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/news/news-cubit/news_cubit.dart';
import 'package:news_app/home/news/news-cubit/news_state.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/home/news/news_item.dart';

// ignore: must_be_immutable
class NewsContainer extends StatefulWidget {
  Sources selectedSource;
  NewsContainer(this.selectedSource);

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  var viewModel = NewsViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.loadNews(widget.selectedSource.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel, NewsListState>(
        bloc: viewModel,
        builder: (context, state) {
          switch (state) {
            case SuccessState():
              {
                var newsList = state.newsList;
                return ListView.builder(
                  itemBuilder: (_, index) {
                    return NewsWidget(newsList![index]);
                  },
                  itemCount: state.newsList?.length ?? 0,
                );
              }
            case ErrorState():
              {
                return Column(
                  children: [
                    Text(state.message),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.loadNews(widget.selectedSource.id);
                        },
                        child: const Text('try again'))
                  ],
                );
              }
            case LoadingState():
              {
                return const Center(child: CircularProgressIndicator());
              }
          }
        });
  }
}
