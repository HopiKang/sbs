$('#text-input').on('input', checkInput)

function Timeget(){
    var day = $('#text-input').val();

    let mateDay = new Date(day)
    let today = new Date();
    let timeDiff = mateDay.getTime() - today.getTime()
    let dayDiff = timeDiff / 1000 / 60 / 60 / 24;
    console.log(dayDiff)
}

Timeget();