$(document).on('page:change', function() {
  // Bible search form submission
  $('#bible_search').click(function(){
    $('#bible_search_form').submit();
  });
  // Top Bible search for submission
  $('#top_bible_search').click(function(){
    $('#top_bible_search_form').submit();
  });
});