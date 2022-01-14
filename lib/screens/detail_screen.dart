import 'package:dictionary_app/model/word_response.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget
{
  final WordResponse wordResponse;
   DetailScreen(this.wordResponse);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        child: Column(
          children:
          [
            Text(
              wordResponse.word,
              style:Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index)
                {
                  final meaning = wordResponse.meanings[index];
                  final definitions = meaning.definitions;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meaning.partOfSpeech,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(height: 8,),
                      ListView.separated(
                        itemBuilder: (context, index) => Column(
                          children: [
                            Text(
                              "Definitions : " + definitions[index].definition,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4,),
                            Text(
                              "Sentence  : ${definitions[index].example}",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        separatorBuilder: (context, index) => const SizedBox(height: 8,),
                        itemCount: definitions.length,
                        shrinkWrap: true,
                      )
                    ],
                  );
                },
                itemCount: wordResponse.meanings.length,
                separatorBuilder: (context, index) => const SizedBox(height: 32,),
              ),
            )
          ],
        ),
      ),
    );
  }
}