# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ document
  .on 'turbolinks:load', () ->
    if page.controller() == 'exercises' && page.action() == 'feed'
      $.get '/exercises.xml', {}, (resp_xml) ->
        $.get '/post.xslt', {}, (resp_xsl) ->
          displayResult resp_xml, resp_xsl
          rating_up_btn_init()
          init_save_btn()
    else if page.controller() == 'exercises' && page.action() == 'saves'
      $.get '/user_saves.xml', {}, (resp_xml) ->
        $.get '/post.xslt', {}, (resp_xsl) ->
          displayResult resp_xml, resp_xsl
          rating_up_btn_init()
          init_save_btn()