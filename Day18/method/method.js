let greetings = {
  sayHello: function(name){
    console.log(`Hello ${name}`)
  },
  sayHi:function(){
    console.log('Hi')
  },
  sayBye:function(){
    console.log('Bye')
  }
}
greetings.sayHi();
// 점표기법으로 적어줘야한다
greetings.sayHello('아이유');
// 점표기법
greetings['sayHello']('아이유');
// 대괄호 표기법

let rectAngle = {
  width:30,
  height:50,
  getArea:function(){
    return rectAngle.width * rectAngle.height;
  },
}
//사각형

let triAngle = {
  width:15,
  height:40,
  getArea:function(){
    return triAngle.width * triAngle.height / 2;
  }
}

