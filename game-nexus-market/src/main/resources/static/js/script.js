
    
document.addEventListener('DOMContentLoaded', function () {
    // Function to toggle menu visibility
    function toggleMenu() {
        var dropdown = document.getElementById('mobile-menu');
        dropdown.classList.toggle('hidden');
    }

    // Attach event listener to mobile menu button
    document.getElementById('mobile-menu-button').addEventListener('click', toggleMenu);

    // Attach the same event listener to the h2 tag
    document.getElementById('mobile-menu-trigger').addEventListener('click', toggleMenu);
});