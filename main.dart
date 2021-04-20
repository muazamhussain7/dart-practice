import 'dart:io';
import 'dart:math';

void main() async {
  List<String> fileLines = [];
  List<List<String>> maximumFrequencyWordsAcrossLines = [];
  int lineNumber = 1;
  int maximumfrequency = 0;
  // 

  // reading from file per line
  fileLines = await File('file.txt').readAsLines();

  for (int i = 0; i < fileLines.length; i++) {
    List<String> oneLineWords = fileLines[i].toLowerCase().split(' ');
    Map<String, int> frequencyRecord = {};
    List<String> maximumFrequencyWordsInEachLine = [];

    for (int j = 0; j < oneLineWords.length; j++) {
      if (frequencyRecord.containsKey(oneLineWords[j])) {
        frequencyRecord.update(
          oneLineWords[j],
          (value) => ++value,
        );
      } else {
        frequencyRecord[oneLineWords[j]] = 1;
      }
    }
    // get key of map which has maximum value
    maximumfrequency = frequencyRecord.values.reduce(max);
    frequencyRecord.entries.forEach(
      (element) {
        if (element.value == maximumfrequency) {
          maximumFrequencyWordsInEachLine.add(element.key);
        }
      },
    );

    // add current line most frequent words into global List
    maximumFrequencyWordsAcrossLines.add(maximumFrequencyWordsInEachLine);
  }

  // show required output
  print('The following words have the highest word frequency per line:');
  maximumFrequencyWordsAcrossLines.forEach(
    (list) {
      print('$list (appears in line $lineNumber)');
      lineNumber++;
    },
  );
}
