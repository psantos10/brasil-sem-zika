modulejs.define('ui/uploader', function() {
    var func = {
        init: function() {
          var preview = function (input) {
            if (input.files && input.files[0]) {
              var reader = new FileReader();
              reader.onload = function (e) {
                $('#image').attr('src', e.target.result);
              }
              reader.readAsDataURL(input.files[0]);
            }
          }

          $('#imgInp').on('change', function (){
            preview(this);
          });

          $(document).on('upload:start', 'form', function(event) {
            $(this).find('input[type=submit]').attr('disabled', true);
            $('.progress-group').slideDown('fast');
          });

          $(document).on('upload:progress', 'form', function(event) {
            var detail = event.detail.progress;
            percentCompleted = Math.round(detail.loaded / detail.total * 100);
            $('.progress-bar').width(percentCompleted + '%');
            $('.progress-text').text(percentCompleted + '% Completo');
          });

          $(document).on('upload:success', 'form', function(event) {
            if( $(this).find('input.uploading').length === 0 ) {
              $(this).find('input[type=submit]').removeAttr('disabled');
            }
          });
        }
      }

    return func;
});
