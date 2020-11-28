const scrollToTop = () => {
    const topArrow = document.querySelector(".arrow-top");
    window.onscroll = () => { 
        if (document.documentElement.scrollTop >= 250 ) {
        topArrow.style.display = "block";
        topArrow.style.transition = "all 25s";
    } 
      else {
        topArrow.style.display = "none";
      }
    };
}

const clickArrow = () => {
    const topArrow = document.querySelector(".arrow-top");
    topArrow.onclick = (event) => {
        event.preventDefault();
        window.scrollTo(0,10);
    }
}

export { scrollToTop }
export { clickArrow }
