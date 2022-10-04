
/*
for in 문
for (변수 in 객체){
  동작
}
*/

let codingSchool = {
  name:'코딩학원',
  bornYear:'2022',
  isVeryNice:'true',
  worstCourse:'null',
  bestCourse:'스프링부트 프로그래밍'
}
for(let key in codingSchool){
  console.log(key);
  console.log(codingSchool[key])
}

let myObject = {
  '2':'알고리즘의 정석',
  '3':'파이썬 완전 정복',
  '1':'자바스크립트 부시기'
}
for (let key in myObject){
  console.log(myObject[key]);
}
// 1, 2, 3순으로 나오는 이유는 정렬방식에 있다
//오름차순으로 먼저 정렬하고 추가한 순서대로 정렬한다

let myObject1 = {
  300:'정수',
  1.2:'소수',
}
for (let key in myObject1){
  console.log(`${key}의 자료형은 ${typeof key}입니다`);
}
//객체가 300, 1.2모두 String(문자형)으로 나온다
console.log(myObject1['300']);
console.log(myObject1['1.2']);
// console.log(myObject1.1.2); (오류)

let myObject2 = {
  3:'정수3',
  name:'Hello',
  2:'정수2',
  birthDay:'2022.10.04',
  1:'정수1'
}
for (let key in myObject2){
  console.log(key);
}
// 객체의 정렬방식이 있기때문에 정수를 key로 쓰는걸 추천하지않는다