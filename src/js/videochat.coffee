window.Echo = {} unless window.Echo
Echo.VideoChat = {} unless Echo.VideoChat

class Echo.VideoChat
  constructor: (@config) ->
    # Check for required vars
    return unless @config && @config.target && @config.embed_id

    # Set up defaults
    @config.width or= 350
    @config.height or= 265

    iframe = $("<iframe />", 
      id: "videoEmbed"
      src: "http://api.opentok.com/hl/embed/#{@config.embed_id}"
      style: "border:none"
      frameborder: "0"
    )

    $(@config.target).replaceWith iframe
    iframe.attr("height", @config.height)
    iframe.attr("width", @config.width)

    initSubmitClient = =>
      console.log @config
      new Echo.Submit @config.submitOptions

    initStreamClient = =>
      console.log @config
      new Echo.Stream @config.streamOptions

    if @config.submitOptions
      @config.submitOptions.appkey or= @config.appkey
      if not Echo.Submit
        $.ajax
          url: "http://cdn.echoenabled.com/clientapps/v2/submit.js"
          dataType: "script"
          cache: true
          success: initSubmitClient
      else
        initSubmitClient()

    if @config.streamOptions
      @config.streamOptions.appkey or= @config.appkey
      if not Echo.Stream
        $.ajax
          url: "http://cdn.echoenabled.com/clientapps/v2/stream.js"
          dataType: "script"
          cache: true
          success: initStreamClient
      else
        initStreamClient()
