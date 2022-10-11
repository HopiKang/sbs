const myTags = document.getElementsByClassName('color-bnt');
console.log(myTags);
console.log(myTags[1]);
console.log(myTags.length);

for (let tag of myTags) {
  console.log(tag);
}

const mtTags = document.getElementsByClassName('red');
console.log(mtTags);
console.log(mtTags[0]);

//
const btns = document.getElementsByTagName('button');
const allTag = document.getElementsByTagName('*');
// *는 모든태그를 선택한다는것이다
// 하지만 명확한 이유없이 모든태그를 한번에 불러오면 안된다 (부하가 생기고 실수가 생기기때문)

// document.querySelector('CSS')
const myTag = document.querySelector('myNumber');
console.log(myTags);

const myTag2 = document.getElementById('myNumber');
console.log(myTag2);

// 맨위만이 아니라 전체가 출력이된다
const myTag3 = document.querySelectorAll('.color-btn');
console.log(myTag3);

/*
document.getElementById('id)
id에 해당하는 태그 하나
document.getElementByClassName('class)
class에 해당하는 태그 모음(HTML Collector)
document.getElementByTagName('tag')
tag에 해당하는 태크 모음(HTML Collector)
document.querySelector('css')
css선택자에 해당하는 태그중 가장 첫번째 태그하나
document.querySelectorALL('css')
css선택자에 해당하는 태그 모음(NodeList)


*/
