const currentPage = window.location.href;

let navLinks = document.getElementsByClassName("nav-link");

for (let link of navLinks) {
    if (currentPage.includes(link.getAttribute("href"))) {
        link.classList.add("active");
    } else {
        link.classList.remove("active");
    }
}

