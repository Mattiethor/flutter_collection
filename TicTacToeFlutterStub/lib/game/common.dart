enum MarkTypes {
  e,
  x,
  o
}

int countMarker(List<MarkTypes> listMarks, MarkTypes currentMark){
  int count = 0;
  for(MarkTypes mark in listMarks){
    if(mark == currentMark){
      count++;
    }
  }
  return count;
}

List<List<MarkTypes>> initBoard() {
  return [
    [MarkTypes.e, MarkTypes.e, MarkTypes.e],
    [MarkTypes.e, MarkTypes.e, MarkTypes.e],
    [MarkTypes.e, MarkTypes.e, MarkTypes.e]
  ];
}

String markToText(MarkTypes mark){
  if(mark == MarkTypes.e){
    return ' ';
  } else if(mark == MarkTypes.x){
    return 'x';
  } else if(mark == MarkTypes.o){
    return 'o';
  }
}

String rowToText(List<MarkTypes> marks){
  List<String> decoded = [];
  for(MarkTypes mark in marks){
    decoded.add(markToText(mark));
  }
  return '| ' + decoded.join(' | ') + ' |';
}
