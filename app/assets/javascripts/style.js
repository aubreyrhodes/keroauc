window.setStyles = function(){
  var radioSpans = '<span class="radio-unchecked"></span><span class="radio-checked">';
  $('input[type=radio]').parents('label')
    .addClass('radio')
    .prepend(radioSpans)
    .on('click', function(e){
      e.preventDefault();
      $(this).siblings('.radio').removeClass('checked').children('input[type=radio]').removeAttr('checked');
      $(this).addClass('checked');
      $('input[type=radio]', this).attr('checked', 'checked');
    });
  $('input[type=radio]:checked').parents('label').addClass('checked');
  $('input[type=radio]').hide();
};
