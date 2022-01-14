import 'package:dictionary_app/model/word_response.dart';
import 'package:flutter/material.dart';
import 'detail_screen.dart';

class ListScreen extends StatelessWidget
{
  final List<WordResponse> words;
  ListScreen(this.words);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(
            "${index + 1}. ${words[index].word}",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 20,
            ),
          ),
          onTap: ()
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(words[index]),
              ),
            );
          },
        ),
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
        ),
        itemCount: words.length,
      ),
    );
  }
}