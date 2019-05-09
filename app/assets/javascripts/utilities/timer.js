document.addEventListener('turbolinks:load', timerInProgress);

function timerInProgress() {
  var timerObject = document.getElementById('timer');

  if (timerObject) {
    setInterval(function() {
      var timer = timerObject.dataset.testTimer;
      timerObject.textContent = timer;

      if (timer === '00:00') {
        alert('Time is out!');
        document.location.href += '/result';
      } else {
        timeRuns(timer, timerObject);
      }

    }, 1000);
  }
}

function timeRuns(timer, timerObject) {
  var arr = timer.split(':');
  var minutes = arr[0];
  var seconds = arr[1];

  if (seconds === '00') {
    minutes -= 1;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    seconds = 59;
  } else {
    seconds -= 1;
    seconds = seconds < 10 ? '0' + seconds : seconds;
  }

  timerObject.dataset.testTimer = minutes + ':' + seconds;
}

