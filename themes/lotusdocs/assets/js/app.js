// Menu sticky
function windowScroll() {
    const navbar = document.getElementById("topnav");
    if(navbar!=null){
        if (
            document.body.scrollTop >= 50 ||
            document.documentElement.scrollTop >= 50
        ) {
            navbar.classList.add("nav-sticky");
        } else {
            navbar.classList.remove("nav-sticky");
        }
    }
}

window.addEventListener('scroll', (ev) => {
    ev.preventDefault();
    windowScroll();
})

// Toggle menu
document.addEventListener("DOMContentLoaded", function() {
    function toggleMenu() {
        var menu = document.getElementById('navigation');
        var toggleButton = document.getElementById('isToggle');

        if (!menu) {
            console.error('Menu element not found');
            return;
        }

        toggleButton.classList.toggle('open');
        menu.classList.toggle('show');

        if (menu.classList.contains('show')) {
            menu.style.display = 'block';
        } else {
            menu.style.display = 'none';
        }
    }

    document.getElementById('isToggle').addEventListener('click', toggleMenu);
});


