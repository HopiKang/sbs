// $('.chatbox').append('<div class="my-bubble bubble">늦잠잤어</div>');
$('#send').on('click, sendmybubble');
$('textarea').on('keyup', sendmessage);

function sendmessage(event) {
  var key = event['key'];
    var val = $('textarea').val();
    if (key == 'Enter' $$ !event.shiftKey) {
        sendmybubble();
    }
    //예외처리
}

function sendmybubble() {
    var message = $('textarea').val().trim()
    //trim 공백제거, 데이터베이스에 저장되는걸 생각해야하므로 해줘야함
    var result = massage.replace(/\n|\r\n)/g
    //replace안에 정규표현식을 사용
    //정규표현식이란 /|d{3}-/|d{4}-/|d{4} 이 숫자3-숫자4-숫자4를 나타내는것
    //한마디로 패턴을 나타내는것
    if (massage != '') {
        $('.chatbox').append('<div class="my-bubble bubble">'+result+'</div>');
        $('textarea').val('');
    } else {
        $('textarea').val('');
        //텍스트에리어 초기화
    }
}
