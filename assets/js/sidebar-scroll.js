(function () {
  function setupTallSidebar() {
    var sidebar = document.querySelector('#main .sidebar.sticky') ||
                  document.querySelector('#main .sidebar__left.sticky') ||
                  document.querySelector('#main .sidebar');
    if (!sidebar || window.innerWidth < 1025) return;

    function updateSidebarOffset() {
      var height = sidebar.getBoundingClientRect().height;
      var top = Math.min(16, window.innerHeight - height - 16);
      sidebar.style.setProperty('position', 'sticky', 'important');
      sidebar.style.setProperty('top', top + 'px', 'important');
      sidebar.style.setProperty('height', 'max-content', 'important');
      sidebar.style.setProperty('max-height', 'none', 'important');
      sidebar.style.setProperty('overflow', 'visible', 'important');
    }

    updateSidebarOffset();
    window.addEventListener('resize', updateSidebarOffset, { passive: true });
    if ('ResizeObserver' in window) {
      new ResizeObserver(updateSidebarOffset).observe(sidebar);
    }
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', setupTallSidebar, { once: true });
  } else {
    setupTallSidebar();
  }
})();
