const toggleFilter = () => {
    const arrowLeft = document.querySelector('.fa-caret-square-left');
    const arrowRight = document.querySelector('.fa-caret-square-right');
    const button = document.querySelector('.hide-button');
    const sidebar = document.querySelector('.filter-sidebar');
    const content = document.querySelector('.cont');
    
    button.addEventListener('click', (event) => {
        if (sidebar.classList.contains('inactive')) {
            sidebar.classList.remove('inactive');
            content.classList.remove('content');
            content.classList.add('content-index');
            button.classList.remove("arrow-inactive");
            arrowRight.classList.add('hide');
            arrowLeft.classList.remove('hide');
        } else {
            sidebar.classList.add('inactive');
            content.classList.add('content');
            content.classList.remove('content-index');
            button.classList.add("arrow-inactive");
            arrowRight.classList.remove('hide');
            arrowLeft.classList.add('hide');
        }
    });
    
};

const changeClass = () => {
    const content = document.querySelector('.cont');
    const card = document.querySelector('.card-body');
    if (!card) {
        content.classList.remove('content-index');
        content.classList.add('content');
    }
}

export { toggleFilter }
export { changeClass }
