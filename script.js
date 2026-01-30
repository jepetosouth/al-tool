// AL-Tool - Installation Instructions for Termux/NetHunter
// This script displays proper installation commands

document.addEventListener('DOMContentLoaded', function() {
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
        <p class="step">Automated Installation (Recommended)</p>
        <div class="command">pkg install wget -y<br>wget https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-nethunter.sh<br>chmod +x install-nethunter.sh<br>./install-nethunter.sh</div>
      </div>

      <div class="section">
        <h2>🚀 Quick One-Liner Installation</h2>
        <p class="note">⚠️ Security Note: This executes code directly. Review the script first if concerned.</p>
        <div class="command">pkg install wget -y && wget -O - https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-termux.sh | bash</div>
        
        <p class="step">Or download and review first (Recommended):</p>
        <div class="command">wget https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-termux.sh<br>cat install-termux.sh  # Review the script<br>chmod +x install-termux.sh<br>./install-termux.sh</div>
      </div>

      <div class="section">
        <p class="note">⚠️ Note: Grant storage permission if prompted: termux-setup-storage</p>
        <p class="note">⚠️ Educational purposes only. Always obtain proper authorization.</p>
        <p>📚 For detailed instructions, visit: <a href="https://github.com/jepetosouth/al-tool" target="_blank">GitHub Repository</a></p>
      </div>
    </div>
  `;

  // Set body content
  document.body.innerHTML = content;
});
