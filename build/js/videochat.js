(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  if (!window.Echo) {
    window.Echo = {};
  }
  if (!Echo.VideoChat) {
    Echo.VideoChat = {};
  }
  Echo.VideoChat = (function() {
    function VideoChat(config) {
      var iframe, initStreamClient, initSubmitClient, _base, _base2, _base3, _base4;
      this.config = config;
      if (!(this.config && this.config.target && this.config.embed_id)) {
        return;
      }
      (_base = this.config).width || (_base.width = 350);
      (_base2 = this.config).height || (_base2.height = 265);
      iframe = $("<iframe />", {
        id: "videoEmbed",
        src: "http://api.opentok.com/hl/embed/" + this.config.embed_id,
        style: "border:none",
        frameborder: "0"
      });
      $(this.config.target).replaceWith(iframe);
      iframe.attr("height", this.config.height);
      iframe.attr("width", this.config.width);
      initSubmitClient = __bind(function() {
        console.log(this.config);
        return new Echo.Submit(this.config.submitOptions);
      }, this);
      initStreamClient = __bind(function() {
        console.log(this.config);
        return new Echo.Stream(this.config.streamOptions);
      }, this);
      if (this.config.submitOptions) {
        (_base3 = this.config.submitOptions).appkey || (_base3.appkey = this.config.appkey);
        if (!Echo.Submit) {
          $.ajax({
            url: "http://cdn.echoenabled.com/clientapps/v2/submit.js",
            dataType: "script",
            cache: true,
            success: initSubmitClient
          });
        } else {
          initSubmitClient();
        }
      }
      if (this.config.streamOptions) {
        (_base4 = this.config.streamOptions).appkey || (_base4.appkey = this.config.appkey);
        if (!Echo.Stream) {
          $.ajax({
            url: "http://cdn.echoenabled.com/clientapps/v2/stream.js",
            dataType: "script",
            cache: true,
            success: initStreamClient
          });
        } else {
          initStreamClient();
        }
      }
    }
    return VideoChat;
  })();
}).call(this);
