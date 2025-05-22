#!/bin/bash

echo "🚀 Starting Angular Modern UI Upgrade (Standalone Safe)..."

mkdir -p src/styles/ui
mkdir -p src/app/components/code-card
mkdir -p src/app/components/fake-terminal

# 1. Global SCSS variables
cat > src/styles/variables.scss <<EOF
:root {
  --bg: #0f0f0f;
  --fg: #e0e0e0;
  --accent: #00d1b2;
  --accent-alt: #1abc9c;
  --code: #2ecc71;

  --font-main: 'Fira Code', monospace;
  --radius: 10px;
  --shadow: 0 4px 20px rgba(0, 0, 0, 0.7);
  --transition-fast: 0.2s ease-in-out;
}
EOF

# 2. Animations
cat > src/styles/ui/animations.scss <<EOF
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.reveal-up {
  animation: fadeInUp 0.6s ease-out forwards;
  opacity: 0;
}
EOF

# 3. UI utilities
cat > src/styles/ui/ui-upgrade.scss <<EOF
@import '../variables.scss';
@import './animations.scss';

.button-modern {
  padding: 0.75rem 1.5rem;
  background: var(--accent);
  border: none;
  border-radius: var(--radius);
  color: var(--bg);
  font-family: var(--font-main);
  transition: background var(--transition-fast), transform var(--transition-fast);
  box-shadow: var(--shadow);

  &:hover {
    background: var(--accent-alt);
    transform: translateY(-3px);
  }
}
EOF

# 4. CodeCardComponent
cat > src/app/components/code-card/code-card.component.ts <<EOF
import { Component } from '@angular/core';

@Component({
  standalone: true,
  selector: 'app-code-card',
  templateUrl: './code-card.component.html',
  styleUrls: ['./code-card.component.scss']
})
export class CodeCardComponent {}
EOF

cat > src/app/components/code-card/code-card.component.html <<EOF
<div class="code-card">
  <h3>Featured Snippet</h3>
  <pre><code>npm install --save-dev vibes</code></pre>
</div>
EOF

cat > src/app/components/code-card/code-card.component.scss <<EOF
@import '../../../styles/variables.scss';

.code-card {
  background: #1a1a1a;
  padding: 1.5rem;
  border-radius: var(--radius);
  box-shadow: var(--shadow);
  color: var(--fg);
  font-family: var(--font-main);
  transition: transform 0.3s ease;
  position: relative;
  overflow: hidden;

  &:hover {
    transform: scale(1.03);
  }

  &::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle at center, rgba(0, 255, 195, 0.15), transparent);
    animation: rotateGlow 8s linear infinite;
  }
}

@keyframes rotateGlow {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
EOF

# 5. FakeTerminalComponent
cat > src/app/components/fake-terminal/fake-terminal.component.ts <<EOF
import { Component } from '@angular/core';

@Component({
  standalone: true,
  selector: 'app-fake-terminal',
  templateUrl: './fake-terminal.component.html',
  styleUrls: ['./fake-terminal.component.scss']
})
export class FakeTerminalComponent {}
EOF

cat > src/app/components/fake-terminal/fake-terminal.component.html <<EOF
<div class="terminal">
  <div class="header">
    <span class="dot red"></span>
    <span class="dot yellow"></span>
    <span class="dot green"></span>
  </div>
  <pre>$ ng generate vibes --modern true</pre>
</div>
EOF

cat > src/app/components/fake-terminal/fake-terminal.component.scss <<EOF
@import '../../../styles/variables.scss';

.terminal {
  background: #121212;
  border-radius: var(--radius);
  font-family: var(--font-main);
  color: var(--code);
  padding: 1rem;
  box-shadow: var(--shadow);
  width: fit-content;

  .header {
    display: flex;
    gap: 0.5rem;
    margin-bottom: 0.75rem;

    .dot {
      width: 10px;
      height: 10px;
      border-radius: 50%;
      display: inline-block;

      &.red { background: #ff5f56; }
      &.yellow { background: #ffbd2e; }
      &.green { background: #27c93f; }
    }
  }
}
EOF

echo ""
echo "✅ UI upgrade complete!"
echo "📁 SCSS: styles/variables.scss, ui/animations.scss, ui/ui-upgrade.scss"
echo "🧩 Components scaffolded: CodeCard, FakeTerminal (standalone ready)"
echo ""
echo "👉 In any standalone component, add imports like:"
echo "    imports: [CodeCardComponent, FakeTerminalComponent]"

