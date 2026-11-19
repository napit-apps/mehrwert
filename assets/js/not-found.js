(async () => {
  const englishPage = document.currentScript.dataset.englishPage;
  const englishPrefix = englishPage.slice(0, -'404.html'.length);
  if (!window.location.pathname.startsWith(englishPrefix)) return;

  try {
    const response = await fetch(englishPage);
    if (!response.ok) return;

    const english = new DOMParser().parseFromString(await response.text(), 'text/html');
    const notice = english.querySelector('[data-not-found]');
    if (english.documentElement.lang !== 'en' || !notice) return;

    notice.lang = 'en';
    document.querySelector('[data-not-found]').replaceWith(notice);
    document.title = english.title.trim();
  } catch {
    // If the translation cannot load, keep the original 404 message.
  }
})();
