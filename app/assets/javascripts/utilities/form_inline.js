document.addEventListener('turbolinks:load', function() {
  // var controls = document.querySelectorAll('.form-inline-link');
  // if (controls.length) {
  //   for (var i = 0; i < controls.length; i++) {
  //     controls[i].addEventListener('click', formInlineLinkHandler)
  //   }

  $('.form-inline-link').on('click', formInlineLinkHandler)

  var errors = document.querySelector('.alert')
  if (errors) {
    var resourceID = errors.dataset.resourceID
    formInlineHandler(resourceID)
  }
});

function formInlineLinkHandler(event) {
  event.preventDefault()
  var testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  // var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  // var formInLine = document.querySelector('.form-inline[data-test-id="' + testId + '"]')
  var $testTile = $('.test-title[data-test-id="' + testId + '"]')
  var $formInline = $('.form-inline[data-test-id="' + testId + '"]')

  $formInline.toggle()
  $testTile.toggle()

  // if (formInLine.classList.contains('hide')) {
  if ($formInline.is(':visible')) {
    // testTitle.classList.add('hide')
    // formInLine.classList.remove('hide')
    link.textContent = 'Cancel'
  } else {
    // testTitle.classList.remove('hide')
    // formInLine.classList.add('hide')
    link.textContent = 'Edit'
  }
}
