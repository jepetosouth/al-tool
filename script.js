// AL-Tool - Installation Instructions for Termux/NetHunter
// This script displays proper installation commands

const translations = {
  en: {
    title: '🔧 AL-Tool Installation Guide 🔧',
    termuxTitle: '📱 For Termux Users',
    step1: 'Step 1: Update packages',
    step2: 'Step 2: Install dependencies',
    step3: 'Step 3: Clone ALHacking repository',
    step4: 'Step 4: Navigate and run',
    nethunterTitle: '🛡️ For NetHunter Users',
    nethunterStep: 'Automated Installation (Recommended)',
    quickTitle: '🚀 Quick One-Liner Installation',
    securityNote: '⚠️ Security Note: This executes code directly. Review the script first if concerned.',
    reviewStep: 'Or download and review first (Recommended):',
    note1: '⚠️ Note: Grant storage permission if prompted: termux-setup-storage',
    note2: '⚠️ Educational purposes only. Always obtain proper authorization.',
    docsLink: '📚 For detailed instructions, visit:',
    repoLink: 'GitHub Repository',
    langSwitch: 'Français'
  },
  fr: {
    title: '🔧 Guide d\'Installation AL-Tool 🔧',
    termuxTitle: '📱 Pour les Utilisateurs Termux',
    step1: 'Étape 1 : Mettre à jour les paquets',
    step2: 'Étape 2 : Installer les dépendances',
    step3: 'Étape 3 : Cloner le dépôt ALHacking',
    step4: 'Étape 4 : Naviguer et exécuter',
    nethunterTitle: '🛡️ Pour les Utilisateurs NetHunter',
    nethunterStep: 'Installation Automatisée (Recommandée)',
    quickTitle: '🚀 Installation Rapide en Une Ligne',
    securityNote: '⚠️ Note de Sécurité : Ceci exécute le code directement. Examinez le script d\'abord si préoccupé.',
    reviewStep: 'Ou télécharger et examiner d\'abord (Recommandé) :',
    note1: '⚠️ Note : Accordez la permission de stockage si demandé : termux-setup-storage',
    note2: '⚠️ À des fins éducatives uniquement. Obtenez toujours une autorisation appropriée.',
    docsLink: '📚 Pour des instructions détaillées, visitez :',
    repoLink: 'Dépôt GitHub',
    langSwitch: 'English'
  }
};

let currentLang = 'en';

function switchLanguage() {
  currentLang = currentLang === 'en' ? 'fr' : 'en';
  renderContent();
}

function renderContent() {
  const t = translations[currentLang];
  
  const content = `
    <div class="container">
      <div class="lang-switch">
        <button onclick="switchLanguage()" class="lang-btn">${t.langSwitch}</button>
      </div>
      
      <h1>${t.title}</h1>
      
      <div class="section">
        <h2>${t.termuxTitle}</h2>
        <p class="step">${t.step1}</p>
        <div class="command">pkg update && pkg upgrade -y</div>
        
        <p class="step">${t.step2}</p>
        <div class="command">pkg install git python wget curl -y</div>
        
        <p class="step">${t.step3}</p>
        <div class="command">git clone https://github.com/4lbH4cker/ALHacking</div>
        
        <p class="step">${t.step4}</p>
        <div class="command">cd ALHacking<br>bash alhack.sh</div>
      </div>

      <div class="section">
        <h2>${t.nethunterTitle}</h2>
        <p class="step">${t.nethunterStep}</p>
        <div class="command">pkg install wget -y<br>wget https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-nethunter.sh<br>chmod +x install-nethunter.sh<br>./install-nethunter.sh</div>
      </div>

      <div class="section">
        <h2>${t.quickTitle}</h2>
        <p class="note">${t.securityNote}</p>
        <div class="command">pkg install wget -y && wget -O - https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-termux.sh | bash</div>
        
        <p class="step">${t.reviewStep}</p>
        <div class="command">wget https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-termux.sh<br>cat install-termux.sh  # ${currentLang === 'en' ? 'Review the script' : 'Examiner le script'}<br>chmod +x install-termux.sh<br>./install-termux.sh</div>
      </div>

      <div class="section">
        <p class="note">${t.note1}</p>
        <p class="note">${t.note2}</p>
        <p>${t.docsLink} <a href="https://github.com/jepetosouth/al-tool" target="_blank">${t.repoLink}</a></p>
      </div>
    </div>
  `;

  document.body.innerHTML = content;
}

document.addEventListener('DOMContentLoaded', function() {
  // Make switchLanguage globally accessible
  window.switchLanguage = switchLanguage;
  renderContent();
});
