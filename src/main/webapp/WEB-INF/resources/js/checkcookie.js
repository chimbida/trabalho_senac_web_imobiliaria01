/**
 * Created by Chimbida on 04/11/2016.
 */
function updateCookie(){
    var elementValues = {};
    $(":checkbox").each(function(){
        elementValues[this.id] = this.checked;
    });
    $.cookie('elementValues', elementValues, { expires: 30, path: '/' })
}
function repopulateFormELements(){
    var elementValues = $.cookie('elementValues');
    if(elementValues){
        Object.keys(elementValues).forEach(function(element) {
            var checked = elementValues[element];
            $("#" + element).prop('checked', checked);
        });

    }
}
$(":checkbox").on("change", function(){
    updateCookie();
    verifica()
});
$("button").on("click", function() {
    updateCookie();
});
$.cookie.json = true;
repopulateFormELements();