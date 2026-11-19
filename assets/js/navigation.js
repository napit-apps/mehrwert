(function () {
  'use strict';

  const header = document.querySelector('.mw-header');
  if (!header) return;

  const groups = Array.from(header.querySelectorAll('.mw-menu details'));
  const mobileMenu = header.querySelector('.mw-mobile-nav');
  const desktopHover = window.matchMedia('(min-width: 1101px) and (hover: hover) and (pointer: fine)');

  function closeOthers(current) {
    groups.forEach(function (group) {
    group.querySelector('summary').addEventListener('click', function (event) {
      // A mouse click must not immediately undo the preceding hover opening.
      // Keyboard activation (detail === 0) and touch keep native toggling.
      if (!desktopHover.matches || event.detail === 0 || event.pointerType === 'touch') return;
      event.preventDefault();
      closeOthers(group);
      group.open = true;
    });

      if (group !== current) group.open = false;
    });
  }

  function closeAll() {
    closeOthers(null);
    if (mobileMenu) mobileMenu.open = false;
  }

  groups.forEach(function (group) {
    group.addEventListener('toggle', function () {
      if (group.open) closeOthers(group);
    });

    group.addEventListener('pointerenter', function (event) {
      if (event.pointerType !== 'mouse' || !desktopHover.matches) return;
      closeOthers(group);
      group.open = true;
    });

    group.addEventListener('pointerleave', function (event) {
      if (event.pointerType !== 'mouse' || !desktopHover.matches) return;
      // Keep a keyboard user's focused link reachable until focus leaves.
      if (!group.contains(document.activeElement)) group.open = false;
    });

    group.addEventListener('focusout', function (event) {
      // Mobile submenus take up space: close siblings only after activation,
      // so focus changes cannot move a tapped summary before its click.
      if (group.closest('.mw-desktop-nav') && !group.contains(event.relatedTarget)) {
        group.open = false;
      }
    });
  });

  header.addEventListener('click', function (event) {
    if (event.target.closest('a')) closeAll();
  });

  header.addEventListener('keydown', function (event) {
    if (event.key !== 'Escape') return;
    const group = event.target.closest('details[open]');
    if (!group) return;
    event.preventDefault();
    group.open = false;
    group.querySelector('summary').focus();
  });

  document.addEventListener('click', function (event) {
    if (!header.contains(event.target)) closeAll();
  });

  // Also clear open state after a responsive layout change or history restore.
  desktopHover.addEventListener('change', closeAll);
  window.addEventListener('pageshow', closeAll);
})();
