document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.timer');

  if (control) { control.addEventListener('click', timerInProgress) }
  // if (timer) {setTimeout(timerProcess(5,30), { alert('Вы приступили к тесту! Время теста ограничено!') }, 1000)};
});

function timerInProgress() {
  var minutesObject = document.getElementById('minutes');
  var secondsObject = document.getElementById('seconds');

  //
  minutes = minutesObject.textContent;
  seconds = secondsObject.textContent;

  if (minutes === '0' && seconds === '0') {
    alert = 'Time is out!'
  } else {
    if (seconds === '0') {
      minutes -= 1;
      seconds = 59
    } else {
      seconds -= 1
    }
  }
  //

  secondsObject.textContent = seconds
  minutesObject.textContent = minutes
}