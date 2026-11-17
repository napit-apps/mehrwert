// Preserve incoming query parameters and anchors on the static hosting redirect.
(() => {
  const target = document.querySelector('[data-redirect]');
  if (target) window.location.replace(target.href + window.location.search + window.location.hash);
})();
