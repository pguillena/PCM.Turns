$('#pagination-demo').twbsPagination({
    totalPages: 5,
    startPage: 1,
    visiblePages: 5,
    initiateStartPageClick: true,
    href: false,
    hrefVariable: '{{number}}',
    first: 'First',
    prev: 'Previous',
    next: 'Next',
    last: 'Last',
    loop: false,

    onPageClick: function (event, page) {
        $('.page-active').removeClass('page-active');
        $('#page' + page).addClass('page-active');
    },

    // pagination Classes
    paginationClass: 'pagination',
    nextClass: 'next',
    prevClass: 'prev',
    lastClass: 'last',
    firstClass: 'first',
    pageClass: 'page',
    activeClass: 'active',
    disabledClass: 'disabled'

});