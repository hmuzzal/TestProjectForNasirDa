
// #region common modulesstart
var previouskeyre = '';
document.addEventListener('keydown', (event) => {
    var name = event.key;
    var code = event.code;
   /* alert(`Key pressed ${name} \r\n Key code value: ${code}`);*/
    var url = window.location.toString();
    var newurl = '';
    if (new URL(url).host == '66.45.249.246') {
        newurl = 'http://' + new URL(url).host;
    }
    else {
        newurl = 'https://' + new URL(url).host;
    }
    if ((previouskeyre == "Alt" && (name === "n" || name === "N"))) {
        $('#AddModal').modal('show');
    }
    else if ((previouskeyre == "Alt" && (name === "x" || name === "X"))) {
        $('#AddModal').modal('hide');
    }
    if ((previouskeyre == "Alt" && (name === "A" || name === "a"))) {
        newurl = newurl+ '/' + "Configuration/AllCurrency"+ "/";
        window.location = newurl;
    }
    else if ((previouskeyre == "Alt" && (name === "B" || name === "b"))) {
        newurl = newurl + '/' + "Banking" + "/";
        window.location = newurl;
    }
    else if ((previouskeyre == "Alt" && (name === "C" || name === "c"))) {
        newurl = newurl + '/' + "Customer" + "/";
        window.location = newurl;
    }
    else if ((previouskeyre == "Alt" && (name === "V" || name === "v"))) {
        newurl = newurl + '/' + "Invoice" + "/";
        window.location = newurl;
    }
    else if ((previouskeyre == "Alt" && (name === "R" || name === "r"))) {
        newurl = newurl + '/' + "Invoice/PaymentReceived" + "/";
        window.location = newurl;
    }
    else if ((previouskeyre == "Alt" && (name === "T" || name === "t"))) {
        newurl = newurl + '/' + "Invoice/AllSalesReturn" + "/";
        window.location = newurl;
    }
    else if ((previouskeyre == "Alt" && (name === "S" || name === "s"))) {
        newurl = newurl + '/' + "Vendor" + "/";
        window.location = newurl;
    }
    else if ((previouskeyre == "Alt" && (name === "I" || name === "i"))) {
        newurl = newurl + '/' + "Purchase/AllBills" + "/";
        window.location = newurl;
    }
    else if ((previouskeyre == "Alt" && (name === "P" || name === "p"))) {
        newurl = newurl + '/' + "Purchase/AllPaymentsMade" + "/";
        window.location = newurl;
    }
    else if ((previouskeyre == "Alt" && (name === "D" || name === "d"))) {
        newurl = newurl + '/' + "Purchase/AllPurchaseReturn" + "/";
        window.location = newurl;
    }
    else if ((previouskeyre == "Alt" && (name === "E" || name === "e"))) {
        newurl = newurl + '/' + "Purchase/Expense" + "/";
        window.location = newurl;
    }
    else if ((previouskeyre == "Alt" && (name === "J" || name === "j"))) {
        newurl = newurl + '/' + "Accounts/ManualJournals" + "/";
        window.location = newurl;
    }
    
    
    previouskeyre = name;
    // Alert the key name and key code on keydown
     
}, false);

function closeModal() {
    $('#EditModal').modal('hide');
}

$(document).ready(function () {
    $('#EditModal').on('hidden.bs.modal', function () {
        var url = window.location.toString();

        var pathname = new URL(url).pathname;
        var splitUrl = pathname.split('/');
        var newurl = '';
        if (new URL(url).host == '66.45.249.246') {
            newurl = 'http://' + new URL(url).host;
        }
        else {
            newurl = 'https://' + new URL(url).host;
        }

        for (var i = 0; i < splitUrl.length - 1; i++) {
            newurl += splitUrl[i] + '/';
        }
        window.location = newurl;
    })
});

function closeModalAdd() {
    $('#AddModal').modal('hide');
}

function deleteItem(id) {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: "btn btn-danger mx-1",
            cancelButton: "btn btn-success mx-1",
        },
        buttonsStyling: false,
    });

    swalWithBootstrapButtons
        .fire({
            title: "Are you sure?",
            text: "Are you want to Delete this??",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Yes, delete it!",
            cancelButtonText: "No, cancel!",
            reverseButtons: true
        })
        .then((result) => {
            if (result.isConfirmed) {

                document.getElementById('deleteitem' + id).click();

            } else if (
                /* Read more about handling dismissals below */
                result.dismiss === Swal.DismissReason.cancel
            ) {
                swalWithBootstrapButtons.fire(
                    "Cancelled",
                    "Your imaginary file is safe :)",
                    "error"
                );
            }
        });
}

function invoicePrint() {
    var restorepage = document.body.innerHTML;
    document.querySelector(".fixed-table-toolbar").style.display = "none";
    let fhtCell = document.querySelectorAll(".fht-cell");

    for (let i = 0; i < fhtCell.length; i++) {
        fhtCell[i].style.display = "none";
    }

    document.querySelector(".bootstrap-table").style.width = "1024px";



    let thTitle = document.querySelectorAll("th");

    for (let i = 0; i < thTitle.length; i++) {
        thTitle[i].style.fontSize = "14px";

    }
    let tdTitle = document.querySelectorAll("td");

    for (let i = 0; i < tdTitle.length; i++) {
        tdTitle[i].style.fontSize = "14px";
    }

    var printcontent = document.querySelector(".table-responsive").innerHTML;
    document.body.innerHTML = printcontent;
    window.print();
    document.body.innerHTML = restorepage;
    location.reload();
}

// #endregion
// #region service module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("updatedesignations_Id").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');
            console.log('ddsdsad');
        }
    } catch {

    }

});
// #endregion


// #region service module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("updateservice_PkModuleId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');

        }
    } catch {

    }

});
// #endregion 
// #region invoice module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("invoiceupdate_PkInvoiceId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');

        }
    } catch {

    }
    
});
$(function () {
    
    $("#invoicecreate_InvoiceDate").change(function () {
        var selecteddate = document.getElementById("invoicecreate_InvoiceDate").value;
        console.log(selecteddate);
        var url = '../../Home/GenderateTenDigitUniqueInvoiceNumberByDate';
        var data1 = { "cdate": selecteddate.toString() };

        $.post(url, data1, function (data) {
            document.getElementById("invoicecreate_InvoiceNo").value = data;
        })

    });
    $("#invoicebulk_InvoiceDate").change(function () {
        var selecteddate = document.getElementById("invoicebulk_InvoiceDate").value;
        console.log(selecteddate);
        var url = '../../Home/GenderateTenDigitUniqueInvoiceNumberByDate';
        var data1 = { "cdate": selecteddate.toString() };

        $.post(url, data1, function (data) {
            document.getElementById("invoicebulk_InvoiceNo").value = data;
        })

    });

});
$(function () {
    $("#invoiceupdate_DebitLedgerID").change(function () {
        var ledgerid = $(this).children("option:selected").val();

        var url = '../../Home/GetCurrencyInforamtion';
        var data1 = { "ledgerid": ledgerid };

        $.post(url, data1, function (data) {
            var items = [];
            for (var i = 0; i < data.length; i++) {
                items.push("<option value=" + data[i].Value + ">" + data[i].Text + "</option>");
            }

            //var element = document.getElementById("invoicecreate_SaleCurrencyID");
            //element.classList.remove("form-select");

            $("#invoiceupdate_DebitCurrencyID").html(items.join(' '));
           
        })

    });

    $("#invoiceupdate_CreditLedgerID").change(function () {
        var ledgerid = $(this).children("option:selected").val();

        var url = '../../Home/GetCurrencyInforamtion';
        var data1 = { "ledgerid": ledgerid };

        $.post(url, data1, function (data) {
            var items = [];
            for (var i = 0; i < data.length; i++) {
                items.push("<option value=" + data[i].Value + ">" + data[i].Text + "</option>");
            }

            $("#invoiceupdate_DebitCurrencyID").html(items.join(' '));
            
        })

    });

    $("#invoiceupdate_CreditAmount").change(function () {

        var salecurrency = document.getElementById("invoiceupdate_CreditCurrencyID").value;
        var paidcurrency = document.getElementById("invoiceupdate_DebitCurrencyID").value;
        var saleamount = document.getElementById("invoiceupdate_CreditAmount").value;
        console.log(salecurrency);

        var url = '../../Home/CurrencyConversion';
        var data1 = { "salecurrency": salecurrency, "paidcurrency": paidcurrency, "saleamount": saleamount };

        $.post(url, data1, function (data) {
            document.getElementById("invoiceupdate_DebitAmount").value = data[0].Text;
            document.getElementById("invoiceupdate_ConversionRate").value = data[1].Text;
            document.getElementById("invoiceupdate_ReverseRate").value = data[2].Text;

            var debitamount = document.getElementById("invoiceupdate_DebitAmount").value;
            var conversionrate = document.getElementById("invoiceupdate_ConversionRate").value;
            var creditamount = document.getElementById("invoiceupdate_CreditAmount").value;

            var checkcreditamount = debitamount / conversionrate;
            console.log(checkcreditamount)
            if (creditamount - checkcreditamount < 2) {
                document.getElementById('updateitem').classList.remove('disabled');
            }
            else {

            }
        })

    });
    $("#invoiceupdate_ConversionRate").change(function () {

        var buyamount = document.getElementById("invoiceupdate_CreditAmount").value;
        var conversionrate = document.getElementById("invoiceupdate_ConversionRate").value;

        document.getElementById("invoiceupdate_DebitAmount").value = parseFloat((buyamount * conversionrate).toFixed(2));

        document.getElementById("invoiceupdate_ReverseRate").value = parseFloat((1 / conversionrate).toFixed(6));
    });

    $("#invoiceupdate_ReverseRate").change(function () {

        var buyamount = document.getElementById("invoiceupdate_CreditAmount").value;
        var reverserate = document.getElementById("invoiceupdate_ReverseRate").value;

        document.getElementById("invoiceupdate_DebitAmount").value = parseFloat((buyamount * (1 / reverserate)).toFixed(2));

        document.getElementById("invoiceupdate_ConversionRate").value = parseFloat((1 / reverserate).toFixed(6));
    });

});

// #endregion

// #region bank module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("updatebank_PkBankAccountId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');
        }
    } catch {

    }
    

});
function pdfMake() {
    $("#ledger-table").tableHTMLExport({ type: "pdf", filename: "bankdata.pdf" });
};


// #endregion

// #region accounts module start
function ledgerParentFunc() {
    $(function () {
        var LedgerParent = parseFloat(document.getElementById('createled_LedgerParent').value);
        var LedgerNature = document.getElementById('createled_LedgerNature');
        var url = '../../Home/GetGroupParentnature';
        var data1 = { "id": LedgerParent };
        $.post(url, data1, function (data) {
            var items = [];
            if (data == 'Cr') {
                for (var i = 0; i < 1; i++) {
                    items.push("<option value=" + "Cr" + " selected = 'true'" + ">" + "Cr" + "</option>");
                    items.push("<option value=" + "Dr" + ">" + "Dr" + "</option>");
                }
                $("#createled_LedgerNature").html(items.join(' '));
            }
            else if (data == 'Dr') {
                for (var i = 0; i < 1; i++) {
                    items.push("<option value=" + "Cr" + ">" + "Cr" + "</option>");
                    items.push("<option value=" + "Dr" + " selected = 'true'" + ">" + "Dr" + "</option>");
                }
                $("#createled_LedgerNature").html(items.join(' '));
            }
        })
    });
};
function ledgerParentFuncUpdate() {
    $(function () {
        var LedgerParent = parseFloat(document.getElementById('updateled_LedgerParent').value);
        var LedgerNature = document.getElementById('updateled_LedgerNature');
        var url = '../../Home/GetGroupParentnature';
        var data1 = { "id": LedgerParent };
        $.post(url, data1, function (data) {
            var items = [];
            if (data == 'Cr') {
                for (var i = 0; i < 1; i++) {
                    items.push("<option value=" + "Cr" + " selected = 'true'" + ">" + "Cr" + "</option>");
                    items.push("<option value=" + "Dr" + ">" + "Dr" + "</option>");
                }
                $("#updateled_LedgerNature").html(items.join(' '));
            }
            else if (data == 'Dr') {
                for (var i = 0; i < 1; i++) {
                    items.push("<option value=" + "Cr" + ">" + "Cr" + "</option>");
                    items.push("<option value=" + "Dr" + " selected = 'true'" + ">" + "Dr" + "</option>");
                }
                $("#updateled_LedgerNature").html(items.join(' '));
            }
        })
    });
};

$(document).ready(function () {
    try {
        var currencyid = document.getElementById("updateled_PkLedgerId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');
        }
    } catch {

    }
   
});
// #endregion



// #region manual journal module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("updatejournal_PkJournalId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');
        }
    } catch {

    }
    
});
$(function () {
   
    $("#createjournal_DebitAmount").change(function () {

        var DebitAmount = document.getElementById("createjournal_DebitAmount").value;
        document.getElementById('createitem').classList.remove('disabled');
        document.getElementById("createjournal_CreditAmount").value = DebitAmount;
        
      
    });

    $("#updatejournal_DebitAmount").change(function () {

        var DebitAmount = document.getElementById("updatejournal_DebitAmount").value;
        document.getElementById('updateitem').classList.remove('disabled');
        document.getElementById("updatejournal_CreditAmount").value = DebitAmount;


    });

    $("#createjournal_JournalDate").change(function () {
        var selecteddate = document.getElementById("createjournal_JournalDate").value;
        console.log(selecteddate);
        var url = '../../Home/GenderateFourDigitUniqueJournalNumberByDate';
        var data1 = { "cdate": selecteddate.toString() };

        $.post(url, data1, function (data) {
            document.getElementById("createjournal_JournalNo").value = data;
        })

    });
});


// #endregion



// #region customer module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("newentry_CustomerName").value;
        if (currencyid != null && currencyid != '') {
            $('#AddModal').modal('show');
        }
    } catch {

    }
    
});

$(document).ready(function () {
    try {
        var currencyid = document.getElementById("updateentry_PkCustomerId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');
        }
    } catch {

    }
    
});
// #endregion

// #region payments module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("updatepaymentreceived_PkPaymentsId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');
        }
    } catch {

    }
    

});
$(function () {
   
    $("#createpaymentreceived_PaymentDate").change(function () {
        var selecteddate = document.getElementById("createpaymentreceived_PaymentDate").value;
        console.log(selecteddate);
        var url = '../../Home/GenderateTenDigitUniquePaymentNumberByDate';
        var data1 = { "cdate": selecteddate.toString() };

        $.post(url, data1, function (data) {
            document.getElementById("createpaymentreceived_PaymentNumber").value = data;
        })

    });
});


// #endregion

// #region sales return module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("updateceditnotes_PkCreditNoteId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');
        }
    } catch {

    }
    
});
$(function () {
    $("#createceditnotes_CreditLedgerID").change(function () {
        var ledgerid = $(this).children("option:selected").val();

        var url = '../Home/GetBankAccountInforamtion';
        var data1 = { "ledgerid": ledgerid };

        $.post(url, data1, function (data) {
            var items = [];
            for (var i = 0; i < data.length; i++) {
                items.push("<option value=" + data[i].Value + ">" + data[i].Text + "</option>");
            }

            $("#createceditnotes_DebitLedgerID").html(items.join(' '));
           
        })

    });
    $("#createceditnotes_CreditNoteDate").change(function () {
        var selecteddate = document.getElementById("createceditnotes_CreditNoteDate").value;
        console.log(selecteddate);
        var url = '../../Home/GenderateFourDigitUniqueCreditNoteNumberByDate';
        var data1 = { "cdate": selecteddate.toString() };

        $.post(url, data1, function (data) {
            document.getElementById("createceditnotes_CreditNoteNumber").value = data;
        })

    });
});
// #endregion

// #region purchase module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("billupdate_PkBillId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');
        }
    } catch {

    }
    
});
$(function () {
   
    $("#billcreate_BillDate").change(function () {
        var selecteddate = document.getElementById("billcreate_BillDate").value;
        console.log(selecteddate);
        var url = '../../Home/GenderateTenDigitUniqueBillNumberByDate';
        var data1 = { "cdate": selecteddate.toString() };

        $.post(url, data1, function (data) {
            document.getElementById("billcreate_BillNo").value = data;
        })

    });
});



// #endregion

// #region payments made module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("updatepaymentmade_PkPaymentsMadeId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');
        }
    } catch {

    }
   

});
$(function () {
    $("#createpaymentmade_DebitLedgerID").change(function () {
        var ledgerid = $(this).children("option:selected").val();

        var url = '../Home/GetBankAccountInforamtion';
        var data1 = { "ledgerid": ledgerid };

        $.post(url, data1, function (data) {
            var items = [];
            for (var i = 0; i < data.length; i++) {
                items.push("<option value=" + data[i].Value + ">" + data[i].Text + "</option>");
            }

            $("#createpaymentmade_CreditLedgerID").html(items.join(' '));
            
        })

    });

    $("#createpaymentmade_PaymentDate").change(function () {
        var selecteddate = document.getElementById("createpaymentmade_PaymentDate").value;
        console.log(selecteddate);
        var url = '../../Home/GenderateTenDigitUniquePaymentMadeNumberByDate';
        var data1 = { "cdate": selecteddate.toString() };

        $.post(url, data1, function (data) {
            document.getElementById("createpaymentmade_PaymentsNo").value = data;
        })

    });
});
// #endregion

// #region purchase return module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("updateebit_PkVendorDebitId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');
        }
    } catch {

    }
    
});
$(function () {
    $("#createdebit_DebitLedgerID").change(function () {
        var ledgerid = $(this).children("option:selected").val();

        var url = '../Home/GetBankAccountInforamtion';
        var data1 = { "ledgerid": ledgerid };

        $.post(url, data1, function (data) {
            var items = [];
            for (var i = 0; i < data.length; i++) {
                items.push("<option value=" + data[i].Value + ">" + data[i].Text + "</option>");
            }

            $("#createdebit_CreditLedgerID").html(items.join(' '));
            
        })

    });
    $("#createdebit_DebitNoteDate").change(function () {
        var selecteddate = document.getElementById("createdebit_DebitNoteDate").value;
        console.log(selecteddate);
        var url = '../../Home/GenderateFiveDigitUniqueVDebitNoteNumberByDate';
        var data1 = { "cdate": selecteddate.toString() };

        $.post(url, data1, function (data) {
            document.getElementById("createdebit_DebitNoteNumber").value = data;
        })

    });
});
// #endregion

// #region expense module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("updateexpense_PkExpenseId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');
        }
    } catch {

    }
    
});
$(function () {
    $("#createexpense_DebitAccountsID").change(function () {
        var ledgerid = $(this).children("option:selected").val();

        var url = '../Home/GetExpenseAccountInforamtion';
        var data1 = { "ledgerid": ledgerid };

        $.post(url, data1, function (data) {
            var items = [];
            for (var i = 0; i < data.length; i++) {
                items.push("<option value=" + data[i].Value + ">" + data[i].Text + "</option>");
            }

            //var element = document.getElementById("createexpense_SaleCurrencyID");
            //element.classList.remove("form-select");

            $("#createexpense_CreditAccountID").html(items.join(' '));
           
        })

    });

    $("#createexpense_ExpenseDate").change(function () {
        var selecteddate = document.getElementById("createexpense_ExpenseDate").value;
        console.log(selecteddate);
        var url = '../../Home/GenderateFiveDigitUniqueExpenseCodeByDate';
        var data1 = { "cdate": selecteddate.toString() };

        $.post(url, data1, function (data) {
            document.getElementById("createexpense_ExpenseNo").value = data;
        })

    });
});

// #endregion

// #region supplier module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("newentry_VendorName").value;
        if (currencyid != null && currencyid != '') {
            $('#AddModal').modal('show');
        }
    } catch {

    }
});
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("updateentry_PkVendorId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');
        }
    } catch {

    }
   
});
// #endregion

// #region user type module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("updateusertype_PkUserTypelId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');
        }
    } catch {

    }
    
});

// #endregion

// #region user module start
$(document).ready(function () {
    try {
        var currencyid = document.getElementById("updateentry_PkUserId").value;
        if (currencyid != 0) {
            $('#EditModal').modal('show');
        }
    } catch {

    }
    
});
// #endregion

// #region invoice module start
$(document).ready(function () {
    try {
        var roomDetailsid = document.getElementById("updateentry_PkRoomDetailsId").value;
        if (roomDetailsid != 0) {
            $('#EditModal').modal('show');
        }
    } catch {

    }

});
// #endregion

// #region invoice module start
// #endregion

// #region invoice module start
// #endregion

// #region invoice module start
// #endregion 