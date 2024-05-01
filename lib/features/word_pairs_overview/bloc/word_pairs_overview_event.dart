import 'package:equatable/equatable.dart';

sealed class WordPairsOverviewEvent extends Equatable {
  const WordPairsOverviewEvent();

  @override
  List<Object> get props => [];
}

// TODO: naming conventions?
// https://bloclibrary.dev/naming-conventions/

final class CreateInitialWordPairs extends WordPairsOverviewEvent {
  const CreateInitialWordPairs();
}

final class AddWordPair extends WordPairsOverviewEvent {
  const AddWordPair();
}
