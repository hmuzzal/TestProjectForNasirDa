(function ($) {
    'use strict';
    /*------------------------------------
         Destination  Slider - index.html & services.html
       --------------------------------------*/

    // Slider With Thumbs
    if (jQuery(".destination-slider-active .swiper-container").length > 0) {
        let destinationSlider = new Swiper('.destination-slider-active .swiper-container', {
            // Optional parameters
            slidesPerView: 5,
            slidesPerColumn: 1,
            loop: true,

            autoplay: {
                delay: 2000,
            },

            breakpoints: {
                320: {
                    slidesPerView: 2,
                },
                768: {
                    slidesPerView: 3,
                },
                1024: {
                    slidesPerView: 4,
                },
                1200: {
                    slidesPerView: 5,
                },
            },

            a11y: false

        });
    }


    /*------------------------------------
           Visa Slider - usa-visa.html
         --------------------------------------*/

    // Slider With Thumbs
    if (jQuery(".visa-slider-active .swiper-container").length > 0) {
        let destinationSlider = new Swiper('.visa-slider-active .swiper-container', {
            // Optional parameters
            slidesPerView: 5,
            slidesPerColumn: 1,
            loop: true,



            breakpoints: {
                320: {
                    slidesPerView: 1,
                },
                768: {
                    slidesPerView: 2,
                },
                1024: {
                    slidesPerView: 3,
                },
                1200: {
                    slidesPerView: 3,
                },
            },

            // Navigation arrows
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },

            a11y: false

        });
    }

    /*------------------------------------
           Blogs Slider
         --------------------------------------*/

    // Slider With Thumbs
    if (jQuery(".related-slider-active .swiper-container").length > 0) {
        let destinationSlider = new Swiper('.related-slider-active .swiper-container', {
            // Optional parameters
            slidesPerView: 4,
            slidesPerColumn: 1,
            loop: true,



            breakpoints: {
                320: {
                    slidesPerView: 1,
                },
                768: {
                    slidesPerView: 2,
                },
                1024: {
                    slidesPerView: 3,
                },
                1200: {
                    slidesPerView: 4,
                },
            },

            // Navigation arrows
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },

            a11y: false

        });
    }





    /*------------------------------------
      Country name search
    --------------------------------------*/


    // SEARCH FUNCTION
    var btsearch = {
        init: function (search_field, searchable_elements, searchable_text_class) {
            $(search_field).keyup(function (e) {
                e.preventDefault();
                var query = $(this).val().toLowerCase();
                if (query) {
                    // loop through all elements to find match
                    $.each($(searchable_elements), function () {
                        var title = $(this).find(searchable_text_class).text().toLowerCase();
                        if (title.indexOf(query) == -1) {
                            $(this).hide();
                        } else {
                            $(this).show();
                        }
                    });
                } else {
                    // empty query so show everything
                    $(searchable_elements).show();
                }
            });
        }
    }
    // INIT
    $(function () {
        // USAGE: btsearch.init(('search field element', 'searchable children elements', 'searchable text class');
        btsearch.init('#searchInput', '.country-name', '.cName');
    });




    //     /*------------------------------------
    //         Mobile Menu
    //     --------------------------------------*/

    //     $('#mobile-menu').meanmenu({
    //         meanMenuContainer: '.mobile-menu',
    //         meanScreenWidth: "991"
    //     });

    //     $('.side-icon > a').on('click', function(event){
    //         event.preventDefault();
    //         $('.side-bar-menu').addClass('active')
    //     });

    //     $('.close-icon > a').on('click', function(event){
    //         event.preventDefault();
    //         $('.side-bar-menu').removeClass('active')
    //     });


    //     /*-------------------------------------------
    //         Sticky Header
    //     --------------------------------------------- */

    //     let win = $(window);
    //     let sticky_id = $(".header-area");
    //     win.on('scroll', function () {
    //         let scroll = win.scrollTop();
    //         if (scroll < 245) {
    //             sticky_id.removeClass("sticky-header");
    //         } else {
    //             sticky_id.addClass("sticky-header");
    //         }
    //     });


    //     /*------------------------------------
    //         Overlay Close
    //     --------------------------------------*/
    //     $(window).scroll(function () {
    //         if ($(this).scrollTop() !== 0) {
    //             $('#scrollUp').fadeIn();
    //         } else {
    //             $('#scrollUp').fadeOut();
    //         }
    //     });

    //     $('#scrollUp').on('click', function () {
    //         $("html, body").animate({ scrollTop: 0 }, 600);
    //         return false;
    //     });

    //     /*------------------------------------
    //             Odometer Counter
    //         --------------------------------------*/

    //     $('.odometer').appear(function (e) {
    //         var odo = $(".odometer");
    //         odo.each(function () {
    //             var countNumber = $(this).attr("data-count");
    //             $(this).html(countNumber);
    //         });
    //     });

    //     /*------------------------------------
    //          skillbar plugin
    //      --------------------------------------*/


    //     $('.skillbar').skillbar({

    //         speed: 2000

    //     });






    /*------------------------------------
     change background image & Hero text - index.html
 --------------------------------------*/

    $('#flight-tab').on('click', function (event) {
        event.preventDefault();
        $('.hero-area').addClass('active')
    });

    $('#visa-tab').on('click', function (event) {
        event.preventDefault();
        $('.hero-area').removeClass('active')
    });

    $("#flight-tab").click(function () {
        $(".hero-text").text("Where would you like to fly?");
    });
    $("#visa-tab").click(function () {
        $(".hero-text").text("Apply for a visa online in a few clicks.");
    });


    /*------------------------------------
           FAQ title change - faq.html
    --------------------------------------*/


    $("#pills-all-tab").click(function () {
        $("#faqTitle").text("How can we help you?");
    });
    $("#pills-company-tab").click(function () {
        $("#faqTitle").text("Frequent Questions About Company");
    });
    $("#pills-travel-tab").click(function () {
        $("#faqTitle").text("Frequent Questions About Travel");
    });
    $("#pills-passport-tab").click(function () {
        $("#faqTitle").text("Frequent Questions About Passport");
    });
    $("#pills-visa-tab").click(function () {
        $("#faqTitle").text("Frequent Questions About Visa");
    });




    /*------------------------------------
            search blog dropdown - blog.html
    --------------------------------------*/


    $('#blogBtn').on('click', function (event) {
        event.preventDefault();
        $('#blogBtn').toggleClass("rotate");
        $('.blogCategorisList').toggle()

    });

    /*------------------------------------
            Most recent  dropdown - 5-best-hotel.html
    --------------------------------------*/


    $('#recentBtn').on('click', function (event) {
        event.preventDefault();
        $('#recentBtn').toggleClass("rotate");
        $('.recent-list').toggle()

    });

    /*------------------------------------
            Topic List dropdown - 5-best-hotel.html
    --------------------------------------*/


    $('#topicBtn').on('click', function (event) {
        event.preventDefault();
        $('#topicBtn').toggleClass("rotate");
        $('.topic-list').toggle()

    });

    /*------------------------------------
            search input button  - blog.html
    --------------------------------------*/


    $('#searchBlogInput').on('click', function (event) {
        event.preventDefault();
        $('.search-content-box').addClass("d-none");
        $('.search-input-blog-box').addClass("d-flex");
    });

    $('#searchCancelIcon').on('click', function (event) {
        event.preventDefault();
        $('.search-content-box').removeClass("d-none");
        $('.search-input-blog-box').removeClass("d-flex");
    });


    /*------------------------------------
            track dropdown - index.html
    --------------------------------------*/

    $(".track-btn").click(function () {
        $(".track-content").show();
    });

    $(document).click(function (e) {
        if (!$(e.target).hasClass("track-btn")
            && $(e.target).parents(".track-content").length === 0) {
            $(".track-content").hide();
        }
    });

    var trackLi = $('.track-content li');


    trackLi.click(function () {
        var liText = $(this).text();
        $('.track-btn span').text(liText)
        console.log(liText);
    })


    /*------------------------------------
    passengers category dropdown - index.html
     --------------------------------------*/

    $(".dropbtn").click(function () {
        $(".dropdown-content").show();
    });

    $(document).click(function (e) {
        if (!$(e.target).hasClass("dropbtn")
            && $(e.target).parents(".dropdown-content").length === 0) {
            $(".dropdown-content").hide();
        }
    });


    /*------------------------------------
         Classes dropdown - index.html
 --------------------------------------*/

    $(".classes-btn").click(function () {
        $(".classes-content").show();
    });

    $(document).click(function (e) {
        if (!$(e.target).hasClass("classes-btn")
            && $(e.target).parents(".classes-content").length === 0) {
            $(".classes-content").hide();
        }
    });

    var classesLi = $('.classes-content li');


    classesLi.click(function () {
        var liText = $(this).text();
        $('.classes-btn span').text(liText)
    })




  

    /*------------------------------------
      counts plus minus - index.html
    --------------------------------------*/

    $(".category-counts").on("click", ".plus, .minus",
        function () {
            // Get current quantity values
            let qty = $(this).closest(".category-counts").find(".qty");
            let val = parseFloat(qty.val());
            let max = parseFloat(qty.attr("max"));
            let min = parseFloat(qty.attr("min"));


            // get input value 
            let adult = parseFloat($('#adult').val());
            let children = parseFloat($('#children').val());
            let infants = parseFloat($('#infants').val());
            var total = adult + children + infants;
            // console.log(total)


            // Change the value if plus or minus
            if ($(this).is(".plus")) {
                if (max && max <= val) {
                    qty.val(max);
                } else {
                    qty.val(val + 1).trigger("change");
                    $(".dropbtn span").text(total + 1);
                }
            } else {
                if (min && min >= val) {
                    qty.val(min);
                } else if (val > 0) {
                    qty.val(val - 1).trigger("change");
                    $(".dropbtn span").text(total - 1);
                }
            }
        }
    );


    /*------------------------------------
    visa application dropdown show hide - visa-application.html
    --------------------------------------*/



    $("#from").change(function () {
        if ($(this).val() == '1') {
            $("#planningTo").hide();
            $("#purposeOf").hide();
            $("#startBtn").attr('disabled');
            $("#startBtn").addClass('disabled');
        } else {
            $("#planningTo").show();
            $("#purposeOf").hide();
            $("#startBtn").attr('disabled');
            $("#startBtn").addClass('disabled');
            $('#to').val('1');
        }
    });

    $("#to").change(function () {
        if ($(this).val() == '1') {
            $("#purposeOf").hide();
            $("#startBtn").attr('disabled');
            $("#startBtn").addClass('disabled');
        } else {
            $("#purposeOf").show();
            $('#purpose').val('1');
            $("#startBtn").attr('disabled');
            $("#startBtn").addClass('disabled');
        }
    });

    $("#purpose").change(function () {
        if ($(this).val() == '1') {
            $("#startBtn").attr('disabled');
            $("#startBtn").addClass('disabled');
        } else {
            $("#startBtn").removeAttr('disabled');
            $("#startBtn").removeClass('disabled');
        }
    });



})(jQuery);

/*------------------------------------
login form submit - login.html
--------------------------------------*/
















/*------------------------------------
visa application form dropdown - visa-application.html
--------------------------------------*/



