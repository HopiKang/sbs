let profile = {
    userName:'아이유',
    'burth-day':'2020', // (오류)
    'love me':true,
    worstCourse:undefined,
    subjectTitle:{
      title:'자바스크립트 객체',
      language:'JavaScript'
    }
}
console.log(profile.userName);
// 1. 점표기법
console.log(profile['love me']);
// 띄어쓰기를 쓴경우 두개로 인식되기때문에 ''로 묶어준다
console.log(profile['love' + 'me']);
// 2. 대괄호 표기법

/*
let name = 'Iu';
객체는 {}를 통해 만들어준다
,로 구분한다
값이름(key):값(value)으로 지정할수있다
값이름에 ''로 묶어줘야 하지만 jsp에서 자동으로 묶어서 설정한다
''로 묶는이유는 문자열로 저장되기때문
객체안에 객체를 넣을 수 있다
유의점
1. 첫 번째 글자는 반드시 문자, 언더바(_), 달러($)기호중 하나로 시작해야한다
2. 띄어쓰기 금지
3. 하이픈(-)금지
{
  userName:'아이유',
  'burth-day':'2020', (오류)
  loveme:true,
  worstCourse:null
  subhectTutle:{
    title:'자바스크립트 객체'
    language:'JavaScript'
  }
}
*/

let propertyName = 'userName';
console.log(profile[propertyName]);
console.log(profile.subjectTitle.title);
//객체안에 객체

console.log(profile.userName);
profile.userName = '제니'
console.log(profile.userName);
//객체를 바꿀수있다

console.log(profile.gender);
//gender라는 키를 추가
profile.gender = '여성'
//gender에 여성을 추가
console.log(profile.gender);

console.log(profile.worstCourse)
delete profile.worstCourse;
// worstCourse를 삭제
console.log(profile.worstCourse)
//undefined상태가됨

console.log(profile.userName !== undefined);
console.log('userName' in profile);
// profile안에 userName이라는 객체가 있느냐, boolen형으로 리턴해줌
console.log('worstCourse' in profile)
// if문으로 활용하기 좋다

if('userName' in profile){
    console.log(`userName 값은 ${profile.userName}`)
}else{
    console.log('userName 프로퍼티는 존재하지 않습니다')
}
