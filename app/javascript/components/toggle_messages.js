const toggleMessage = () => {
    const arrows = Array.from(document.querySelectorAll('#show-hide-arrow'));
    const messages = Array.from(document.querySelectorAll('#message'));
    
    arrows.forEach((arrow, i) => {
        messages.forEach((message) => {
            arrow.addEventListener('click', () => {
                if (arrows.indexOf(arrow) === messages.indexOf(message)) {
                    if (message.classList.contains('message-hide')) {
                        message.classList.remove('message-hide')
                        document.querySelectorAll('#show-hide-arrow')[i].children.item(0).classList.remove('hide')
                        document.querySelectorAll('#show-hide-arrow')[i].children.item(1).classList.add('hide')
                        message.style.transition = "all 2s ease-in-out";
                    } else {
                        message.classList.add('message-hide')
                        document.querySelectorAll('#show-hide-arrow')[i].children.item(0).classList.add('hide')
                        document.querySelectorAll('#show-hide-arrow')[i].children.item(1).classList.remove('hide')
                        message.style.transition = "all 2s ease-in-out";
                    }
                }
            })
        })
    })
}

export { toggleMessage }