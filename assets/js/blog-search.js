(function () {
  'use strict';
  function normalizeQuery(str) {
    return str.trim().toLowerCase().replace(/\s+/g, ' ');
  }

  function snippetFromContent(post, query, snippetLength) {
    if (!post.content) {
      return post.excerpt || '';
    }

    var text = post.content;
    var qTerms = normalizeQuery(query).split(' ').filter(Boolean);
    var firstMatch = -1;
    var matchWord = '';

    qTerms.forEach(function (term) {
      var idx = text.toLowerCase().indexOf(term);
      if (idx >= 0 && (firstMatch < 0 || idx < firstMatch)) {
        firstMatch = idx;
        matchWord = term;
      }
    });

    if (firstMatch < 0) {
      return text.substr(0, snippetLength) + (text.length > snippetLength ? '…' : '');
    }

    var heading = '';
    var beforeMatch = text.slice(0, firstMatch);
    var headingMatches = beforeMatch.match(/(^|\n)#{1,6}\s*(.+?)(\n|$)/g);
    if (headingMatches && headingMatches.length) {
      heading = headingMatches[headingMatches.length - 1].replace(/(^|\n)#{1,6}\s*/, '').trim();
    }

    var start = Math.max(0, firstMatch - Math.floor(snippetLength / 2));
    var end = Math.min(text.length, start + snippetLength);
    var snippet = text.substring(start, end).trim();

    var highlight = (heading ? heading + ': ' : '') + snippet;
    if (matchWord) {
      var regex = new RegExp('(' + qTerms.join('|') + ')', 'gi');
      highlight = highlight.replace(regex, '<mark>$1</mark>');
    }

    return highlight + (end < text.length ? ' …' : '');
  }

  function renderSearchResults(results, indexData, query, maxResults) {
    var container = document.getElementById('blog-search-results');
    var noResults = document.getElementById('blog-search-no-results');
    var overlay = document.getElementById('blog-search-overlay');

    container.innerHTML = '';

    if (!results.length) {
      noResults.classList.remove('d-none');
      overlay.classList.remove('d-none');
      return;
    }

    noResults.classList.add('d-none');
    overlay.classList.remove('d-none');

    results.slice(0, maxResults).forEach(function (hit) {
      var item = indexData.find(function (p) {
        return p.url === hit.ref;
      });

      if (!item) {
        return;
      }

      var snippet = snippetFromContent(item, query, window.searchConfig.snippet_length || 180);

      var row = document.createElement('a');
      row.href = item.url;
      row.className = 'search-result-item';
      row.style.display = 'flex';
      row.style.flexDirection = 'column';
      row.style.gap = '6px';
      row.innerHTML =
        '<div style="display: flex; justify-content: space-between; align-items: flex-start;">' +
          '<div class="search-result-left">' +
            '<div class="fw-bold">' + item.title + '</div>' +
            '<div class="text-muted">' + (item.author || '') + ' ' + (item.date ? '- ' + item.date : '') + '</div>' +
          '</div>' +
        '</div>' +
        '<div class="search-result-snippet">' + snippet + '</div>';

      row.addEventListener('click', function() {
        overlay.classList.add('d-none');
      });

      container.appendChild(row);
    });
  }

  if (document.getElementById('blog-search-input')) {
    window.searchConfig = window.searchConfig || {};

    if (window.site && window.site.search) {
      window.searchConfig = Object.assign({}, window.site.search, window.searchConfig);
    }

    var lang = (document.documentElement.lang || (window.site && window.site.lang) || 'de').toLowerCase();
    var localePrefix = window.searchConfig.baseurl || '';

    function localizePath(p) {
      if (!p || typeof p !== 'string') return p;
      if (p.match(/^https?:\/\//)) return p;
      if (p.charAt(0) === '/') {
        return p;
      }
      return (localePrefix + '/' + p).replace(/\/\/+/, '/');
    }

    var indexUrl = localizePath(window.searchConfig.fallback_json || 'search.json');
    if (lang === 'en' && window.searchConfig.en_json) {
      indexUrl = localizePath(window.searchConfig.en_json);
    } else if (lang === 'de' && window.searchConfig.de_json) {
      indexUrl = localizePath(window.searchConfig.de_json);
    }

    function initializeIndex(data) {
      window.searchIndexData = (data || []);

      var pageIndex = lunr(function () {
        this.ref('url');
        this.field('title', { boost: window.searchConfig.field_weights.title || 10 });
        this.field('author', { boost: window.searchConfig.field_weights.author || 5 });
        this.field('tags', { boost: window.searchConfig.field_weights.tags || 5 });
        this.field('content', { boost: window.searchConfig.field_weights.content || 1 });

        window.searchIndexData.forEach(function (doc) {
          if (!window.searchConfig.use_language_index || !doc.lang || doc.lang === lang) {
            this.add(doc);
          }
        }, this);
      });

      var searchInput = document.getElementById('blog-search-input');
      var clearBtn = document.getElementById('blog-search-clear');
      var rh = null;

      // Ensure overlay is hidden on page load
      document.getElementById('blog-search-overlay').classList.add('d-none');

      function updateClearBtn() {
        if (searchInput.value.length > 0) {
          clearBtn.classList.remove('d-none');
        } else {
          clearBtn.classList.add('d-none');
        }
      }

      clearBtn.addEventListener('click', function (e) {
        e.preventDefault();
        searchInput.value = '';
        updateClearBtn();
        document.getElementById('blog-search-overlay').classList.add('d-none');
        searchInput.focus();
      });

      searchInput.addEventListener('input', function (e) {
        updateClearBtn();

        if (rh) {
          clearTimeout(rh);
        }

        rh = setTimeout(function () {
          var query = normalizeQuery(e.target.value);
          var minLen = window.searchConfig.min_query_length || 3;

          if (query.length < minLen) {
            document.getElementById('blog-search-overlay').classList.add('d-none');
            return;
          }

          var tokens = query.split(' ').filter(Boolean);
          if (!tokens.length) {
            document.getElementById('blog-search-overlay').classList.add('d-none');
            return;
          }

          var searchTerms = tokens.map(function (t) {
            var escaped = t.replace(/[\^~:\/\?\*\+\-\(\)\{\}\[\]\"\']/g, '\\$&');
            return escaped + '*';
          });

          var results;
          try {
            results = pageIndex.search(searchTerms.join(' '));
          } catch (err) {
            results = [];
          }

          renderSearchResults(results, window.searchIndexData, query, window.searchConfig.max_results || 20);
        }, 220);
      });

      searchInput.addEventListener('focus', function (e) {
        var query = normalizeQuery(searchInput.value);
        var minLen = window.searchConfig.min_query_length || 3;

        if (query.length >= minLen) {
          var tokens = query.split(' ').filter(Boolean);
          if (tokens.length > 0) {
            var searchTerms = tokens.map(function (t) {
              var escaped = t.replace(/[\^~:\/\?\*\+\-\(\)\{\}\[\]\"\']/g, '\\$&');
              return escaped + '*';
            });

            var results;
            try {
              results = pageIndex.search(searchTerms.join(' '));
            } catch (err) {
              results = [];
            }

            renderSearchResults(results, window.searchIndexData, query, window.searchConfig.max_results || 20);
          }
        }
      });

      document.addEventListener('click', function (event) {
        var overlay = document.getElementById('blog-search-overlay');
        var target = event.target;
        if (!document.getElementById('blog-search-wrapper').contains(target)) {
          overlay.classList.add('d-none');
        }
      });
    }

    function loadIndex(url, fallbackUrl) {
      fetch(url)
        .then(function (response) {
          if (!response.ok) {
            throw new Error('Search index not available: ' + url);
          }
          return response.json();
        })
        .then(function (data) {
          if ((!data || data.length === 0) && fallbackUrl) {
            return loadIndex(fallbackUrl, null);
          }
          initializeIndex(data || []);
        })
        .catch(function (err) {
          console.warn('Search index fetch failed (trying fallback):', err);
          if (fallbackUrl) {
            loadIndex(fallbackUrl, null);
          } else {
            console.error('Search initialization failed:', err);
          }
        });
    }

    loadIndex(indexUrl, window.searchConfig.fallback_json && indexUrl !== window.searchConfig.fallback_json ? localizePath(window.searchConfig.fallback_json) : null);
  }

})();
