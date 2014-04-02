# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  # Create a comment
  $list = $('.comment-list')
  $form = $list.find('.new_comment')
  .on 'ajax:beforeSend', (e, xhr, settings) ->
    e.stopPropagation()
    $(this).find('textarea').addClass('uneditable-input').attr('disabled', 'disabled')
  .on 'ajax:success', (e, response, status, xhr) ->
    e.stopPropagation()
    $this = $(this)
    $this.find('textarea')
    .removeClass('uneditable-input')
    .removeAttr('disabled', 'disabled')
    .val('');
    $(response).hide().appendTo($this.prev()).show('slow')

  $(document)
  .on 'ajax:beforeSend', '.comment', ->
    $(this).fadeTo('fast', 0.5)
  .on 'ajax:success', '.comment', ->
    $(this).hide('fast')
  .on 'ajax:error', '.comment', ->
    $(this).fadeTo('fast', 1)

  $list.on 'click', '.comment_for', (e) ->
    e.preventDefault()
    $this = $(this)

    false unless $form.length

    $form.next(':hidden').show()
    $this.hide().before($form)

    $form.find('input[name*=parent_id]').val($this.data('id') || '')