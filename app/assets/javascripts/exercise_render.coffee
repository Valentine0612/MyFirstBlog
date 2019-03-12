@displayResult = (xml, xsl) ->
  if document.implementation && document.implementation.createDocument
    xsltProcessor = new XSLTProcessor
    xsltProcessor.importStylesheet xsl
    resultDocument = xsltProcessor.transformToFragment xml, document
    document.getElementById("posts_container").appendChild resultDocument

@rating_up_btn_init = () ->
  $ '.rating_up'
    .on 'click', () ->
      post_id = $(this).attr('post_id')
      $.post "/exercises/#{post_id}/change_rating", {change: 'up'}, (data) ->
        $ "[post_id='#{post_id}'].rating"
          .text("#{data.rating}")
        update_post_buttons_state(post_id, data.vote)
  $ '.rating_down'
    .on 'click', () ->
      post_id = $(this).attr('post_id')
      $.post "/exercises/#{post_id}/change_rating", {change: 'down'}, (data) ->
        $ "[post_id='#{post_id}'].rating"
          .text("#{data.rating}")
        update_post_buttons_state(post_id, data.vote)

update_post_buttons_state = (post_id, vote) ->
  if vote == 1
    $("[post_id='#{post_id}'].rating_up").attr('disabled', '')
  else
    $("[post_id='#{post_id}'].rating_up").removeAttr('disabled')
  if vote == -1
    $("[post_id='#{post_id}'].rating_down").attr('disabled', '')
  else
    $("[post_id='#{post_id}'].rating_down").removeAttr('disabled')