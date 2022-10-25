const firstWords = function (word) {
  let word = '';
  for (const arg of arguments) {
    word += arg[0];
  }
  console.log(word);
};

firstWords('대통령과', '심야', '술자리');
