$('#email-input').on('input', checkInput);
$('#password-input').on('input'. checkInput)

function checkInput(){
    // console.log('hello');
    var email = $('#email-input').val();
    var password = $('#password-input').val();

    if (email === '' || password === ''){
        $('.submit-btn').css('background-color', '#9b9b9b');
    }else{
        $('.submit-btn').css('background-color', '#1bbc9b');
    }
}