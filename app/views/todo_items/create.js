/********** Adds new item to table row *********/
$('#pending-items tr:first').after('<%= j render 'todo_items/pending', todo_list: @todo_list, item: @todo_item %>').slideDown(200);
/********** Clears new item input *********/
$(':input').val("");