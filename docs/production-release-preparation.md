# Vorbereitung des ersten produktiven Releases

Stand: 17. November 2026 · ausschließlich `fb_update-2027`.

## A — Portfolio

`portfolio: true` kennzeichnet die bestehende Übersicht und genau die 16 über
`pages.portfolio.grid_entries` ausgewählten Detailseiten. Der gemeinsame Head
setzt für diese Seiten in DE/EN `noindex, nofollow`, unabhängig vom Testschalter.
Alle 34 Seiten sind mit `sitemap: false` aus den Sitemaps ausgeschlossen.
Andere produktive Seiten erhalten keine neue Indexierungssperre. Die zwei
zusätzlichen Bestandsrouten NOE und Mobile-Software-Projekte bleiben unverändert.

`robots.txt` leitet die geschützten Routen aus denselben Seitenkennzeichnungen
ab. GPTBot, OAI-SearchBot, ClaudeBot und Claude-SearchBot werden gezielt von diesen
HTML-Routen und ihren vorhandenen endungslosen Varianten ausgeschlossen.
Kein pauschales `/projects`-Präfix und keine Googlebot-/Wildcard-Sperre:
Google kann das `noindex` weiterhin lesen. Die gesamte Testversion bleibt
`noindex, nofollow`, einschließlich Redirect- und Fehlerseiten.

**Kein technischer Zugriffsschutz:** Die Seiten und Bilder bleiben öffentlich
abrufbar. robots.txt ist eine freiwillig zu beachtende Crawler-Regel; noindex
begrenzt die Indexierung kooperierender Suchdienste, nicht den Zugriff und nicht
bereits angelegte Kopien. Nutzerinitiierte Agenten und andere Crawler können
abweichend reagieren. Vertrauliche Informationen benötigen Zugriffskontrolle.
Beim GitHub-Pages-Projekthosting wird robots.txt am Host-Root ausgewertet;
eine Datei unter `/mw-testpage/robots.txt` ersetzt keine Root-Regel. Die
Testversion schützt ihre Indexierung deshalb auf jeder HTML-Seite per Meta-Tag.

Quellen: [OpenAI-Crawler](https://developers.openai.com/api/docs/bots),
[Anthropic-Crawler](https://support.claude.com/en/articles/8896518-does-anthropic-crawl-data-from-the-web-and-how-can-site-owners-block-the-crawler).

## B/C/F — Darstellung

Der globale Arbeitsfassungs-Banner einschließlich DE-/EN-Schlüssel und CSS
ist entfernt. Die Navigation verwendet das unveränderte Original `logo.png`
mit ausgeschriebenem MEHR.WERT: 205 × 42 Pixel auf Desktop, proportional
164 Pixel breit auf Mobile. Footer und weitere Bilder bleiben unverändert.

Der Startseiten-Hero erhält auf Desktop 98/104 statt 74/80 Pixel vertikalen
Innenabstand. Mobile behält 44/48 Pixel. Texte, Verlauf, Zentrierung und CTA
bleiben unverändert; die Komponente gilt weiterhin gemeinsam für DE und EN.

## D — IT-Strategie und Hosting

Neue Routen: `/services/it-strategy-modernisation.html` und
`/en/services/it-strategy-modernisation.html`. Alle aktiven internen Verweise,
Canonical-/hreflang-Links und die Sitemaps sind umgestellt. Historische
Veröffentlichungsnachweise behalten ihre damals geprüften Quell-URLs.

Die beiden alten `fractional-cto.html`-Routen liefern eine statische
Weiterleitungsseite mit sofortigem Meta-Refresh, JavaScript `location.replace`
zum Erhalt von Query-Parametern und Ankern sowie einem normalen Ziellink.
Canonical und Sprachwechsel zeigen bereits auf die neuen Routen; alte Routen
stehen nicht in der Sitemap.

**Kein HTTP-301/308:** Das bestehende Hosting liefert die Weiterleitungsdatei
mit HTTP 200. Die öffentliche Homepage wurde read-only geprüft: `Server:
GitHub.com`. Der vorhandene Veröffentlichungsprozess liefert statische
Artefakte aus; es ist keine konfigurierbare Server-Redirect-Schicht vorhanden.
Ein echter permanenter HTTP-Redirect erfordert eine entsprechende Hosting-/
Proxy-Konfiguration außerhalb dieses Auftrags.

Der mehrsprachige Build verwendete bisher denselben Jekyll-URL-Cache für DE
und EN. Der Cache wird nun vor jedem Sprach-Rendern zurückgesetzt. Damit
enthält die englische Sitemap englische URLs. Als direkte Folge zeigen auch
die beiden bestehenden relativen Links auf der englischen Über-Seite korrekt
auf das englische Portfolio und den englischen Green-Agile-Artikel. Ihre
Beschriftungen und alle weiteren Seiteninhalte bleiben unverändert.

## E — Fehlerseite

`404.html` verwendet eine gemeinsame Liquid-Struktur und die Texte aus
`pages.error.not_found` in DE/EN. Die deutsche Fassung entspricht dem Auftrag;
die neue englische Fassung ist in `translation_review.yml` als ungeprüft markiert.
Die Datei enthält einen lokalisierten Startseitenlink und keine Soft-404-
Weiterleitung zur Startseite.

GitHub Pages verwendet für unbekannte URLs die Root-Datei `/404.html` mit
HTTP 404, auch bei einer unbekannten englischen URL. Die englische Fassung
ist unter `/en/404.html` und über den Sprachwechsel erreichbar. Es wird kein
serverseitiges sprachabhängiges Fehlerseiten-Routing behauptet.

[GitHub-Dokumentation zur benutzerdefinierten 404-Seite](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-custom-404-page-for-your-github-pages-site).

## Prüfung und offene Freigaben

- Produktions- und Test-Build: je 159 HTML-Seiten, Links, Canonicals,
  Sitemaps, robots.txt, Datei-Ausschlüsse und Credential-Signaturen geprüft.
- `bundle exec ruby _scripts/test-i18n-contract.rb`: 11 Prüfungen erfolgreich.
- 155 bestehende Seiten auf unveränderten Hauptinhalt geprüft; ausschließlich
  neue IT-Strategie-Links und die beiden oben dokumentierten EN-Linkkorrekturen.
  Die zwei 404-Fassungen sind die ausdrücklich beauftragte Textänderung.
- Zusätzlich 156 DE-/EN-Ansichten inklusive bestehender Filter, Suche,
  Karussells und Kontaktkarte ohne Prüffehler.
- Desktop/Mobile: neue URL, Sprachwechsel, Original-Logo, Hero, Redirect mit
  Query/Anker und echte 404-Antworten bei 1440/1024/390/320 Pixeln geprüft.
- README und die nicht benötigte Ruby-Konfigurationsdatei eines gebündelten
  Plugins werden zusätzlich in beiden Builds ausgeschlossen. Kein `docs`,
  keine Quelldateien, privaten Unterlagen oder erkannten Secrets im Build.

Vor Go-live offen:
1. Die bestehende zusätzliche NOE-Detailseite in DE/EN enthält Lorem ipsum.
   Sie gehört nicht zu den 16 ausgewählten Cases und wurde nicht verändert.
2. Die englischen Redaktionsfreigaben bleiben offen, einschließlich der neuen
   404-Fassung. Entfernen des Banners ist keine redaktionelle Freigabe.
3. Der bisherige `deploy.sh`-Ablauf entfernt generierte Tag-Archive und ersetzt
   den Veröffentlichungsbaum nicht vollständig. Im vorhandenen Stand von
   `origin/deployment` liegen noch `_i18n`-Quelldateien. Vor Veröffentlichung
   einen sauberen Artefakt-Transfer ohne Altdateien sicherstellen und anschließend
   Redirect-/404-/robots-/Sitemap-Verhalten auf dem Zielhost prüfen.

Kein Merge, Push, Deployment, Export oder Manifest-Update durchgeführt.
