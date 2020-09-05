 //<!--counter-->

 //       $(document).ready(function () {
 //           $('.counts').each(function () {
 //               $(this).prop('Counter', 0).animate({
 //                   Counter: $(this).text()
 //               }, {
 //                   duration: 2500,
 //                   easing: 'swing',
 //                   step: function (now) {
 //                       $(this).text(Math.ceil(now));
 //                   }
 //               });
 //           });
 //       });
 //       <!--menu aç kapa -->

 //       $(document).ready(function () {
 //           $('.tablokapa ').click(function () {
 //               $('.pp').slideUp('medium');
 //           });
 //           $('.tabloac ').click(function () {
 //               $('.pp').slideDown('medium');
 //           });
 //       });


        //<!--tabs-->
        function openCity(evt, cityName) {
            var i, x, tablinks;
            x = document.getElementsByClassName("city");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablink");
            for (i = 0; i < x.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" w3-border-white", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.firstElementChild.className += " w3-border-white";
        }
 //       <!--banner renk ayar-->

 //       $(document).ready(function () {
 //           $("input[name=color]").on("change", function () {
 //               var color = $(this).val();
 //               $(".bannerbir").css("background-color", color);
 //           });
 //       });
 //       $(document).ready(function () {
 //           $("input[name=color]").on("change", function () {
 //               var color = $(this).val();
 //               $(".pp").css("border-color", color);
 //           });
 //       });

 //       $(document).ready(function () {
 //           $("input[name=color]").on("change", function () {
 //               var color = $(this).val();
 //               $(".row .pp img").css("border-color", color);
 //           });
 //       });
 //       <!--banner renk ayar--->
 //       <!--tooltip-->

 //       $(document).ready(function () {
 //           $('[data-toggle="tooltip"]').tooltip();
 //       });

 //       <!--tooltipbitis-->
        