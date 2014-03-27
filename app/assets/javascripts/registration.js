$(function(){
    var $form = $('#new_user'),
        $role = $('#user_role'),
        toggle = function(){
            $form.find('.new_user_hide')[$role.val() == 'worker' ? 'show' : 'hide']();
        };
    $role.on('change', toggle);
    toggle();
})