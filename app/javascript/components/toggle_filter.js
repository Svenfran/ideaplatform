const toggleFilter = () => {
    const button = document.querySelector('.hide-button i');
    const div = document.querySelector('.hide-button');
    const sidebar = document.querySelector('.filter-sidebar');
    const content = document.querySelector('.cont');

    if (button) {
        button.addEventListener('click', () => {
            if (sidebar.classList.contains('inactive')) {
                sidebar.classList.remove('inactive');
                content.classList.remove('content');
                content.classList.add('content-index');
                div.innerHTML = '';
                div.classList.remove("arrow-inactive");
                console.log('IF I was clicked!')
                div.insertAdjacentHTML('beforeend', "<i class='fas fa-caret-square-left' style='font-size: 40px'></i>");
            } else {
                sidebar.classList.add('inactive');
                content.classList.add('content');
                content.classList.remove('content-index');
                div.innerHTML = '';
                div.classList.add("arrow-inactive");
                console.log('ELSE I was clicked!')
                div.insertAdjacentHTML('beforeend', "<i class='fas fa-caret-square-right' style='font-size: 40px'></i>");
            }
        });
    }
};

export { toggleFilter }
