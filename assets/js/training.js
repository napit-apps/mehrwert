(function ($) {
  'use strict';
  // testimonial slider 2
  $('.testimonial-wrap').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    infinite: true,
    dots: false,
    nextArrow: '<button class="slide-arrow prev-arrow"><i class="ti-arrow-right"></i></button>',
    prevArrow: '<button class="slide-arrow next-arrow"><i class="ti-arrow-left"></i></button>',
    autoplay: true,
    autoplaySpeed: 6000
  });


  $(document).ready(function () {
    $('.faq-question').click(function () {
      // This assumes the answer is the immediately following row
      var answer = $(this).next('.faq-answer');
      answer.slideToggle(0, function() {
        answer.toggleClass('open');
      });
      $(this).toggleClass('open');
    });
  });

})(jQuery);
