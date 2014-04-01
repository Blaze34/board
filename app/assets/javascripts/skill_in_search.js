$(function(){
    var $form_search = $('form.search_with_skills'),
        $search_field = $form_search.find('input[name=skills]');

    if ($search_field.length == 0) return;

    $form_search.parent().on('click', '.skill_tag', function(e){
        e.preventDefault();

        var tag = $(this).text().trim();

        var currentTags = [];

        $.each($search_field.val().split(','), function(k,v){
            currentTags.push($.trim(v));
        });

        if (currentTags.indexOf(tag) == -1){
            currentTags.push(tag)
            $search_field.val(currentTags.join(', '));
            $form_search.submit()
        }
    })
})