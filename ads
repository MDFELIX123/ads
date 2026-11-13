<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="color-scheme" content="dark">
  <title>Web &amp; Android Dev Ad</title>
  <style>
    /* Center the card in the middle of the viewport */
    html, body {
      height: 100%;
      margin: 0;
    }
    body {
      display: flex;
      align-items: center;      /* vertical center */
      justify-content: center;  /* horizontal center */
      min-height: 100vh;
      min-height: 100dvh;       /* better on mobile browsers */
      padding: 16px;            /* breathing room on small screens */
      box-sizing: border-box;
      background-color: #020617; /* optional dark page background */
    }

    .dev-ad-card {
      width: 100%;
      max-width: 380px;
      background: linear-gradient(145deg, #0f172a, #1e293b);
      color: #f8fafc;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
      border-radius: 14px;
      padding: 24px;
      border: 1px solid #334155;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.35);
      box-sizing: border-box;
    }
    .dev-ad-badge {
      font-size: 12px;
      font-weight: 600;
      color: #38bdf8;
      margin: 0 0 8px 0;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }
    .dev-ad-title {
      font-size: 20px;
      font-weight: 700;
      margin: 0 0 12px 0;
      line-height: 1.3;
      color: #ffffff;
      text-wrap: balance;
    }
    .dev-ad-desc {
      font-size: 14px;
      color: #cbd5e1;
      line-height: 1.5;
      margin: 0 0 18px 0;
    }
    .dev-ad-list {
      list-style: none;
      padding: 0;
      margin: 0 0 22px 0;
      font-size: 14px;
      color: #e2e8f0;
    }
    .dev-ad-list li {
      margin-bottom: 10px;
      display: flex;
      align-items: flex-start;
      gap: 8px;
      line-height: 1.4;
    }
    .dev-ad-list li:last-child { margin-bottom: 0; }

    .dev-ad-list li::before {
      content: "";
      flex: 0 0 auto;
      width: 14px;
      height: 14px;
      margin-top: 3px;
      background-color: #38bdf8;
      -webkit-mask: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath d='M20 6 9 17l-5-5' fill='none' stroke='%23000' stroke-width='3' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E") center / contain no-repeat;
      mask: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath d='M20 6 9 17l-5-5' fill='none' stroke='%23000' stroke-width='3' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E") center / contain no-repeat;
    }

    .dev-ad-btn {
      display: block;
      width: 100%;
      text-align: center;
      background-color: #2563eb;
      color: #ffffff;
      text-decoration: none;
      font-weight: 600;
      font-size: 15px;
      line-height: 1.2;
      padding: 14px 16px;
      border-radius: 8px;
      box-sizing: border-box;
      transition: background-color 0.2s ease, transform 0.1s ease;
      -webkit-tap-highlight-color: transparent;
      word-break: break-all;
    }
    .dev-ad-btn:hover { background-color: #1d4ed8; }
    .dev-ad-btn:active { transform: translateY(1px); }
    .dev-ad-btn:focus-visible {
      outline: 3px solid #93c5fd;
      outline-offset: 2px;
    }

    @media (prefers-reduced-motion: reduce) {
      .dev-ad-btn { transition: none; }
      .dev-ad-btn:active { transform: none; }
    }
  </style>
</head>
<body>

  <div class="dev-ad-card">
    <p class="dev-ad-badge">Web &amp; Android Development</p>
    <h2 class="dev-ad-title"><span aria-hidden="true">💻</span> Turn Your Idea Into a Live Website or App</h2>
    <p class="dev-ad-desc">
      I build fast, high-performing websites and custom Android apps from the ground up.
      No templates, no delays—just clean code that works.
    </p>
    <ul class="dev-ad-list">
      <li>Custom business &amp; e-commerce sites</li>
      <li>Native Android apps &amp; APKs</li>
      <li>Mobile-first &amp; fast loading</li>
    </ul>
    <a href="https://t.me/APKBrainKillerofficial"
       target="_blank"
       rel="noopener noreferrer"
       class="dev-ad-btn">
      <span aria-hidden="true">👉</span> @APKBrainKillerofficial
    </a>
  </div>

</body>
</html>
