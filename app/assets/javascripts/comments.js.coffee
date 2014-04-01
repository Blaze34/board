# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  # Create a comment
  $('.comment-list').find('.new_comment')
  .on 'ajax:beforeSend', (e, xhr, settings) ->
      $(this).find('textarea').addClass('uneditable-input').attr('disabled', 'disabled')
  .on 'ajax:success', (e, response, status, xhr) ->
      $this = $(this)
      console.log(e, response, status, xhr, $this);
      $this.find('textarea')
      .removeClass('uneditable-input')
      .removeAttr('disabled', 'disabled')
      .val('');
      $(response).hide().insertBefore($this).show('slow')

  $(document)
  .on 'ajax:beforeSend', '.comment', ->
      $(this).fadeTo('fast', 0.5)
  .on 'ajax:success', '.comment', ->
      $(this).hide('fast')
  .on 'ajax:error', '.comment', ->
      $(this).fadeTo('fast', 1)