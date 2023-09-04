/*table column*/
var $table = $('#ledger-table')
var $remove = $('#remove')
var selections = []

function initTable() {
    $table.bootstrapTable('destroy').bootstrapTable({
        height: 1000,
        locale: $('#locale').val(),
        icons: {
            paginationSwitchDown: 'far fa-caret-square-down',
            paginationSwitchUp: 'far fa-caret-square-up',
            refresh: 'fas fa-history',
            toggleOff: 'fas fa-toggle-off',
            toggleOn: 'fas fa-toggle-on',
            columns: 'fas fa-list',
            fullscreen: 'fas fa-expand',
            detailOpen: 'fas fa-plus-circle',
            detailClose: 'far fa-times-circle',
            export: 'fas fa-share-alt',
            print: 'fa fa-print'
        },
        columns: [
            [{
                title: 'SL',
                field: 'id',
                sortable: true
            }, {
                title: 'Vendor Code',
                field: 'Vendor Code',
                sortable: true
            }, {
                title: 'Name',
                field: 'Name',
                sortable: true
            }, {
                title: 'Balance',
                field: 'Balance',
                sortable: true
            }, {
                title: 'Status',
                field: 'Status',
                sortable: true
            }, {
                title: 'Operation',
                field: 'Operation',
                sortable: false
            }],
            []
        ]
    })
    $table.on('check.bs.table uncheck.bs.table ' +
        'check-all.bs.table uncheck-all.bs.table',
        function () {
            $remove.prop('disabled', !$table.bootstrapTable('getSelections').length)

            // save your data, here just save the current page
            selections = getIdSelections()
            // push or splice the selections if you want to save all data selections
        })
    $table.on('expand-row.bs.table', function (e, index, row, $detail) {
        if (index % 2 === 1) {
            $detail.html('Loading from ajax request...')
            $.get('LICENSE', function (res) {
                $detail.html(res.replace(/\n/g, '<br>'))
            })
        }
    })
    $table.on('all.bs.table', function (e, name, args) {

    })
    $remove.click(function () {
        var ids = getIdSelections()
        $table.bootstrapTable('remove', {
            field: 'id',
            values: ids
        })
        $remove.prop('disabled', true)
    })
}

$(function () {
    initTable()
    $('#locale').change(initTable)
})


