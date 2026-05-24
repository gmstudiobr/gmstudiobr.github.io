/* GM Studio — CRM Tracker
 * Configure SB_URL e SB_KEY com os dados do seu projeto Supabase.
 * Este arquivo é referenciado por todas as páginas do site.
 */
(function () {
  var SB_URL = 'https://SEU-PROJETO.supabase.co';   // ← substitua pelo seu Project URL
  var SB_KEY = 'SUA-ANON-KEY';                       // ← substitua pelo seu anon/public key

  if (!SB_URL || SB_URL.indexOf('SEU-PROJETO') !== -1) return; // não rastreia com placeholder

  var PAGE = location.pathname.replace(/\/+$/, '').split('/').pop() || 'home';

  var SID = (function () {
    try {
      var s = sessionStorage.getItem('gm_sid');
      if (!s) { s = Math.random().toString(36).slice(2); sessionStorage.setItem('gm_sid', s); }
      return s;
    } catch(e) { return 'nosession'; }
  })();

  function track(type, element) {
    try {
      fetch(SB_URL + '/rest/v1/events', {
        method: 'POST',
        headers: {
          'apikey': SB_KEY,
          'Authorization': 'Bearer ' + SB_KEY,
          'Content-Type': 'application/json',
          'Prefer': 'return=minimal'
        },
        body: JSON.stringify({
          page:       PAGE,
          event_type: type,
          element:    element || null,
          referrer:   document.referrer,
          screen:     screen.width + 'x' + screen.height,
          user_agent: navigator.userAgent.slice(0, 200),
          session_id: SID
        })
      });
    } catch(e) {}
  }

  // Pageview
  track('pageview');

  // Cliques em links, botões e elementos rastreáveis
  document.addEventListener('click', function (e) {
    var t = e.target && e.target.closest && e.target.closest('a,button,[data-track]');
    if (t) track('click', t.getAttribute('data-track') || t.textContent.trim().slice(0, 60) || t.tagName);
  });

  // Profundidade de scroll (50% e 90%)
  document.addEventListener('scroll', function () {
    var pct = Math.round((window.scrollY / (document.body.scrollHeight - window.innerHeight)) * 100);
    if (pct >= 50 && !window._gm50) { window._gm50 = 1; track('scroll', '50%'); }
    if (pct >= 90 && !window._gm90) { window._gm90 = 1; track('scroll', '90%'); }
  }, { passive: true });
})();
