/*table column*/

function buildTable($el, cells, rows) {
    var i, j, row,
        columns = [],
        data = [];

    for (i = 0; i < cells; i++) {
        columns.push({
            field: 'field' + i,
            title: 'Cell' + i
        });
    }
    for (i = 0; i < rows; i++) {
        row = {};
        for (j = 0; j < cells; j++) {
            row['field' + j] = 'Row-' + i + '-' + j;
        }
        data.push(row);
    }
    $el.bootstrapTable('destroy').bootstrapTable({
        columns: columns,
        data: data
    });
}

$(function () {
    buildTable($('#clmtable'), 50, 50);
});

var $table = $('#ledger-table')
var $remove = $('#remove')
var selections = []

function getIdSelections() {
    return $.map($table.bootstrapTable('getSelections'), function (row) {
        return row.id
    })

}

function responseHandler(res) {
    $.each(res.rows, function (i, row) {
        row.state = $.inArray(row.id, selections) !== -1
    })
    return res
}

function detailFormatter(index, row) {
    var html = []
    $.each(row, function (key, value) {
        html.push('<p><b>' + key + ':</b> ' + value + '</p>')
    })
    return html.join('')
}



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
                title: 'Group Name',
                field: 'Group Name',
                sortable: true
            }, {
                title: 'Group Parent',
                field: 'Group Parent',
                sortable: true
            }, {
                title: 'Group Identifier',
                field: 'Group Identifier',
                sortable: true
            }, {
                title: 'Nature',
                field: 'Nature',
                sortable: false
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

var $table1 = $('#tablemodal')

$(function () {
    $('#modalTable').on('shown.bs.modal', function () {
        $table1.bootstrapTable('resetView')
    })
})

var $table2 = $('#subtable')

function buildTable($el, cells, rows) {
    var i; var j; var row
    var columns = []
    var data = []

    for (i = 0; i < cells; i++) {
        columns.push({
            field: 'field' + i,
            title: 'Cell' + i,
            sortable: true
        })
    }
    for (i = 0; i < rows; i++) {
        row = {}
        for (j = 0; j < cells; j++) {
            row['field' + j] = 'Row-' + i + '-' + j
        }
        data.push(row)
    }
    $el.bootstrapTable({
        columns: columns,
        data: data,
        detailView: cells > 1,
        onExpandRow: function (index, row, $detail) {
            /* eslint no-use-before-define: ["error", { "functions": false }]*/
            expandTable($detail, cells - 1)
        }
    })
}

function expandTable($detail, cells) {
    buildTable($detail.html('<table></table>').find('table'), cells, 1)
}

$(function () {
    buildTable($table2, 8, 1)
})

var $table3 = $('#localetable')

$(function () {
    $table3.bootstrapTable()
    $table3.bootstrapTable('destroy').bootstrapTable({
        locale: $('#localetable').val(),
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
        }
    })
    $('#localetable').change(function () {
        $table3.bootstrapTable('refreshOptions', {
            locale: $(this).val()
        })
    })
})