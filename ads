<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CodeVest · Investment Websites & Apps</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&family=Space+Grotesk:wght@500;600;700&family=Anton&display=swap" rel="stylesheet">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    :root {
      --bg: #010103; --surface: #06060b; --border: #12121b;
      --text: #fff; --muted: #6a6a80;
      --red: #ff1010; --red-glow: rgba(255,16,16,0.8);
      --green: #00ff88; --green-glow: rgba(0,255,136,0.6);
      --tg: #229ED9; --tg-glow: rgba(34,158,217,0.9);
      --mx: 50%; --my: 50%;
    }
    body {
      background: var(--bg); color: var(--text);
      font-family: 'Inter', system-ui, sans-serif;
      min-height: 100vh; display: flex;
      align-items: center; justify-content: center;
      padding: 1rem; position: relative; overflow: hidden;
    }

    .mesh {
      position: fixed; top: 50%; left: 50%;
      width: 250vmax; height: 250vmax;
      transform: translate(-50%,-50%);
      background: conic-gradient(from 0deg,
        transparent 0deg, rgba(255,16,16,0.09) 25deg,
        transparent 50deg, transparent 100deg,
        rgba(34,158,217,0.09) 125deg, transparent 150deg,
        transparent 220deg, rgba(0,255,136,0.07) 245deg,
        transparent 270deg, transparent 360deg);
      animation: meshSpin 25s linear infinite;
      filter: blur(70px); z-index: 0;
    }
    @keyframes meshSpin { to { transform: translate(-50%,-50%) rotate(360deg); } }

    .grid-bg {
      position: fixed; top: 50%; left: 50%;
      width: 300vmax; height: 300vmax;
      transform: translate(-50%,-50%);
      background-image:
        linear-gradient(rgba(255,16,16,0.05) 1px, transparent 1px),
        linear-gradient(90deg, rgba(34,158,217,0.05) 1px, transparent 1px);
      background-size: 60px 60px;
      mask-image: radial-gradient(ellipse at center, #000 5%, transparent 60%);
      -webkit-mask-image: radial-gradient(ellipse at center, #000 5%, transparent 60%);
      animation: gridSpin 40s linear infinite reverse;
      z-index: 0;
    }
    @keyframes gridSpin { to { transform: translate(-50%,-50%) rotate(-360deg); } }

    .noise {
      position: fixed; inset: -50%; z-index: 200; pointer-events: none;
      opacity: 0.06;
      background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 300 300' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.95' numOctaves='5'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E");
      animation: grain 0.25s steps(3) infinite;
    }
    @keyframes grain {
      0%,100% { transform: translate(0,0); }
      33% { transform: translate(-6px,6px); }
      66% { transform: translate(6px,-6px); }
    }
    .scanlines {
      position: fixed; inset: 0; z-index: 198; pointer-events: none;
      background: repeating-linear-gradient(0deg, transparent 0, transparent 2px, rgba(0,0,0,0.22) 2px, rgba(0,0,0,0.22) 4px);
      opacity: 0.5;
      animation: scan 6s linear infinite;
    }
    @keyframes scan { to { background-position: 0 100vh; } }
    .vignette {
      position: fixed; inset: 0; z-index: 197; pointer-events: none;
      background: radial-gradient(ellipse at center, transparent 40%, rgba(0,0,0,0.75) 100%);
    }
    .mouse-light {
      position: fixed; inset: 0; z-index: 4; pointer-events: none;
      background: radial-gradient(circle 600px at var(--mx) var(--my), rgba(255,16,16,0.1), transparent 70%);
    }
    .flash {
      position: fixed; inset: 0; z-index: 190; pointer-events: none;
      background: var(--red); opacity: 0;
      animation: flashAnim 9s infinite;
    }
    @keyframes flashAnim {
      0%,86%,100% { opacity: 0; }
      87% { opacity: 0.07; }
      88% { opacity: 0; }
      89% { opacity: 0.1; }
      90% { opacity: 0; }
    }

    .gbar {
      position: fixed; left: 0; width: 100%; height: 3px;
      background: linear-gradient(90deg, transparent, var(--red), transparent);
      z-index: 150; pointer-events: none; opacity: 0;
      animation: gbarAnim 6s linear infinite;
    }
    .gbar:nth-child(1) { top: 12%; animation-delay: 0s; animation-duration: 4s; }
    .gbar:nth-child(2) { top: 32%; animation-delay: 1.2s; animation-duration: 5s; background: linear-gradient(90deg, transparent, var(--tg), transparent); }
    .gbar:nth-child(3) { top: 52%; animation-delay: 2.4s; animation-duration: 3.5s; background: linear-gradient(90deg, transparent, var(--green), transparent); }
    .gbar:nth-child(4) { top: 72%; animation-delay: 3.6s; animation-duration: 5.5s; }
    .gbar:nth-child(5) { top: 88%; animation-delay: 1.8s; animation-duration: 4.2s; background: linear-gradient(90deg, transparent, var(--tg), transparent); }
    @keyframes gbarAnim {
      0% { opacity: 0; transform: translateX(-100%) scaleX(0.3); }
      4% { opacity: 1; transform: translateX(0) scaleX(1); }
      8% { opacity: 0.6; transform: translateX(20%) scaleX(0.8); }
      12% { opacity: 0; transform: translateX(100%) scaleX(0.3); }
      100% { opacity: 0; transform: translateX(100%); }
    }

    .cube {
      position: fixed; width: 50px; height: 50px;
      border: 2px solid var(--red);
      z-index: 149; pointer-events: none; opacity: 0;
      animation: cubeAnim 7s infinite;
    }
    .cube:nth-child(1) { top: 14%; left: 8%; animation-delay: 1.5s; }
    .cube:nth-child(2) { top: 76%; right: 10%; animation-delay: 3.5s; border-color: var(--tg); }
    .cube:nth-child(3) { top: 34%; right: 14%; animation-delay: 5.5s; border-color: var(--green); }
    @keyframes cubeAnim {
      0%,100% { opacity: 0; transform: scale(0) rotate(0); }
      1% { opacity: 1; transform: scale(1) rotate(45deg); }
      2% { opacity: 0; transform: scale(1.5) rotate(90deg); }
      3% { opacity: 1; transform: scale(0.7) rotate(135deg); }
      4% { opacity: 0; transform: scale(1) rotate(180deg); }
    }

    .bolt {
      position: fixed; width: 2px; height: 100vh;
      background: linear-gradient(to bottom, transparent, var(--red), transparent);
      z-index: 148; pointer-events: none; opacity: 0;
      filter: blur(1px);
      animation: boltAnim 10s infinite;
    }
    .bolt:nth-child(1) { left: 4%; animation-delay: 2s; }
    .bolt:nth-child(2) { left: 96%; animation-delay: 6s; background: linear-gradient(to bottom, transparent, var(--tg), transparent); }
    .bolt:nth-child(3) { left: 48%; animation-delay: 8.5s; }
    @keyframes boltAnim {
      0%,100% { opacity: 0; transform: scaleY(0); }
      0.4% { opacity: 1; transform: scaleY(1); }
      0.8% { opacity: 0.6; }
      1.2% { opacity: 0; }
    }

    #canvas { position: fixed; inset: 0; z-index: 3; pointer-events: none; }

    .gate {
      position: fixed; inset: 0; z-index: 1000;
      background: #000;
      display: flex; flex-direction: column;
      align-items: center; justify-content: center;
      cursor: pointer;
      animation: gateExit 0.8s 4.4s cubic-bezier(0.7,0,0.3,1) forwards;
    }
    @keyframes gateExit {
      0% { opacity: 1; transform: scale(1); }
      100% { opacity: 0; transform: scale(2); pointer-events: none; }
    }
    .gate::before {
      content: ''; position: absolute; inset: 0;
      background: radial-gradient(circle at center, rgba(255,16,16,0.25), transparent 60%);
      animation: gateGlow 4.4s ease-in-out;
    }
    @keyframes gateGlow {
      0%,100% { opacity: 0; }
      50% { opacity: 1; }
    }
    .gate-content {
      text-align: center; position: relative; z-index: 2;
      max-width: 90%;
      animation: gatePulse 4.4s ease-in-out;
    }
    @keyframes gatePulse {
      0% { opacity: 0; transform: scale(0.5); }
      12% { opacity: 1; transform: scale(1); }
      88% { opacity: 1; transform: scale(1); }
      100% { opacity: 1; transform: scale(1.3); }
    }
    .gate-line {
      font-family: 'Anton', sans-serif;
      font-size: clamp(1.2rem, 3.5vw, 2rem);
      text-transform: uppercase;
      letter-spacing: 0.04em;
      color: var(--text); margin-bottom: 0.4rem;
      white-space: nowrap; overflow: hidden;
      border-right: 3px solid var(--red);
      animation: gateType 0.9s steps(30) both;
    }
    .gate-line:nth-child(2) { animation-delay: 0.9s; border-color: var(--tg); }
    .gate-line:nth-child(3) { animation-delay: 1.8s; }
    @keyframes gateType {
      0% { width: 0; }
      100% { width: 100%; }
    }
    .gate-line.red { color: var(--red); text-shadow: 0 0 40px var(--red), 0 0 80px var(--red); }
    .gate-line.blue { color: var(--tg); text-shadow: 0 0 40px var(--tg); }
    .gate-skip {
      position: absolute; bottom: 3rem; left: 50%;
      transform: translateX(-50%);
      font-size: 0.7rem; color: var(--muted);
      letter-spacing: 0.22em; text-transform: uppercase;
      font-weight: 700;
      animation: skipBlink 1s 1.5s infinite;
    }
    @keyframes skipBlink {
      0%,100% { opacity: 1; }
      50% { opacity: 0.3; }
    }

    .ad-card {
      position: relative; z-index: 10;
      max-width: 620px; width: 100%;
      background: var(--surface);
      border: 2px solid var(--border);
      border-radius: 3px;
      padding: 3rem 2.4rem 2.6rem;
      text-align: center;
      box-shadow:
        0 0 0 1px rgba(255,16,16,0.25),
        0 0 120px -15px rgba(255,16,16,0.55),
        0 60px 150px -20px rgba(0,0,0,1);
      animation:
        cardSlam 0.8s 4.8s cubic-bezier(0.16,1,0.3,1) both,
        cardShake 6s 6.2s ease-in-out infinite;
      overflow: hidden;
      opacity: 0;
    }
    @keyframes cardSlam {
      0% { opacity: 0; transform: scale(0.4) translateY(150px) rotate(-6deg); filter: blur(40px); }
      35% { opacity: 1; transform: scale(1.1) translateY(-20px) rotate(3deg); filter: blur(0); }
      55% { transform: scale(0.94) rotate(-2deg); }
      75% { transform: scale(1.02) rotate(0.5deg); }
      100% { opacity: 1; transform: scale(1) translateY(0) rotate(0); }
    }
    @keyframes cardShake {
      0%,82%,100% { transform: translate(0,0) rotate(0); }
      83% { transform: translate(-4px,3px) rotate(-0.6deg); }
      85% { transform: translate(4px,-3px) rotate(0.6deg); }
      87% { transform: translate(-3px,-3px) rotate(-0.4deg); }
      89% { transform: translate(3px,3px) rotate(0.4deg); }
      91% { transform: translate(0,0) rotate(0); }
    }
    .ad-card::before {
      content: ''; position: absolute; inset: 0;
      border: 2px solid transparent; pointer-events: none;
      animation: chromBorder 3.5s infinite;
    }
    @keyframes chromBorder {
      0%,100% { box-shadow: none; }
      50% { box-shadow: inset 5px 0 0 rgba(255,16,16,0.5), inset -5px 0 0 rgba(0,255,136,0.4); }
    }

    .corner {
      position: absolute; width: 36px; height: 36px;
      border-color: var(--red); border-style: solid; z-index: 6;
      animation: cornerGlow 1.6s ease-in-out infinite;
    }
    @keyframes cornerGlow {
      0%,100% { opacity: 1; box-shadow: 0 0 10px var(--red); }
      50% { opacity: 0.5; box-shadow: 0 0 25px var(--red); }
    }
    .corner-tl { top: 10px; left: 10px; border-width: 3px 0 0 3px; }
    .corner-tr { top: 10px; right: 10px; border-width: 3px 3px 0 0; }
    .corner-bl { bottom: 10px; left: 10px; border-width: 0 0 3px 3px; }
    .corner-br { bottom: 10px; right: 10px; border-width: 0 3px 3px 0; }

    /* ✅ NEW: badge now states scarcity, consistent with bottom line */
    .status {
      display: inline-flex; align-items: center; gap: 0.55rem;
      background: rgba(0,255,136,0.1);
      border: 1px solid rgba(0,255,136,0.4);
      padding: 0.5rem 1.3rem;
      font-size: 0.62rem; font-weight: 800;
      color: var(--green);
      letter-spacing: 0.18em; text-transform: uppercase;
      margin-bottom: 1.4rem;
      animation: fadeDown 0.6s 5s both, statusGlow 1.5s 5.6s ease-in-out infinite;
    }
    @keyframes statusGlow {
      0%,100% { box-shadow: 0 0 0 rgba(0,255,136,0); border-color: rgba(0,255,136,0.4); }
      50% { box-shadow: 0 0 25px rgba(0,255,136,0.4); border-color: rgba(0,255,136,0.9); }
    }
    .status .dot {
      width: 8px; height: 8px; background: var(--green);
      border-radius: 50%; box-shadow: 0 0 15px var(--green);
      animation: dotBlink 0.9s infinite;
    }
    @keyframes dotBlink {
      0%,100% { opacity: 1; transform: scale(1); }
      50% { opacity: 0.2; transform: scale(1.8); }
    }

    /* ✅ Headline is now FIRST real content after badge */
    h1 {
      font-family: 'Anton', sans-serif;
      font-size: clamp(2.4rem, 6.5vw, 3.8rem);
      font-weight: 400; line-height: 1;
      letter-spacing: 0.01em; text-transform: uppercase;
      margin-bottom: 1.2rem;
      animation: headGlitch 0.9s 5s both;
    }
    @keyframes headGlitch {
      0% { opacity: 0; transform: scale(1.6); filter: blur(30px); }
      18% { opacity: 1; transform: scale(0.9); filter: blur(0); }
      24% { transform: scale(1.06) translateX(-5px); }
      30% { transform: scale(0.96) translateX(5px); }
      36% { transform: scale(1.02) translateX(-3px); }
      42% { transform: scale(1) translateX(0); }
      100% { opacity: 1; transform: scale(1); filter: blur(0); }
    }
    h1 .word { display: inline-block; position: relative; }
    h1 .red {
      color: var(--red);
      text-shadow: 0 0 25px var(--red-glow), 0 0 60px rgba(255,16,16,0.6), 0 0 120px rgba(255,16,16,0.4);
      animation: redFlicker 2.6s infinite;
    }
    @keyframes redFlicker {
      0%,82%,100% { text-shadow: 0 0 25px var(--red-glow), 0 0 60px rgba(255,16,16,0.6), 0 0 120px rgba(255,16,16,0.4); }
      83% { text-shadow: 0 0 90px var(--red), 0 0 160px var(--red), 0 0 240px var(--red); }
      84% { text-shadow: 0 0 12px var(--red); }
      85% { text-shadow: 0 0 25px var(--red-glow), 0 0 60px rgba(255,16,16,0.6), 0 0 120px rgba(255,16,16,0.4); }
    }
    h1 .underline { position: relative; display: inline-block; }
    h1 .underline::after {
      content: ''; position: absolute;
      bottom: 4px; left: 0; height: 8px; width: 0;
      background: var(--red);
      box-shadow: 0 0 30px var(--red), 0 0 60px var(--red);
      animation: underlineGrow 0.9s 5.9s forwards;
    }
    @keyframes underlineGrow { to { width: 100%; } }
    h1 .underline::before {
      content: 'apps'; position: absolute;
      top: 0; left: 0; color: var(--green); opacity: 0;
      clip-path: inset(30% 0 50% 0);
      animation: glitchSplit 5s 6.5s infinite;
    }
    h1 .red::before {
      content: 'investment'; position: absolute;
      top: 0; left: 0; color: var(--tg); opacity: 0;
      clip-path: inset(50% 0 20% 0);
      animation: glitchSplit 5s 6.7s infinite;
    }
    @keyframes glitchSplit {
      0%,90%,100% { opacity: 0; transform: translateX(0); }
      91% { opacity: 1; transform: translateX(-5px); }
      92% { opacity: 0; transform: translateX(5px); }
      93% { opacity: 0.8; transform: translateX(-3px); }
      94% { opacity: 0; transform: translateX(0); }
    }

    .sub {
      font-size: 0.98rem; color: var(--muted);
      line-height: 1.7; max-width: 480px;
      margin: 0 auto 1.3rem;
      animation: fadeUp 0.6s 5.2s both;
    }
    .sub strong { color: var(--text); font-weight: 700; }
    .sub .green { color: var(--green); font-weight: 600; text-shadow: 0 0 12px rgba(0,255,136,0.4); }

    .services-line {
      display: flex; align-items: center; justify-content: center;
      flex-wrap: wrap; gap: 0.55rem;
      font-size: 0.72rem; font-weight: 600;
      color: var(--muted);
      letter-spacing: 0.06em;
      text-transform: uppercase;
      margin-bottom: 1.6rem;
      animation: fadeUp 0.6s 5.35s both;
    }
    .services-line span {
      display: inline-block;
      padding: 0.28rem 0.75rem;
      border: 1px solid var(--border);
      border-radius: 2px;
      transition: all 0.2s;
    }
    .services-line span:hover {
      border-color: rgba(34,158,217,0.5);
      color: var(--text);
      background: rgba(34,158,217,0.05);
    }
    .services-line .sep {
      color: var(--muted);
      opacity: 0.4;
      padding: 0;
      border: none;
    }

    /* ✅ social proof — now comes AFTER the visitor knows what this is */
    .live {
      display: flex; align-items: center; justify-content: center;
      gap: 0.45rem; margin-bottom: 1rem;
      font-size: 0.7rem; font-weight: 700;
      color: var(--green); letter-spacing: 0.1em; text-transform: uppercase;
      animation: fadeUp 0.6s 5.5s both;
    }
    .live .pulse {
      width: 8px; height: 8px; background: var(--green); border-radius: 50%;
      box-shadow: 0 0 12px var(--green);
      animation: livePulse 0.8s infinite;
    }
    @keyframes livePulse {
      0%,100% { transform: scale(1); opacity: 1; }
      50% { transform: scale(1.7); opacity: 0.3; }
    }
    .live strong {
      color: var(--green); font-family: 'Anton', sans-serif;
      font-weight: 400; font-size: 1.05rem; letter-spacing: 0.05em;
      text-shadow: 0 0 20px var(--green-glow);
    }

    /* ✅ countdown now has explicit context via label */
    .countdown {
      display: flex; align-items: center; justify-content: center;
      gap: 0.9rem; margin-bottom: 1.6rem;
      animation: fadeUp 0.6s 5.65s both;
    }
    .cd-label {
      font-size: 0.56rem; color: var(--muted);
      letter-spacing: 0.2em; text-transform: uppercase;
      font-weight: 800;
    }
    .cd-timer { display: flex; gap: 0.4rem; }
    .cd-unit {
      background: rgba(255,16,16,0.12);
      border: 1px solid rgba(255,16,16,0.5);
      padding: 0.4rem 0.7rem; min-width: 50px;
      border-radius: 2px;
      animation: cdPulse 0.7s ease-in-out infinite;
    }
    .cd-unit:nth-child(2) { animation-delay: 0.1s; }
    .cd-unit:nth-child(3) { animation-delay: 0.2s; }
    @keyframes cdPulse {
      0%,100% { border-color: rgba(255,16,16,0.5); box-shadow: 0 0 0 rgba(255,16,16,0); }
      50% { border-color: var(--red); box-shadow: 0 0 25px rgba(255,16,16,0.5); }
    }
    .cd-num {
      display: block; font-family: 'Anton', sans-serif;
      font-size: 1.5rem; color: var(--red); line-height: 1;
      text-shadow: 0 0 20px var(--red-glow);
    }
    .cd-lbl {
      display: block; font-size: 0.5rem; color: var(--muted);
      letter-spacing: 0.1em; text-transform: uppercase;
      margin-top: 2px; font-weight: 700;
    }

    .btn {
      position: relative; display: inline-flex;
      align-items: center; justify-content: center;
      gap: 0.85rem; width: 100%;
      background: var(--tg); color: #fff;
      padding: 1.4rem 2rem; border: none;
      border-radius: 3px;
      font-size: 1.1rem; font-weight: 900;
      letter-spacing: 0.06em; text-transform: uppercase;
      font-family: 'Space Grotesk', sans-serif;
      cursor: pointer; text-decoration: none;
      transition: all 0.12s cubic-bezier(0.16,1,0.3,1);
      box-shadow:
        0 0 0 2px rgba(255,255,255,0.2),
        0 0 60px -5px var(--tg-glow),
        0 25px 65px -10px rgba(34,158,217,0.8);
      animation:
        btnExplode 0.7s 5.8s both,
        btnPulse 1.2s 6.5s ease-in-out infinite;
      overflow: hidden; z-index: 1;
      opacity: 0;
    }
    @keyframes btnExplode {
      0% { opacity: 0; transform: scale(0.3) rotate(-6deg); filter: blur(30px); }
      45% { opacity: 1; transform: scale(1.15) rotate(3deg); filter: blur(0); }
      65% { transform: scale(0.94) rotate(-1.5deg); }
      85% { transform: scale(1.03) rotate(0.5deg); }
      100% { opacity: 1; transform: scale(1) rotate(0); }
    }
    @keyframes btnPulse {
      0%,100% {
        box-shadow: 0 0 0 2px rgba(255,255,255,0.2), 0 0 60px -5px var(--tg-glow), 0 25px 65px -10px rgba(34,158,217,0.8);
        transform: scale(1);
      }
      50% {
        box-shadow: 0 0 0 6px rgba(255,255,255,0.35), 0 0 120px 8px var(--tg-glow), 0 25px 75px -10px rgba(34,158,217,1);
        transform: scale(1.025);
      }
    }
    .btn::before {
      content: ''; position: absolute; inset: -4px;
      background: conic-gradient(from 0deg, transparent 0deg, rgba(255,255,255,1) 15deg, transparent 30deg, transparent 180deg, rgba(255,16,16,1) 195deg, transparent 210deg);
      border-radius: 5px; z-index: -2;
      animation: conicSpin 2.2s linear infinite;
    }
    .btn::after {
      content: ''; position: absolute; inset: 1px;
      background: var(--tg); border-radius: 2px; z-index: -1;
    }
    @keyframes conicSpin { to { transform: rotate(360deg); } }
    .shimmer {
      position: absolute; top: 0; left: -120%;
      width: 60%; height: 100%;
      background: linear-gradient(100deg, transparent, rgba(255,255,255,0.6), transparent);
      transform: skewX(-20deg);
      animation: shimmerAnim 1.8s 6.8s infinite;
      z-index: 4; pointer-events: none;
    }
    @keyframes shimmerAnim {
      0% { left: -120%; }
      50%,100% { left: 160%; }
    }
    .btn-text { position: relative; z-index: 5; display: inline-block; }
    .btn-text::before, .btn-text::after {
      content: attr(data-text);
      position: absolute; top: 0; left: 0;
      width: 100%; height: 100%;
      opacity: 0; pointer-events: none;
    }
    .btn:hover .btn-text::before {
      opacity: 1; color: var(--red);
      animation: gl1 0.28s infinite;
      text-shadow: 3px 0 var(--red);
    }
    .btn:hover .btn-text::after {
      opacity: 1; color: var(--green);
      animation: gl2 0.28s infinite;
      text-shadow: -3px 0 var(--green);
    }
    @keyframes gl1 {
      0%,100% { clip-path: inset(0 0 70% 0); transform: translateX(-5px); }
      50% { clip-path: inset(55% 0 15% 0); transform: translateX(5px); }
    }
    @keyframes gl2 {
      0%,100% { clip-path: inset(50% 0 25% 0); transform: translateX(5px); }
      50% { clip-path: inset(15% 0 60% 0); transform: translateX(-5px); }
    }
    .btn:hover {
      transform: scale(1.04);
      background: #2eaee6;
      box-shadow:
        0 0 0 6px rgba(255,255,255,0.4),
        0 0 130px 15px var(--tg-glow),
        0 25px 75px -10px rgba(34,158,217,1);
    }
    .btn:active { transform: scale(0.97); }
    .btn svg {
      width: 26px; height: 26px; z-index: 5;
      flex-shrink: 0;
      filter: drop-shadow(0 2px 8px rgba(0,0,0,0.5));
      animation: iconShake 0.55s 7.4s infinite;
    }
    @keyframes iconShake {
      0%,88%,100% { transform: rotate(0); }
      91% { transform: rotate(-20deg) translateY(-3px); }
      94% { transform: rotate(20deg) translateY(-3px); }
      97% { transform: rotate(0); }
    }

    .urgency {
      display: flex; align-items: center; justify-content: center;
      gap: 0.55rem; margin-top: 1.4rem;
      font-size: 0.7rem; font-weight: 800;
      color: var(--red); letter-spacing: 0.14em;
      text-transform: uppercase;
      animation: fadeUp 0.6s 6.1s both, urgencyBlink 1.1s 6.7s ease-in-out infinite;
    }
    @keyframes urgencyBlink {
      0%,100% { opacity: 1; text-shadow: 0 0 10px rgba(255,16,16,0.6); }
      50% { opacity: 0.25; text-shadow: 0 0 25px rgba(255,16,16,1); }
    }
    .urgency svg {
      width: 16px; height: 16px;
      animation: warnSpin 1.6s linear infinite;
    }
    @keyframes warnSpin {
      0%,100% { transform: rotate(0); }
      25% { transform: rotate(-14deg); }
      75% { transform: rotate(14deg); }
    }

    @keyframes fadeDown {
      0% { opacity: 0; transform: translateY(-20px); }
      100% { opacity: 1; transform: translateY(0); }
    }
    @keyframes fadeUp {
      0% { opacity: 0; transform: translateY(20px); }
      100% { opacity: 1; transform: translateY(0); }
    }

    @media (max-width: 560px) {
      .ad-card { padding: 2.3rem 1.5rem 2.1rem; }
      h1 { font-size: 2rem; }
      .sub { font-size: 0.88rem; }
      .btn { padding: 1.15rem 1.5rem; font-size: 0.95rem; }
      .corner { width: 26px; height: 26px; }
      .status { font-size: 0.56rem; padding: 0.42rem 0.9rem; }
      .services-line { font-size: 0.64rem; gap: 0.4rem; }
      .services-line span { padding: 0.22rem 0.55rem; }
      .cd-unit { min-width: 42px; padding: 0.32rem 0.55rem; }
      .cd-num { font-size: 1.2rem; }
      .cd-label { display: none; }
    }
  </style>
</head>
<body>

  <!-- INTRO GATE -->
  <div class="gate" id="gate">
    <div class="gate-content">
      <div class="gate-line red">⚠ WAIT.</div>
      <div class="gate-line blue">Is your investment</div>
      <div class="gate-line">site actually converting?</div>
    </div>
    <div class="gate-skip">Click anywhere to skip</div>
  </div>

  <!-- BACKGROUND -->
  <div class="mesh"></div>
  <div class="grid-bg"></div>
  <div class="flash"></div>
  <div class="mouse-light" id="mouseLight"></div>
  <div class="gbar"></div><div class="gbar"></div><div class="gbar"></div><div class="gbar"></div><div class="gbar"></div>
  <div class="cube"></div><div class="cube"></div><div class="cube"></div>
  <div class="bolt"></div><div class="bolt"></div><div class="bolt"></div>
  <div class="scanlines"></div>
  <div class="vignette"></div>
  <div class="noise"></div>
  <canvas id="canvas"></canvas>

  <!-- AD CARD — NEW LOGICAL ORDER -->
  <div class="ad-card">
    <div class="corner corner-tl"></div>
    <div class="corner corner-tr"></div>
    <div class="corner corner-bl"></div>
    <div class="corner corner-br"></div>

    <!-- 1. Scarcity badge (matches bottom line) -->
    <div class="status">
      <span class="dot"></span>
      Accepting 2 more clients this month
    </div>

    <!-- 2. Headline first — WHAT -->
    <h1>
      I build <span class="word red">investment</span><br>
      websites &amp; <span class="word underline">apps.</span>
    </h1>

    <!-- 3. Subtext — WHO -->
    <p class="sub">
      <strong>Web developer.</strong> I ship <span class="green">fast, secure, conversion-focused</span> sites and apps for investment firms and fintech startups.
    </p>

    <!-- 4. What exactly -->
    <div class="services-line">
      <span>Websites</span>
      <span class="sep">·</span>
      <span>Apps</span>
      <span class="sep">·</span>
      <span>Dashboards</span>
      <span class="sep">·</span>
      <span>Maintenance</span>
    </div>

    <!-- 5. Social proof -->
    <div class="live">
      <span class="pulse"></span>
      <strong id="liveCount">149</strong> people viewing right now
    </div>

    <!-- 6. Countdown WITH context -->
    <div class="countdown">
      <span class="cd-label">Slots close in</span>
      <div class="cd-timer">
        <div class="cd-unit">
          <span class="cd-num" id="hours">04</span>
          <span class="cd-lbl">hrs</span>
        </div>
        <div class="cd-unit">
          <span class="cd-num" id="minutes">23</span>
          <span class="cd-lbl">min</span>
        </div>
        <div class="cd-unit">
          <span class="cd-num" id="seconds">04</span>
          <span class="cd-lbl">sec</span>
        </div>
      </div>
    </div>

    <!-- 7. ACTION -->
    <a href="https://t.me/YOUR_USERNAME" target="_blank" rel="noopener" class="btn">
      <span class="shimmer"></span>
      <svg viewBox="0 0 24 24" fill="currentColor">
        <path d="M11.944 0A12 12 0 0 0 0 12a12 12 0 0 0 12 12 12 12 0 0 0 12-12A12 12 0 0 0 12 0a12 12 0 0 0-.056 0zm4.962 7.224c.1-.002.321.023.465.14a.506.506 0 0 1 .171.325c.016.093.036.306.02.472-.18 1.898-.962 6.502-1.36 8.627-.168.9-.499 1.201-.82 1.23-.696.065-1.225-.46-1.9-.902-1.056-.693-1.653-1.124-2.678-1.8-1.185-.78-.417-1.21.258-1.91.177-.184 3.247-2.977 3.307-3.23.007-.032.014-.15-.056-.212s-.174-.041-.249-.024c-.106.024-1.793 1.14-5.061 3.345-.48.33-.913.49-1.302.48-.428-.008-1.252-.241-1.865-.44-.752-.245-1.349-.374-1.297-.789.027-.216.325-.437.893-.663 3.498-1.524 5.83-2.529 6.998-3.014 3.332-1.386 4.025-1.627 4.476-1.635z"/>
      </svg>
      <span class="btn-text" data-text="Message me on Telegram">Message me on Telegram</span>
    </a>

    <!-- 8. Final push — now MATCHES badge + timer -->
    <div class="urgency">
      <svg viewBox="0 0 24 24" fill="currentColor">
        <path d="M12 2L1 21h22L12 2zm0 3.5L19.5 19h-15L12 5.5zM11 10v4h2v-4h-2zm0 6v2h2v-2h-2z"/>
      </svg>
      Only 2 slots left · Reply within 24h
    </div>
  </div>

  <script>
    const mouseLight = document.getElementById('mouseLight');
    document.addEventListener('mousemove', (e) => {
      mouseLight.style.setProperty('--mx', e.clientX + 'px');
      mouseLight.style.setProperty('--my', e.clientY + 'px');
    });

    const canvas = document.getElementById('canvas');
    const ctx = canvas.getContext('2d');
    let particles = [];
    let mouse = { x: window.innerWidth / 2, y: window.innerHeight / 2 };
    let W, H;
    function resizeCanvas() { W = canvas.width = window.innerWidth; H = canvas.height = window.innerHeight; }
    resizeCanvas();
    window.addEventListener('resize', () => { resizeCanvas(); initParticles(); });
    document.addEventListener('mousemove', (e) => { mouse.x = e.clientX; mouse.y = e.clientY; });
    const colors = ['#ff1010', '#229ED9', '#00ff88'];
    class Particle {
      constructor() { this.reset(); this.y = Math.random() * H; }
      reset() {
        this.x = Math.random() * W; this.y = H + 10;
        this.size = Math.random() * 2.6 + 0.5;
        this.speedY = Math.random() * 1.3 + 0.4;
        this.speedX = (Math.random() - 0.5) * 0.7;
        this.color = colors[Math.floor(Math.random() * colors.length)];
        this.opacity = Math.random() * 0.6 + 0.25;
        this.glow = Math.random() * 10 + 5;
        this.attractX = 0; this.attractY = 0;
      }
      update() {
        const dx = mouse.x - this.x, dy = mouse.y - this.y;
        const dist = Math.sqrt(dx * dx + dy * dy) || 1;
        if (dist < 250) {
          const force = (250 - dist) / 250;
          this.attractX += (dx / dist) * force * 0.85;
          this.attractY += (dy / dist) * force * 0.85;
        }
        this.attractX *= 0.9; this.attractY *= 0.9;
        this.x += this.speedX + this.attractX;
        this.y -= this.speedY + this.attractY * -0.6;
        if (this.y < -30 || this.x < -30 || this.x > W + 30) this.reset();
      }
      draw() {
        ctx.save();
        ctx.globalAlpha = this.opacity;
        ctx.shadowColor = this.color;
        ctx.shadowBlur = this.glow;
        ctx.fillStyle = this.color;
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
        ctx.fill();
        ctx.restore();
      }
    }
    function initParticles() {
      const count = Math.min(Math.floor((W * H) / 13000), 180);
      particles = [];
      for (let i = 0; i < count; i++) particles.push(new Particle());
    }
    initParticles();
    function animate() {
      ctx.clearRect(0, 0, W, H);
      particles.forEach(p => { p.update(); p.draw(); });
      requestAnimationFrame(animate);
    }
    animate();

    const gate = document.getElementById('gate');
    gate.addEventListener('click', () => {
      gate.style.animation = 'gateExit 0.3s forwards';
      document.querySelector('.ad-card').style.animation =
        'cardSlam 0.8s cubic-bezier(0.16,1,0.3,1) both, cardShake 6s 1.4s ease-in-out infinite';
      document.querySelectorAll('.status, .live, .countdown, h1, .sub, .services-line, .btn, .urgency').forEach(el => {
        el.style.animationDelay = '0s';
      });
    });

    const liveEl = document.getElementById('liveCount');
    let live = 149;
    setInterval(() => {
      live += Math.floor(Math.random() * 5) - 2;
      live = Math.max(120, Math.min(230, live));
      liveEl.textContent = live;
    }, 2200);

    let h = 4, m = 23, s = 4;
    const hEl = document.getElementById('hours');
    const mEl = document.getElementById('minutes');
    const sEl = document.getElementById('seconds');
    function tick() {
      s--;
      if (s < 0) { s = 59; m--; if (m < 0) { m = 59; h--; if (h < 0) { h = 4; m = 23; s = 4; } } }
      hEl.textContent = String(h).padStart(2, '0');
      mEl.textContent = String(m).padStart(2, '0');
      sEl.textContent = String(s).padStart(2, '0');
    }
    setTimeout(() => setInterval(tick, 1000), 4800);

    function shake() {
      document.body.style.animation = 'none';
      void document.body.offsetHeight;
      document.body.style.animation = 'bodyShake 0.15s ease-in-out';
      setTimeout(() => { document.body.style.animation = ''; }, 150);
    }
    const st = document.createElement('style');
    st.textContent = `@keyframes bodyShake {
      0%,100% { transform: translate(0,0); }
      20% { transform: translate(-3px,2px); }
      40% { transform: translate(3px,-2px); }
      60% { transform: translate(-2px,-2px); }
      80% { transform: translate(2px,2px); }
    }`;
    document.head.appendChild(st);
    setInterval(() => { if (Math.random() > 0.5) shake(); }, 6500);

    document.querySelector('.btn').addEventListener('click', () => {
      const b = document.createElement('div');
      b.style.cssText = `
        position: fixed; top: 50%; left: 50%;
        width: 0; height: 0;
        background: radial-gradient(circle, rgba(34,158,217,1), rgba(0,255,136,0.5), transparent 60%);
        border-radius: 50%; transform: translate(-50%,-50%);
        pointer-events: none; z-index: 9999;
        animation: clickBurst 0.6s ease-out forwards;
      `;
      document.body.appendChild(b);
      const s2 = document.createElement('style');
      s2.textContent = `@keyframes clickBurst { 0% { width: 0; height: 0; opacity: 1; } 100% { width: 1400px; height: 1400px; opacity: 0; } }`;
      document.head.appendChild(s2);
    });
  </script>

</body>
</html>
