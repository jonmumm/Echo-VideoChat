window.Echo = {} unless window.Echo
Echo.VideoChat = {} unless Echo.VideoChat

class Echo.VideoChat
  constructor: (@config, @libPath) ->
    # TODO Check for required parameters
    # TODO Extend config with some default options

    iframe = $("<iframe />", 
      id: "videoEmbed"
      src: "http://api.opentok.com/hl/embed/#{@config.embed_id}"
      style: "border:none"
      frameborder: "0"
    )

    $(@config.target).replaceWith iframe
    iframe.attr("height", @config.height)
    iframe.attr("width", @config.width)

    ###
    initSubmitClient = ->
      console.log Echo.Submit

    initStreamClient = ->
      console.log Echo.Stream

    if not Echo.Submit
      $.ajax
        url: "http://cdn.echoenabled.com/clientapps/v2/submit.js"
        dataType: "script"
        cache: true
        success: initSubmitClient
    else
      initSubmitClient()

    if not Echo.Stream
      $.ajax
        url: "http://cdn.echoenabled.com/clientapps/v2/stream.js"
        dataType: "script"
        cache: true
        success: initStreamClient
    else
      initStreamClient()
    ###
