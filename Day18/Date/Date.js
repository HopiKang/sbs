let myDate = new Date(1000);
// UTC 1970년 1월 1일 00:00
// 괄호안은 UTC + 1000밀리초
console.log(myDate);

let myDate1 = new Date('2022-09-01');
console.log(myDate1);
// 일자

let myDate2 = new Date('2022-09-01T00:01:00');
console.log(myDate2);
// 일자 + 시간

let myDate3 = new Date(2022,8,1);
console.log(myDate3);
// new Date(YYYY, MM, DD, HH, MM, SS, MS)

let myDate4 = new Date(2022,8,1)
let today = new Date();
let timeDiff = myDate4.getTime() - today.getTime();
console.log(timeDiff + '밀리초');
console.log(timeDiff + '초');
console.log(timeDiff / 1000 / 60 + '분');
console.log(timeDiff / 1000 / 60 / + '시간')
console.log(timeDiff / 1000 / 60 / 24 + '날짜')
// getTime
// 얼마나 지났는지 정수값(타임스테프)을 리턴한다 

let myDate5 = new Date(2022,8,1,19,11,16);
console.log(myDate5.getFullYear())
console.log(myDate5.getMonth());
console.log(myDate5.getDate());
console.log(myDate5.getDay());

//Day는 요일을 나타낸다, 일요일부터 0 월 1 화 2 수 3 목 4 금 5 토 6
//대괄호로 감싸진 요소들은 선택적인 요소이다
//setFullYear(year, [month], [date])
//setMonth(month, [date])
//setDate(date)
//setHour(hour, [min], [sec], [ms])
//setMinutes(min, [sec], [ms])
//setSeconds(sec, [ms])
//setMillㅑseconds(me)
//settime(milliseconds) 1970년 1월 1일 00:00:000 이후를 나타내는 날짜를 설정

let myDate6 = new Date();
console.log(myDate6.toLocaleDateString());
//년월일
console.log(myDate6.toLocaleTimeString());
// 오후 오전 시간 분 초
console.log(myDate6.toLocaleString());
//년월일 오후 오전 시간 분 초

let myDate7 = new Date(2022,0,32)
console.log(myDate7)
//2월 1일로 나옴, 32일이라서 자동으로 바꿔줌

let myDate8 = new Date();
console.log(Date.now() === myDate.getTime());

let myDate9 = new Date();
console.log(typeof myDate9);
console.log(String(myDate9));
console.log(Number(myDate9));
// getTime()을 활용한값과 같게나온다
console.log(myDate9.getTime() === Number(myDate9))
console.log(Boolean(myDate9));

let date1 = new Date('12/15/199 05:25:30');
let date2 = new Date('December 15, 199 05:25:30');
let date3 = new Date('Dec 15 1999 05:25:30');
console.log(date1);
console.log(date2);
console.log(date3);
//https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Date