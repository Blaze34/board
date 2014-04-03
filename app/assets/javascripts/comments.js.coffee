# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  # Create a comment
  $list = $('.comment-list')
  $form = $list.find('.new_comment')
  .on 'ajax:beforeSend', (e, xhr, settings) ->
    $(this).find('textarea').addClass('uneditable-input').attr('disabled', 'disabled')
  .on 'ajax:success', (e, response, status, xhr) ->
    $this = $(this)
    $this.find('textarea')
    .removeClass('uneditable-input')
    .removeAttr('disabled', 'disabled')
    .val('');
    $(response).hide().appendTo($this.prev()).show('slow')

  $(document)
  .on 'ajax:beforeSend', '.close', ->
    $(this).closest('.comment').fadeTo('fast', 0.5)
  .on 'ajax:success', '.close', ->
    $(this).closest('.comment').hide('fast')
  .on 'ajax:error', '.close', ->
    $(this).closest('.comment').fadeTo('fast', 1)

  $list.on 'click', '.comment_for', (e) ->
    e.preventDefault()
    $this = $(this)

    false unless $form.length

    $form.next(':hidden').show()
    $this.hide().before($form)

    $form.find('input[name*=parent_id]').val($this.data('id') || '')