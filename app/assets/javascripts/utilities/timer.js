document.addEventListener('turbolinks:load', function() {
  var timerObject = document.getElementById('timer');

  if (timerObject) { timerInProgress(timerObject) }
});

function timerInProgress(timerObject) {
  var endTime = timerObject.dataset.endTime;
  var timer = endTime - Math.trunc(Date.now() / 1000);

  setInterval(function() {
    timer--;

    if (timer === 0) {
      alert('Time is out!');
      document.location.href += '/result';
    }

    showTimer(timer, timerObject);
  }, 1000);
}

function showTimer(timer, timerObject) {
  var minutes = Math.trunc(timer / 60);
  var seconds = timer % 60;

  if (seconds === 0) {
    minutes -= 1;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    seconds = 59;
  } else {
    seconds -= 1;
    seconds = seconds < 10 ? '0' + seconds : seconds;
  }

  timerObject.textContent = minutes + ':' + seconds;
}

