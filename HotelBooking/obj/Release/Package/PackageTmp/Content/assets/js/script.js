'use strict';
(function ($) {


    // profile dropdown js start 

    $("#profileDrpdwnBtn").click(function () {
        $(".profile-dropdown-list").show();
        $('.profile-drpdwn').addClass('changeBg')
        $('.profile-drpdwn h6').addClass('changeColor')

    });

    $(document).click(function (e) {
        if (!$(e.target).hasClass("profile-drpdwn")
            && $(e.target).parents(".profile-dropdown-list").length === 0) {
            $(".profile-dropdown-list").hide();
            $('.profile-drpdwn').removeClass('changeBg')
            $('.profile-drpdwn h6').removeClass('changeColor')
        }

    });

    // profile dropdown js end



    // create dropdown js start 


    $("#createBtn").click(function () {
        $(".create-dropdown-list").show();
    });

    $(document).click(function (e) {
        if (!$(e.target).hasClass("create-drpdwn")
            && $(e.target).parents(".create-dropdown-list").length === 0) {
            $(".create-dropdown-list").hide();
        }
    });

    // create dropdown js end 


    // language dropdown js start 

    $("#langBtn").click(function () {
        $(".lang-dropdown-list").show();
        $('.lang-drpdwn').addClass('changeBg')
        $('.lang-drpdwn h6').addClass('changeColor')
    });

    $(document).click(function (e) {
        if (!$(e.target).hasClass("lang-drpdwn")
            && $(e.target).parents(".lang-dropdown-list").length === 0) {
            $(".lang-dropdown-list").hide();
            $('.lang-drpdwn').removeClass('changeBg')
            $('.lang-drpdwn h6').removeClass('changeColor')
        }
    });

    // language dropdown js end 

    // sweet alert start 

    // delete alert start 

    $('#remove').on('click', function () {
        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: 'btn btn-danger mx-1',
                cancelButton: 'btn btn-success mx-1'
            },
            buttonsStyling: false
        })

        swalWithBootstrapButtons.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'No, cancel!',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                swalWithBootstrapButtons.fire(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                )
            } else if (
                /* Read more about handling dismissals below */
                result.dismiss === Swal.DismissReason.cancel
            ) {
                swalWithBootstrapButtons.fire(
                    'Cancelled',
                    'Your imaginary file is safe :)',
                    'error'
                )
            }
        })
    })

    // delete alert end

    //   create alert end 

    //$('#createitem').on('click', function () {
    //    Swal.fire({
    //        // position: 'top-end',
    //        icon: 'success',
    //        title: 'Successfully Created',
    //        showConfirmButton: false,
    //        timer: 1500
    //    })
    //    // $('.modal').removeClass('show');
    //    // $('.modal.fade').hide();
    //    // $('.modal-backdrop.show').hide();
    //    // $('body').removeClass('modal-open')
    //    // $('.modal.fade').removeAttr('aria-modal')
    //    // $('.modal.fade').attr('aria-hidden',true)
    //})

    //   create alert end 

    // sweet alert end

})(jQuery);

// sidbar js start

let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".bx-menu");
let sidebarBtnMbl = document.querySelector(".mbl-bx");
let arrow = document.querySelectorAll(".nav-links > li > .dash-link");
let sidebarClose = document.querySelector(".sidebar.close");
let navLi = document.querySelector(".nav-links li");


sidebarBtn.addEventListener("click", () => {
    sidebar.classList.toggle("close");
});

sidebarBtnMbl.addEventListener("click", () => {
    sidebar.classList.toggle("open");
});





/*
Template Name: Admin Template
Author: Wrappixel

File: js
*/
// ============================================================== 
// Auto select left navbar
// ============================================================== 
$(function () {
    var url = window.location;
    var element = $('.dash-link').filter(function () {
        return this.href == url;
    }).addClass('active').parent().addClass('active');
    while (true) {
        if (element.is('li')) {
            element = element.parent().addClass('showMenu').parent().addClass('active showMenu').children('a').addClass('active').parent().parent().parent().children('a').addClass('active').parent().addClass('active showMenu');

        }
        else {
            break;
        }
    }
    $('.nav-links > li > .dash-link').on('click', function (e) {
        // console.log('navlinks')
        if (!$(this).hasClass("active")) {
            // hide any open menus and remove all other classes
            $(".nav-links").children().removeClass("showMenu");
            $(".nav-links").children().removeClass("active");
            $(".nav-links").children().children().removeClass("active");

            // open our new menu and add the open class
            $(this).parent("li").addClass("showMenu");
            $(this).parent("li").addClass("active");
            $(this).addClass("active");
        }
        else if ($(this).hasClass("active")) {
            $(this).removeClass("active");
            $(this).parent("li").removeClass("showMenu");
            $(this).parent("li").removeClass("active");
        }
    })

    $('.sub-menu > .dash-item > .dash-link').on('click', function (e) {
        // console.log('submenu');
        if (!$(this).hasClass("active")) {
            // hide any open menus and remove all other classes
            $(".sub-menu").children().removeClass("showMenu");
            $(".sub-menu").children().removeClass("active");
            $(".nav-links > li > .sub-menu").children().children().removeClass("active");

            // open our new menu and add the open class
            $(this).parent("li").addClass("showMenu");
            $(this).parent("li").addClass("active");
            // $(this).parent("li").parent('ul').parent('a').parent('li').addClass("showMenu");
            // $(this).parent("li").parent('ul').parent('a').parent('li').addClass("active");
            $(this).addClass("active");
        }
        else if ($(this).hasClass("active")) {
            $(this).removeClass("active");
            $(this).parent("li").removeClass("showMenu");
            $(this).parent("li").removeClass("active");
        }
    })


    // $('.nav-links >li >a.dash-link').on('click', function (e) {
    //     e.preventDefault();
    // });
});





// sidbar js end





// table print js start 

function tablePrint() {
    var restorepage = document.body.innerHTML;
    document.querySelector('.fixed-table-toolbar').style.display = "none";

    var tablePagination = document.querySelector('.fixed-table-pagination');

    if (tablePagination) {
        tablePagination.style.display = "none";
    }

    document.querySelector('.fixed-table-container.fixed-height.has-footer').style.width = '100vw';

    var printcontent = document.getElementById('tablesList').innerHTML;
    document.body.innerHTML = printcontent;
    window.print();
    document.body.innerHTML = restorepage;
    location.reload();
}

// table print js end 


/* ------------------

 light & dark mode 

 ------------------*/

let theme = localStorage.getItem('theme') || 'light';
document.body.className = theme;

//  light mode start 

function light() {
    document.body.classList.remove("dark-mode");
    document.querySelector('.sidebar').classList.remove("dark-mode");
    document.querySelector('.main-content').classList.remove("dark-mode");
    document.querySelector('.nav-links').classList.remove("color-white");
    document.querySelector('.home-section .footer-content').classList.remove("dark-mode");
    document.querySelector('.home-section .home-content').classList.remove("dark-mode");
    document.querySelector('.content-heading-wrap').classList.remove("dark-mode-black");
    document.querySelector('.content-wrap').classList.remove("dark-mode");
    document.querySelector('#light').classList.add("d-none");
    document.querySelector('#dark').classList.remove("d-none");
    document.querySelector('#logoBlack').classList.remove("d-none");
    document.querySelector('#logoWhite').classList.add("d-none");
    theme = "LIGHT";
    localStorage.setItem("PageTheme", JSON.stringify(theme));

    let subMenu = document.querySelectorAll('.sub-menu');

    for (let i = 0; i < subMenu.length; i++) {
        subMenu[i].classList.remove('dark-mode')
    }

    let tables = document.querySelectorAll('.table');

    for (let i = 0; i < tables.length; i++) {
        tables[i].classList.remove('dark-mode')
    }



    let pathLink = document.querySelectorAll('.path-link li a');

    for (let i = 0; i < pathLink.length; i++) {
        pathLink[i].classList.remove("color-white")
    }

    let card = document.querySelectorAll('.card');

    for (let i = 0; i < card.length; i++) {
        card[i].classList.remove("dark-mode")
    }

    let cardBody = document.querySelectorAll('.card-body');

    for (let i = 0; i < cardBody.length; i++) {
        cardBody[i].classList.remove("dark-mode-black")
    }

}

//  light mode end 


//  dark mode start 


function dark() {
    document.body.classList.add("dark-mode");
    document.querySelector('.sidebar').classList.add("dark-mode");
    document.querySelector('.main-content').classList.add("dark-mode");
    document.querySelector('.nav-links').classList.add("color-white");
    document.querySelector('.home-section .footer-content').classList.add("dark-mode");
    document.querySelector('.home-section .home-content').classList.add("dark-mode");
    document.querySelector('.content-heading-wrap').classList.add("dark-mode-black");
    document.querySelector('.content-wrap').classList.add("dark-mode");
    document.querySelector('#dark').classList.add("d-none");
    document.querySelector('#light').classList.remove("d-none");
    document.querySelector('#logoWhite').classList.remove("d-none");
    document.querySelector('#logoBlack').classList.add("d-none");
    theme = "DARK";
    localStorage.setItem("PageTheme", JSON.stringify(theme));

    let subMenu = document.querySelectorAll('.sub-menu');

    for (let i = 0; i < subMenu.length; i++) {
        subMenu[i].classList.add('dark-mode')
    }


    let tables = document.querySelectorAll('.table');

    for (let i = 0; i < tables.length; i++) {
        tables[i].classList.add('dark-mode')
    }



    let pathLink = document.querySelectorAll('.path-link li a');

    for (let i = 0; i < pathLink.length; i++) {
        pathLink[i].classList.add("color-white")
    }


    let card = document.querySelectorAll('.card');

    for (let i = 0; i < card.length; i++) {
        card[i].classList.add("dark-mode")
    }


    let cardBody = document.querySelectorAll('.card-body');

    for (let i = 0; i < cardBody.length; i++) {
        cardBody[i].classList.add("dark-mode-black")
    }

}

//  dark mode end 



let getTheme = JSON.parse(localStorage.getItem("PageTheme"));
console.log(getTheme)

if (getTheme === "DARK") {
    document.body.classList.add("dark-mode");
    document.querySelector('.sidebar').classList.add("dark-mode");
    document.querySelector('.main-content').classList.add("dark-mode");
    document.querySelector('.nav-links').classList.add("color-white");
    document.querySelector('.home-section .footer-content').classList.add("dark-mode");
    document.querySelector('.home-section .home-content').classList.add("dark-mode");
    document.querySelector('.content-heading-wrap').classList.add("dark-mode-black");
    document.querySelector('.content-wrap').classList.add("dark-mode");
    document.querySelector('#dark').classList.add("d-none");
    document.querySelector('#light').classList.remove("d-none");
    document.querySelector('#logoWhite').classList.remove("d-none");
    document.querySelector('#logoBlack').classList.add("d-none");


    let subMenu = document.querySelectorAll('.sub-menu');

    for (let i = 0; i < subMenu.length; i++) {
        subMenu[i].classList.add('dark-mode')
    }


    let tables = document.querySelectorAll('.table');

    for (let i = 0; i < tables.length; i++) {
        tables[i].classList.add('dark-mode')
    }



    let pathLink = document.querySelectorAll('.path-link li a');

    for (let i = 0; i < pathLink.length; i++) {
        pathLink[i].classList.add("color-white")
    }


    let card = document.querySelectorAll('.card');

    for (let i = 0; i < card.length; i++) {
        card[i].classList.add("dark-mode")


    } 


    let cardBody = document.querySelectorAll('.card-body');

    for (let i = 0; i < cardBody.length; i++) {
        cardBody[i].classList.add("dark-mode-black")
    }
}

