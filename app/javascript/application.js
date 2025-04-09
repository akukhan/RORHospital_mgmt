// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "chartkick"
import "Chart.bundle"

document.addEventListener('DOMContentLoaded', function() {
    // Check for saved user preference
    const currentTheme = localStorage.getItem('theme') || 'light';
    
    // Apply the saved theme on page load
    document.documentElement.setAttribute('data-theme', currentTheme);
    
    // Update toggle button state based on current theme
    const toggleButton = document.getElementById('darkModeToggle');
    if (toggleButton) {
      toggleButton.checked = currentTheme === 'dark';
    }
    
    // Set up event listener for the toggle
    toggleButton?.addEventListener('change', function() {
      const theme = this.checked ? 'dark' : 'light';
      document.documentElement.setAttribute('data-theme', theme);
      localStorage.setItem('theme', theme);
    });
  });