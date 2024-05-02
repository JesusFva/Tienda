document.addEventListener('DOMContentLoaded', function () {
    var carousel = document.getElementById('carousel');
    var slides = carousel.getElementsByClassName('carousel-item');
    var currentSlide = 0;

    function showSlide(n) {
        slides[currentSlide].classList.remove('is-active');
        currentSlide = (n + slides.length) % slides.length;
        slides[currentSlide].classList.add('is-active');
    }

    function nextSlide() {
        showSlide(currentSlide + 1);
    }

    var slideInterval = setInterval(nextSlide, 3000); // Cambia la imagen cada 3 segundos

    // Pausar el carrusel cuando el mouse está sobre él
    carousel.addEventListener('mouseenter', function () {
        clearInterval(slideInterval);
    });

    // Reanudar el carrusel cuando el mouse sale de él
    carousel.addEventListener('mouseleave', function () {
        slideInterval = setInterval(nextSlide, 3000);
    });
});