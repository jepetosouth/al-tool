// AL-Tool - Installation Instructions for Termux/NetHunter
// This script displays proper installation commands

document.addEventListener('DOMContentLoaded', function() {
  const style = `
    body {
      font-family: 'Courier New', monospace;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: #fff;
      padding: 20px;
      margin: 0;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .container {
      max-width: 800px;
      background: rgba(0, 0, 0, 0.8);
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.5);
    }
    h1 {
      color: #00ff00;
      text-align: center;
      margin-bottom: 30px;
      text-shadow: 0 0 10px #00ff00;
    }
    .section {
      margin: 20px 0;
      padding: 15px;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 8px;
      border-left: 4px solid #00ff00;
    }
    .command {
      background: #1a1a1a;
      padding: 15px;
      border-radius: 5px;
      margin: 10px 0;
      font-family: 'Courier New', monospace;
      color: #00ff00;
      overflow-x: auto;
    }
    .step {
      color: #ffff00;
      font-weight: bold;
      margin: 15px 0 5px 0;
    }
    .note {
      color: #ff6b6b;
      font-style: italic;
      margin: 10px 0;
    }
    a {
      color: #64b5f6;
      text-decoration: none;
    }
    a:hover {
      color: #90caf9;
      text-decoration: underline;
    }
  `;

  const content = `
    <div class="container">
      <h1>🔧 AL-Tool Installation Guide 🔧</h1>
      
      <div class="section">
        <h2>📱 For Termux Users</h2>
        <p class="step">Step 1: Update packages</p>
        <div class="command">pkg update && pkg upgrade -y</div>
        
        <p class="step">Step 2: Install dependencies</p>
        <div class="command">pkg install git python wget curl -y</div>
        
        <p class="step">Step 3: Clone ALHacking repository</p>
        <div class="command">git clone https://github.com/4lbH4cker/ALHacking</div>
        
        <p class="step">Step 4: Navigate and run</p>
        <div class="command">cd ALHacking<br>bash alhack.sh</div>
      </div>

      <div class="section">
        <h2>🛡️ For NetHunter Users</h2>
        <p class="step">Quick Install (Automated Script)</p>
        <div class="command">pkg install wget -y<br>wget https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-nethunter.sh<br>chmod +x install-nethunter.sh<br>./install-nethunter.sh</div>
      </div>

      <div class="section">
        <h2>🚀 Quick One-Liner Installation</h2>
        <div class="command">pkg install wget -y && wget -O - https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-termux.sh | bash</div>
      </div>

      <div class="section">
        <p class="note">⚠️ Note: Grant storage permission if prompted: termux-setup-storage</p>
        <p class="note">⚠️ Educational purposes only. Always obtain proper authorization.</p>
        <p>📚 For detailed instructions, visit: <a href="https://github.com/jepetosouth/al-tool" target="_blank">GitHub Repository</a></p>
      </div>
    </div>
  `;

  // Create style element
  const styleElement = document.createElement('style');
  styleElement.textContent = style;
  document.head.appendChild(styleElement);

  // Set body content
  document.body.innerHTML = content;
});
