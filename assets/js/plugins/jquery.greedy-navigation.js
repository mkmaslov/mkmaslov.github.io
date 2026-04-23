/*
* Greedy Navigation
*
* http://codepen.io/lukejacksonn/pen/PwmwWV
*
*/

var $nav = $('#site-nav');
var $btn = $('#site-nav button');
var $vlinks = $('#site-nav .visible-links');
var $vlinks_persist_tail = $vlinks.children("*.persist.tail");
var $hlinks = $('#site-nav .hidden-links');

var breaks = [];

/*function updateNav() {

  var availableSpace = $btn.hasClass('hidden') ? $nav.width() : $nav.width() - $btn.width() - 30;

  // The visible list is overflowing the nav
  if ($vlinks.width() > availableSpace) {

    while ($vlinks.width() > availableSpace && $vlinks.children("*:not(.persist)").length > 0) {
      // Record the width of the list
      breaks.push($vlinks.width());

      // Move item to the hidden list
      $vlinks.children("*:not(.persist)").last().prependTo($hlinks);

      availableSpace = $btn.hasClass("hidden") ? $nav.width() : $nav.width() - $btn.width() - 30;

      // Show the dropdown btn
      $btn.removeClass("hidden");
    }

    // The visible list is not overflowing
  } else {

    // There is space for another item in the nav
    while (breaks.length > 0 && availableSpace > breaks[breaks.length - 1]) {
      // Move the item to the visible list
      if ($vlinks_persist_tail.children().length > 0) {
        $hlinks.children().first().insertBefore($vlinks_persist_tail);
      } else {
        $hlinks.children().first().appendTo($vlinks);
      }
      breaks.pop();
    }

    // Hide the dropdown btn if hidden list is empty
    if (breaks.length < 1) {
      $btn.addClass('hidden');
      $btn.removeClass('close');
      $hlinks.addClass('hidden');
    }
  }

  // Keep counter updated
  $btn.attr("count", breaks.length);

  // update masthead height and the body/sidebar top padding
  var mastheadHeight = $('.masthead').height();
  $('body').css('padding-top', mastheadHeight + 'px');
  if ($(".author__urls-wrapper button").is(":visible")) {
    $(".sidebar").css("padding-top", "");
  } else {
    $(".sidebar").css("padding-top", mastheadHeight + "px");
  }

}*/

function syncMastheadOffset() {
  var mastheadHeight = $('.masthead').height();
  $('body').css('padding-top', mastheadHeight + 'px');
  if ($('.author__urls-wrapper button').is(':visible')) {
    $('.sidebar').css('padding-top', '');
  } else {
    $('.sidebar').css('padding-top', mastheadHeight + 'px');
  }
}

function linksWrap() {
  var items = $vlinks.children().toArray();
  if (items.length < 2) return false;
  var firstTop = items[0].offsetTop;
  for (var i = 1; i < items.length; i += 1) {
    if (items[i].offsetTop !== firstTop) {
      return true;
    }
  }
  return false;
}

function updateNav() {
  $hlinks.children().appendTo($vlinks);
  $hlinks.addClass('hidden');
  $btn.addClass('hidden').removeClass('close');
  var navWidth = $nav[0].getBoundingClientRect().width;
  var buttonWidth = $btn.outerWidth(true);
  var availableWidth = navWidth - buttonWidth;
  var linksWidth = $vlinks[0].scrollWidth;
  var shouldCollapse = linksWrap() || linksWidth > availableWidth;
  if (shouldCollapse) {
    $vlinks.children().appendTo($hlinks);
    $btn.removeClass('hidden');
  }
  $btn.attr('count', $hlinks.children().length);
  syncMastheadOffset();
}


// Window listeners

$(window).on('resize', function () {
  updateNav();
});
screen.orientation.addEventListener("change", function () {
  updateNav();
});

$btn.on('click', function () {
  $hlinks.toggleClass('hidden');
  $(this).toggleClass('close');
});

updateNav();