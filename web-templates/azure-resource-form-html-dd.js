$(document).ready(function () {
  var $tableBody = $('#resourceTableBody');
  var $menu = $('#menu');
    $(document).on('click', '.provider-table__add-row-btn', function (e) {
        var $el = $(e.currentTarget);
        var htmlString = $('#rowTemplate').html();
        $tableBody.append(htmlString);
        return false;
    });

    $tableBody.on('click', '.provider-table__del-row-btn', function (e) {
        var $el = $(e.currentTarget);
        var $row = $el.closest('tr');
        $row.remove();
        return false;
    });
  Sortable.create(
        $tableBody[0],
        {
            animation: 150,
            scroll: true,
            handle: '.drag-handler',
            onEnd: function () {
                console.log('More see in https://github.com/RubaXa/Sortable');
            }
        }
    );
});
