@init_save_btn = () ->
  $ '.post_save'
  .on 'click', () ->
    btn = $(this)
    $.get '/save_exercise.json', { post_id: btn.attr('post_id') }, (response) ->
      if response.state == 'saved'
        btn.removeClass('btn-primary').addClass('btn-success').text('Saved')
      else
        btn.removeClass('btn-success').addClass('btn-primary').text('Save')

class Page
  controller: () =>
    $('meta[name=psj]').attr('controller')
  action: () =>
    $('meta[name=psj]').attr('action')

@page = new Page