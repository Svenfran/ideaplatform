const keepCheckedState = () => {
    // saving Data
    const categories = document.querySelectorAll('#filter_');
    categories.forEach((category, index) => {
        category.addEventListener('click', () => {

            if (category.checked) {
                category.parentElement.classList.add('cb-checked');
            } else {
                category.parentElement.classList.remove('cb-checked');
            }

            localStorage.setItem(index, category.checked)
        })
    })

    // loading Data
    categories.forEach((category, index) => {
        let checked = JSON.parse(localStorage.getItem(index));
        category.checked = checked;

        if (category.checked) {
            category.parentElement.classList.add('cb-checked');
        } else {
            category.parentElement.classList.remove('cb-checked');
        }
        
    })
}

const clearLocalStorage = () => {
    const clearFilter = document.querySelector('.clear-filter');
    clearFilter.addEventListener('click', () => {
        localStorage.clear();
    })
}

export { keepCheckedState }
export { clearLocalStorage }