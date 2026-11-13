
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CodeVest · I Build Investment Websites & Apps</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&family=Space+Grotesk:wght@500;600;700&family=Anton&display=swap" rel="stylesheet">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    :root {
      --bg: #020204; --surface: #07070c; --border: #14141d;
      --text: #fff; --muted: #65657a;
      --red: #ff1a1a; --red-glow: rgba(255,26,26,0.7);
      --green: #00ff88;
      --tg: #229ED9; --tg-glow: rgba(34,158,217,0.85);
    }
    body {
      background: var(--bg); color: var(--text);
      font-family: 'Inter', system-ui, sans-serif;
      min-height: 100vh; display: flex;
      align-items: center; justify-content: center;
      padding: 1rem; position: relative; overflow: hidden;
    }

    /* background */
    .conic-bg {
      position: fixed; top: 50%; left: 50%;
      width: 200vmax; height: 200vmax;
      transform: translate(-50%, -50%);
      background: conic-gradient(from 0deg,
        transparent 0deg, rgba(255,26,26,0.07) 30deg,
        transparent 60deg, transparent 120deg,
        rgba(34,158,217,0.07) 150deg, transparent 180deg,
        transparent 240deg, rgba(0,255,136,0.05) 270deg,
        transparent 300deg);
      z-index: 0; animation: spin 22s linear infinite; filter: blur(60px);
    }
    @keyframes spin { to { transform: translate(-50%,-50%) rotate(360deg); } }

    .noise {
      position: fixed; inset: -50%; z-index: 200; pointer-events: none;
      opacity: 0.05;
      background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 300 300' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E");
      animation: grain 0.4s steps(3) infinite;
    }
    @keyframes grain {
      0%,100% { transform: translate(0,0); }
      33% { transform: translate(-4px,4px); }
      66% { transform: translate(4px,-4px); }
    }
    .scanlines {
      position: fixed; inset: 0; z-index: 198; pointer-events: none;
      background: repeating-linear-gradient(0deg, transparent 0, transparent 2px, rgba(0,0,0,0.18) 2px, rgba(0,0,0,0.18) 4px);
      opacity: 0.4;
    }
    .strobe-c {
      position: fixed; top: 50%; left: 50%;
      width: 900px; height: 900px;
      transform: translate(-50%,-50%);
      background: radial-gradient(circle, rgba(255,26,26,0.18), transparent 60%);
      filter: blur(70px); z-index: 0;
      animation: strobe 2.2s ease-in-out infinite;
    }
    @keyframes strobe {
      0%,100% { opacity: 0.25; transform: translate(-50%,-50%) scale(0.9); }
      50% { opacity: 1; transform: translate(-50%,-50%) scale(1.2); }
    }
    .strobe-tl, .strobe-br {
      position: fixed; width: 700px; height: 700px;
      filter: blur(90px); z-index: 0;
      animation: cornerPulse 2.8s ease-in-out infinite;
    }
    .strobe-tl { top: -300px; left: -300px; background: radial-gradient(circle, rgba(255,26,26,0.15), transparent 70%); }
    .strobe-br { bottom: -300px; right: -300px; background: radial-gradient(circle, rgba(34,158,217,0.15), transparent 70%); animation-direction: reverse; }
    @keyframes cornerPulse {
      0%,100% { opacity: 0.3; }
      50% { opacity: 1; }
    }

    .glitch-bar {
      position: fixed; left: 0; width: 100%; height: 3px;
      background: linear-gradient(90deg, transparent, var(--red), transparent);
      z-index: 150; pointer-events: none; opacity: 0;
      animation: bar 7s linear infinite;
    }
    .glitch-bar:nth-child(1) { top: 15%; animation-delay: 0s; }
    .glitch-bar:nth-child(2) { top: 35%; animation-delay: 2s; background: linear-gradient(90deg, transparent, var(--tg), transparent); }
    .glitch-bar:nth-child(3) { top: 55%; animation-delay: 4s; }
    .glitch-bar:nth-child(4) { top: 75%; animation-delay: 1s; background: linear-gradient(90deg, transparent, var(--green), transparent); }
    @keyframes bar {
      0% { opacity: 0; transform: translateX(-100%); }
      5% { opacity: 1; transform: translateX(0); }
      15% { opacity: 0; transform: translateX(100%); }
      100% { opacity: 0; transform: translateX(100%); }
    }

    /* card */
    .ad-card {
      position: relative; z-index: 10;
      max-width: 640px; width: 100%;
      background: var(--surface);
      border: 2px solid var(--border);
      border-radius: 3px;
      padding: 2.8rem 2.3rem 2.4rem;
      text-align: center;
      box-shadow: 0 0 0 1px rgba(255,26,26,0.15), 0 0 90px -15px rgba(255,26,26,0.4), 0 50px 120px -20px rgba(0,0,0,0.95);
      animation: slam 0.7s cubic-bezier(0.16,1,0.3,1) both, shake 8s 2s ease-in-out infinite;
      overflow: hidden;
    }
    @keyframes slam {
      0% { opacity: 0; transform: scale(0.6) translateY(100px) rotate(-3deg); filter: blur(20px); }
      60% { opacity: 1; transform: scale(1.04) rotate(1deg); filter: blur(0); }
      100% { opacity: 1; transform: scale(1); }
    }
    @keyframes shake {
      0%,85%,100% { transform: translate(0,0); }
      86% { transform: translate(-2px,1px); }
      88% { transform: translate(2px,-1px); }
      90% { transform: translate(0,0); }
    }
    .ad-card::before {
      content: ''; position: absolute; inset: 0;
      border: 2px solid transparent; pointer-events: none;
      animation: chromBorder 5s infinite;
    }
    @keyframes chromBorder {
      0%,100% { box-shadow: none; }
      50% { box-shadow: inset 3px 0 0 rgba(255,26,26,0.4), inset -3px 0 0 rgba(0,255,136,0.3); }
    }

    .corner {
      position: absolute; width: 28px; height: 28px;
      border-color: var(--red); border-style: solid; z-index: 5;
      animation: cornerPulse 2s ease-in-out infinite;
    }
    .corner-tl { top: 10px; left: 10px; border-width: 3px 0 0 3px; }
    .corner-tr { top: 10px; right: 10px; border-width: 3px 3px 0 0; }
    .corner-bl { bottom: 10px; left: 10px; border-width: 0 0 3px 3px; }
    .corner-br { bottom: 10px; right: 10px; border-width: 0 3px 3px 0; }

    /* status */
    .status {
      display: inline-flex; align-items: center; gap: 0.5rem;
      background: rgba(0,255,136,0.08);
      border: 1px solid rgba(0,255,136,0.3);
      padding: 0.5rem 1.2rem;
      font-size: 0.65rem; font-weight: 800;
      color: var(--green);
      letter-spacing: 0.15em; text-transform: uppercase;
      margin-bottom: 1.3rem;
      animation: fadeDown 0.6s 0.2s both;
    }
    .status .dot {
      width: 8px; height: 8px; background: var(--green);
      border-radius: 50%; box-shadow: 0 0 12px var(--green);
      animation: dotBlink 1.2s infinite;
    }
    @keyframes dotBlink {
      0%,100% { opacity: 1; transform: scale(1); }
      50% { opacity: 0.3; transform: scale(1.5); }
    }

    .live {
      display: flex; align-items: center; justify-content: center;
      gap: 0.4rem; margin-bottom: 1.4rem;
      font-size: 0.7rem; font-weight: 700;
      color: var(--green); letter-spacing: 0.1em; text-transform: uppercase;
      animation: fadeDown 0.6s 0.4s both;
    }
    .live .pulse {
      width: 8px; height: 8px; background: var(--green); border-radius: 50%;
      box-shadow: 0 0 12px var(--green);
      animation: livePulse 1s infinite;
    }
    @keyframes livePulse {
      0%,100% { transform: scale(1); opacity: 1; }
      50% { transform: scale(1.6); opacity: 0.4; }
    }
    .live strong {
      color: var(--green); font-family: 'Anton', sans-serif;
      font-weight: 400; font-size: 1rem; letter-spacing: 0.04em;
    }

    /* headline */
    h1 {
      font-family: 'Anton', sans-serif;
      font-size: clamp(2.2rem, 6vw, 3.4rem);
      font-weight: 400; line-height: 1.02;
      letter-spacing: 0.01em; text-transform: uppercase;
      margin-bottom: 1.2rem;
      animation: headGlitch 0.8s 0.5s both;
    }
    @keyframes headGlitch {
      0% { opacity: 0; transform: scale(1.4); filter: blur(20px); }
      30% { opacity: 1; transform: scale(0.95); filter: blur(0); }
      40% { transform: scale(1.03) translateX(-3px); }
      50% { transform: scale(1) translateX(3px); }
      60% { transform: scale(1); }
      100% { opacity: 1; transform: scale(1); }
    }
    h1 .red {
      color: var(--red);
      text-shadow: 0 0 20px var(--red-glow), 0 0 50px rgba(255,26,26,0.5);
      animation: redFlicker 3s infinite;
    }
    @keyframes redFlicker {
      0%,85%,100% { text-shadow: 0 0 20px var(--red-glow), 0 0 50px rgba(255,26,26,0.5); }
      86% { text-shadow: 0 0 70px var(--red), 0 0 120px var(--red); }
      87% { text-shadow: 0 0 15px var(--red); }
    }
    h1 .underline {
      position: relative; display: inline-block;
    }
    h1 .underline::after {
      content: ''; position: absolute;
      bottom: 3px; left: 0; height: 6px; width: 0;
      background: var(--red);
      box-shadow: 0 0 20px var(--red);
      animation: underlineGrow 0.8s 1.2s forwards;
    }
    @keyframes underlineGrow { to { width: 100%; } }

    /* subtext */
    .sub {
      font-size: 0.95rem; color: var(--muted);
      line-height: 1.7; max-width: 470px;
      margin: 0 auto 1.6rem;
      animation: fadeUp 0.6s 0.8s both;
    }
    .sub strong { color: var(--text); font-weight: 700; }
    .sub .green { color: var(--green); font-weight: 600; }

    /* what I do (list) */
    .do-list {
      display: flex; flex-direction: column;
      gap: 0.5rem; max-width: 380px;
      margin: 0 auto 1.8rem;
      text-align: left;
    }
    .do-item {
      display: flex; align-items: center;
      gap: 0.7rem;
      background: rgba(255,255,255,0.03);
      border: 1px solid var(--border);
      padding: 0.6rem 1rem;
      font-size: 0.82rem;
      color: var(--muted);
      animation: fadeUp 0.5s both;
      transition: all 0.2s;
    }
    .do-item:nth-child(1) { animation-delay: 1s; }
    .do-item:nth-child(2) { animation-delay: 1.1s; }
    .do-item:nth-child(3) { animation-delay: 1.2s; }
    .do-item:nth-child(4) { animation-delay: 1.3s; }
    .do-item:hover {
      border-color: rgba(34,158,217,0.4);
      background: rgba(34,158,217,0.05);
      color: var(--text);
    }
    .do-item .check {
      color: var(--green); font-weight: 800; font-size: 1rem;
      flex-shrink: 0;
    }

    /* button */
    .btn {
      position: relative; display: inline-flex;
      align-items: center; justify-content: center;
      gap: 0.8rem; width: 100%;
      background: var(--tg); color: #fff;
      padding: 1.2rem 2rem; border: none;
      border-radius: 3px;
      font-size: 1.05rem; font-weight: 900;
      letter-spacing: 0.05em; text-transform: uppercase;
      font-family: 'Space Grotesk', sans-serif;
      cursor: pointer; text-decoration: none;
      transition: all 0.15s cubic-bezier(0.16,1,0.3,1);
      box-shadow: 0 0 0 2px rgba(255,255,255,0.15), 0 0 50px -5px var(--tg-glow), 0 20px 55px -10px rgba(34,158,217,0.6);
      animation: btnExp 0.6s 1.5s both, btnPulse 1.4s 2.1s ease-in-out infinite;
      overflow: hidden; z-index: 1;
      opacity: 0;
    }
    @keyframes btnExp {
      0% { opacity: 0; transform: scale(0.4) rotate(-3deg); filter: blur(20px); }
      60% { opacity: 1; transform: scale(1.08) rotate(1deg); filter: blur(0); }
      100% { opacity: 1; transform: scale(1); }
    }
    @keyframes btnPulse {
      0%,100% {
        box-shadow: 0 0 0 2px rgba(255,255,255,0.15), 0 0 50px -5px var(--tg-glow), 0 20px 55px -10px rgba(34,158,217,0.6);
      }
      50% {
        box-shadow: 0 0 0 4px rgba(255,255,255,0.25), 0 0 90px 5px var(--tg-glow), 0 20px 65px -10px rgba(34,158,217,1);
      }
    }
    .btn::before {
      content: ''; position: absolute; inset: -3px;
      background: conic-gradient(from 0deg, transparent 0deg, rgba(255,255,255,0.9) 20deg, transparent 40deg, transparent 180deg, rgba(255,26,26,0.9) 200deg, transparent 220deg);
      border-radius: 4px; z-index: -2;
      animation: conicSpin 3s linear infinite;
    }
    .btn::after {
      content: ''; position: absolute; inset: 1px;
      background: var(--tg); border-radius: 2px; z-index: -1;
    }
    @keyframes conicSpin { to { transform: rotate(360deg); } }

    .shimmer {
      position: absolute; top: 0; left: -120%;
      width: 60%; height: 100%;
      background: linear-gradient(100deg, transparent, rgba(255,255,255,0.5), transparent);
      transform: skewX(-20deg);
      animation: shimmer 2.4s 2.6s infinite;
      z-index: 3; pointer-events: none;
    }
    @keyframes shimmer {
      0% { left: -120%; }
      50%,100% { left: 160%; }
    }

    .btn-text {
      position: relative; z-index: 4;
    }
    .btn-text::before, .btn-text::after {
      content: attr(data-text);
      position: absolute; top: 0; left: 0;
      width: 100%; height: 100%;
      opacity: 0; pointer-events: none;
    }
    .btn:hover .btn-text::before {
      opacity: 1; color: var(--red);
      animation: gl1 0.3s infinite;
      text-shadow: 2px 0 var(--red);
    }
    .btn:hover .btn-text::after {
      opacity: 1; color: var(--green);
      animation: gl2 0.3s infinite;
      text-shadow: -2px 0 var(--green);
    }
    @keyframes gl1 {
      0%,100% { clip-path: inset(0 0 70% 0); transform: translateX(-4px); }
      50% { clip-path: inset(55% 0 15% 0); transform: translateX(4px); }
    }
    @keyframes gl2 {
      0%,100% { clip-path: inset(50% 0 25% 0); transform: translateX(4px); }
      50% { clip-path: inset(15% 0 60% 0); transform: translateX(-4px); }
    }
    .btn:hover {
      transform: scale(1.03);
      background: #2eaee6;
      box-shadow: 0 0 0 4px rgba(255,255,255,0.3), 0 0 90px 10px var(--tg-glow), 0 20px 60px -10px rgba(34,158,217,1);
    }
    .btn:active { transform: scale(0.98); }

    .btn svg {
      width: 24px; height: 24px; z-index: 4;
      flex-shrink: 0;
      animation: iconShake 0.6s 3s infinite;
    }
    @keyframes iconShake {
      0%,90%,100% { transform: rotate(0); }
      93% { transform: rotate(-12deg) translateY(-2px); }
      96% { transform: rotate(12deg) translateY(-2px); }
    }

    .urgency {
      display: flex; align-items: center; justify-content: center;
      gap: 0.5rem; margin-top: 1.3rem;
      font-size: 0.7rem; font-weight: 800;
      color: var(--red); letter-spacing: 0.12em;
      text-transform: uppercase;
      animation: fadeUp 0.6s 1.8s both, urgencyBlink 1.4s 2.4s ease-in-out infinite;
    }
    @keyframes urgencyBlink {
      0%,100% { opacity: 1; }
      50% { opacity: 0.35; }
    }
    .urgency svg {
      width: 15px; height: 15px;
      animation: warnSpin 2s linear infinite;
    }
    @keyframes warnSpin {
      0%,100% { transform: rotate(0); }
      25% { transform: rotate(-10deg); }
      75% { transform: rotate(10deg); }
    }

    @keyframes fadeDown {
      0% { opacity: 0; transform: translateY(-15px); }
      100% { opacity: 1; transform: translateY(0); }
    }
    @keyframes fadeUp {
      0% { opacity: 0; transform: translateY(15px); }
      100% { opacity: 1; transform: translateY(0); }
    }

    @media (max-width: 520px) {
      .ad-card { padding: 2.2rem 1.4rem 2rem; }
      h1 { font-size: 1.9rem; }
      .sub { font-size: 0.85rem; }
      .btn { padding: 1rem 1.5rem; font-size: 0.9rem; }
      .corner { width: 22px; height: 22px; }
      .status { font-size: 0.58rem; padding: 0.4rem 0.9rem; }
      .do-item { font-size: 0.76rem; padding: 0.5rem 0.8rem; }
    }
  </style>
</head>
<body>
  <div class="conic-bg"></div>
  <div class="noise"></div>
  <div class="scanlines"></div>
  <div class="strobe-c"></div>
  <div class="strobe-tl"></div>
  <div class="strobe-br"></div>
  <div class="glitch-bar"></div>
  <div class="glitch-bar"></div>
  <div class="glitch-bar"></div>
  <div class="glitch-bar"></div>

  <div class="ad-card">
    <div class="corner corner-tl"></div>
    <div class="corner corner-tr"></div>
    <div class="corner corner-bl"></div>
    <div class="corner corner-br"></div>

    <div class="status">
      <span class="dot"></span>
      Available for new projects
    </div>

    <div class="live">
      <span class="pulse"></span>
      <strong id="liveCount">147</strong> people viewing right now
    </div>

    <h1>
      I build <span class="red">investment</span><br>
      websites &amp; <span class="underline">apps.</span>
    </h1>

    <p class="sub">
      I'm a <strong>web developer</strong> who builds <span class="green">fast, secure, high-converting</span> websites and apps for investment firms and fintech startups.
    </p>

    <div class="do-list">
      <div class="do-item"><span class="check">✓</span> Investment &amp; fintech websites</div>
      <div class="do-item"><span class="check">✓</span> Web apps &amp; dashboards</div>
      <div class="do-item"><span class="check">✓</span> Landing pages that convert</div>
      <div class="do-item"><span class="check">✓</span> Ongoing support &amp; maintenance</div>
    </div>

    <a href="https://t.me/YOUR_USERNAME" target="_blank" rel="noopener" class="btn">
      <span class="shimmer"></span>
      <svg viewBox="0 0 24 24" fill="currentColor">
        <path d="M11.944 0A12 12 0 0 0 0 12a12 12 0 0 0 12 12 12 12 0 0 0 12-12A12 12 0 0 0 12 0a12 12 0 0 0-.056 0zm4.962 7.224c.1-.002.321.023.465.14a.506.506 0 0 1 .171.325c.016.093.036.306.02.472-.18 1.898-.962 6.502-1.36 8.627-.168.9-.499 1.201-.82 1.23-.696.065-1.225-.46-1.9-.902-1.056-.693-1.653-1.124-2.678-1.8-1.185-.78-.417-1.21.258-1.91.177-.184 3.247-2.977 3.307-3.23.007-.032.014-.15-.056-.212s-.174-.041-.249-.024c-.106.024-1.793 1.14-5.061 3.345-.48.33-.913.49-1.302.48-.428-.008-1.252-.241-1.865-.44-.752-.245-1.349-.374-1.297-.789.027-.216.325-.437.893-.663 3.498-1.524 5.83-2.529 6.998-3.014 3.332-1.386 4.025-1.627 4.476-1.635z"/>
      </svg>
      <span class="btn-text" data-text="Message me on Telegram">Message me on Telegram</span>
    </a>

    <div class="urgency">
      <svg viewBox="0 0 24 24" fill="currentColor">
        <path d="M12 2L1 21h22L12 2zm0 3.5L19.5 19h-15L12 5.5zM11 10v4h2v-4h-2zm0 6v2h2v-2h-2z"/>
      </svg>
      Limited project slots · Reply within 24h
    </div>
  </div>

  <script>
    // live counter
    const liveCountEl = document.getElementById('liveCount');
    let liveCount = 147;
    setInterval(() => {
      const change = Math.floor(Math.random() * 5) - 2;
      liveCount = Math.max(120, Math.min(220, liveCount + change));
      liveCountEl.textContent = liveCount;
    }, 2400);

    // random shake
    function shake() {
      document.body.style.animation = 'none';
      void document.body.offsetHeight;
      document.body.style.animation = 'bodyShake 0.15s ease-in-out';
      setTimeout(() => { document.body.style.animation = ''; }, 150);
    }
    const styleSheet = document.createElement('style');
    styleSheet.textContent = `
      @keyframes bodyShake {
        0%,100% { transform: translate(0,0); }
        25% { transform: translate(-3px,2px); }
        50% { transform: translate(3px,-2px); }
        75% { transform: translate(-2px,-2px); }
      }
    `;
    document.head.appendChild(styleSheet);
    setInterval(() => { if (Math.random() > 0.5) shake(); }, 6500);
  </script>
</body>
</html>
