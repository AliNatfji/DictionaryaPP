import 'package:dictionary_app/bloc/states.dart';
import 'package:dictionary_app/repo/word_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  static DictionaryCubit get(context) => BlocProvider.of(context);

  final WordRepository _repository;

  DictionaryCubit(this._repository) : super(NoWordSearchedState());

  final queryController = TextEditingController();

  Future getWordSearched() async {
    emit(NoWordSearchedState());
    try {
      final words =
          await _repository.getWordsFromDictionary(queryController.text);
      if (words == null) {
        //emit(WordSearchingState());
        print('EEEEEEEEEEEEErroor');
        emit(ErrorState("There is some issue"));
      } else {
        print(words.toString());
        //emit(WordSearchingState());
        print('eeeeeeeeeelsssssss');
        emit(WordSearchedState(words));
        emit(NoWordSearchedState());
      }
    } on Exception catch (e) {
      print('$e eeeeeeeeeeeeexcepppption');
      //emit(WordSearchingState());
      emit(ErrorState(e.toString()));
    }
  }

  bool isDark = false;

  void changeAppMode() {
    isDark = !isDark;
    emit(AppChangeModeState());
    emit(NoWordSearchedState());
  }
}
