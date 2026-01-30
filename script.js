// Copy to clipboard functionality
function copyToClipboard(elementId) {
    const element = document.getElementById(elementId);
    const text = element.textContent;
    
    // Create temporary textarea
    const textarea = document.createElement('textarea');
    textarea.value = text;
    textarea.style.position = 'fixed';
    textarea.style.opacity = '0';
    document.body.appendChild(textarea);
    
    // Select and copy
    textarea.select();
    textarea.setSelectionRange(0, 99999); // For mobile devices
    
    try {
        document.execCommand('copy');
        showToast('Copied to clipboard!');
    } catch (err) {
        // Fallback for modern browsers
        if (navigator.clipboard && navigator.clipboard.writeText) {
            navigator.clipboard.writeText(text).then(() => {
                showToast('Copied to clipboard!');
            }).catch(() => {
                showToast('Failed to copy. Please copy manually.');
            });
        } else {
            showToast('Failed to copy. Please copy manually.');
        }
    }
    
    document.body.removeChild(textarea);
}

// Show toast notification
function showToast(message) {
    const toast = document.getElementById('toast');
    toast.textContent = message;
    toast.classList.add('show');
    
    setTimeout(() => {
        toast.classList.remove('show');
    }, 2000);
}

// Environment detection (client-side)
function detectEnvironment() {
    const ua = navigator.userAgent.toLowerCase();
    let env = 'unknown';
    
    if (ua.includes('android')) {
        env = 'Android';
        if (ua.includes('termux')) {
            env = 'Termux';
        }
    } else if (ua.includes('linux')) {
        env = 'Linux';
    } else if (ua.includes('windows')) {
        env = 'Windows';
    } else if (ua.includes('mac')) {
        env = 'macOS';
    }
    
    return env;
}

// Display environment info on page load
document.addEventListener('DOMContentLoaded', () => {
    const env = detectEnvironment();
    
    // Add environment badge
    if (env === 'Android' || env === 'Termux') {
        const header = document.querySelector('header');
        const badge = document.createElement('div');
        badge.className = 'env-badge';
        badge.textContent = `Detected: ${env}`;
        badge.style.cssText = `
            background: #4CAF50;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            margin-top: 10px;
            display: inline-block;
            font-size: 14px;
        `;
        header.appendChild(badge);
    }
    
    // Add smooth scroll for better mobile experience
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
});

// Add keyboard shortcuts
document.addEventListener('keydown', (e) => {
    // Ctrl/Cmd + K to focus on search (if implemented)
    if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
        e.preventDefault();
        // Can be used for future search functionality
    }
});

// Service Worker for offline support (optional enhancement)
if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
        navigator.serviceWorker.register('/sw.js').catch(() => {
            // Service worker registration failed, that's ok
        });
    });
}
