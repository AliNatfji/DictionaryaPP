import 'package:dictionary_app/model/word_response.dart';

abstract class DictionaryState {}

class NoWordSearchedState extends DictionaryState {}

class WordSearchingState extends DictionaryState {}

class WordSearchedState extends DictionaryState
{
  final List<WordResponse> words;
  WordSearchedState(this.words);
}

class ErrorState extends DictionaryState
{
  final dynamic massage;
  ErrorState(this.massage);
}

class AppChangeModeState extends DictionaryState{}