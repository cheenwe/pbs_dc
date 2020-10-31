// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require clipboard.js

//= require turbolinks
//= require_tree .


//  刷新当前页面
function reloadPage() {
    window.location.reload()
}

//  后退
function goBack() {
  window.history.back()
}

//  前进
function goForward() {
  window.history.forward()
}

function select_all() {
  elems = $(".formcheck [name='bulk_ids[]']");
  // console.log(elems)
  // console.log(elems)
  // console.log(elems)
  if ($('#selected_all').is(':checked')) {
    $(elems).prop('checked', true);
  } else {
    $(elems).prop('checked', false);
  }
}
