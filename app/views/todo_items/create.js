$('#pending-items tr:first').after('<%= j render 'todo_items/todo_item', todo_list: @todo_list, item: @todo_item %>');
$(':input').val("");