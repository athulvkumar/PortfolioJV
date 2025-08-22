// Responsive menu toggle
const menuToggle = document.getElementById('menuToggle');
const navLinks = document.getElementById('navLinks');

if (menuToggle && navLinks) {
    menuToggle.addEventListener('click', () => {
        navLinks.classList.toggle('open');
    });
}

// Smooth scroll for navigation links
const links = document.querySelectorAll('.nav-links a');
links.forEach(link => {
    link.addEventListener('click', function (e) {
        const targetId = this.getAttribute('href').slice(1);
        const targetSection = document.getElementById(targetId);
        if (targetSection) {
            e.preventDefault();
            // Get navbar height for offset
            const navbar = document.querySelector('.navbar');
            const navbarStyles = window.getComputedStyle(navbar);
            const marginTop = parseInt(navbarStyles.marginTop) || 0;
            const navbarHeight = (navbar ? navbar.offsetHeight : 0) + marginTop;
            const sectionTop = targetSection.getBoundingClientRect().top + window.pageYOffset - navbarHeight;
            window.scrollTo({
                top: sectionTop,
                behavior: 'smooth'
            });
            // Close mobile menu if open
            if (navLinks.classList.contains('open')) {
                navLinks.classList.remove('open');
            }
        }
    });
});

// Section fade-in animation
const sections = document.querySelectorAll('.section');
const observer = new window.IntersectionObserver((entries, obs) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('visible');
            obs.unobserve(entry.target);
        }
    });
}, { threshold: 0.2 });
sections.forEach(section => observer.observe(section));

// Animate skill bars
const skillBars = document.querySelectorAll('.skill-bar-fill');
const skillsSection = document.getElementById('skills');
let skillsAnimated = false;
if (skillsSection) {
    const skillsObs = new window.IntersectionObserver((entries) => {
        if (entries[0].isIntersecting && !skillsAnimated) {
            skillBars.forEach(bar => {
                const width = bar.getAttribute('data-width');
                bar.style.width = width;
            });
            skillsAnimated = true;
            skillsObs.disconnect();
        }
    }, { threshold: 0.3 });
    skillsObs.observe(skillsSection);
}

// About section mouse-follow gradient effect
const aboutContainer = document.querySelector('.about-container-v2');
if (aboutContainer) {
    aboutContainer.addEventListener('mousemove', (e) => {
        const rect = aboutContainer.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;
        aboutContainer.style.setProperty('--mouse-x', `${x}px`);
        aboutContainer.style.setProperty('--mouse-y', `${y}px`);
        aboutContainer.classList.add('hover-gradient');
    });
    aboutContainer.addEventListener('mouseleave', () => {
        aboutContainer.classList.remove('hover-gradient');
    });
}

// Navbar hide on scroll, show when stopped or scrolling up
let lastScrollY = window.scrollY;
let scrollTimeout;
const navbar = document.querySelector('.navbar');

function showNavbar() {
    if (navbar) navbar.classList.remove('navbar-hidden');
}
function hideNavbar() {
    if (navbar) navbar.classList.add('navbar-hidden');
}

window.addEventListener('scroll', () => {
    if (!navbar) return;
    const currentScrollY = window.scrollY;
    if (currentScrollY > lastScrollY && currentScrollY > 50) {
        // Scrolling down
        hideNavbar();
    } else {
        // Scrolling up
        showNavbar();
    }
    lastScrollY = currentScrollY;
    // Show navbar when scrolling stops
    clearTimeout(scrollTimeout);
    scrollTimeout = setTimeout(() => {
        showNavbar();
    }, 200);
});

document.addEventListener("DOMContentLoaded", () => {
    const alertBox = document.querySelector(".alert");
    if (alertBox) {
        setTimeout(() => alertBox.classList.add("show"), 100);
        setTimeout(() => {
            alertBox.classList.remove("show");
            setTimeout(() => alertBox.remove(), 300);
        }, 6000); // 8 seconds
    }
});


