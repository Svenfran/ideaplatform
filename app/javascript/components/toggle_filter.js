const toggleFilter = () => {
    const button = document.querySelector('.hide-filter-sidebar i');
    const arrow = document.querySelector('.hide-filter-sidebar');
    const sidebar = document.querySelector('.sidebar');

    button.addEventListener('click', () => {
        if (sidebar.classList.contains('hide')) {
            sidebar.classList.remove('hide');
            arrow.innerHTML = '';
            arrow.insertAdjacentHTML('beforeend', "<i class='fas fa-caret-square-left' style='font-size: 40px'></i>");
        } else {
            sidebar.classList.add('hide');
            arrow.innerHTML = '';
            arrow.insertAdjacentHTML('beforeend', "<i class='fas fa-caret-square-right' style='font-size: 40px'></i>");
        }
    });
}

export { toggleFilter }
