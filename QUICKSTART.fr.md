# Guide de Démarrage Rapide pour AL-Tool sur Termux/NetHunter

Ce guide vous aidera à démarrer rapidement avec AL-Tool sur votre appareil Android.

## Vérification des Prérequis

Avant de commencer, assurez-vous d'avoir :
- [ ] Application Termux ou NetHunter installée
- [ ] Au moins 100 Mo d'espace de stockage libre
- [ ] Connexion Internet active
- [ ] Familiarité de base avec l'interface en ligne de commande

## Configuration en 5 Minutes

### 1. Ouvrir le Terminal Termux/NetHunter

Lancez l'application Termux ou NetHunter sur votre appareil Android.

### 2. Accorder les Permissions de Stockage (Première Fois Uniquement)

```bash
termux-setup-storage
```

Lorsque vous y êtes invité, autorisez l'accès au stockage. Ceci est nécessaire pour enregistrer des fichiers et des configurations.

### 3. Mettre à Jour le Gestionnaire de Paquets

```bash
pkg update && pkg upgrade -y
```

Cela garantit que vous disposez des dernières informations sur les paquets.

### 4. Installer AL-Tool

Choisissez l'une de ces méthodes :

#### Option A : Télécharger et Examiner (Recommandé pour la Sécurité)
```bash
pkg install wget -y
wget https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-termux.sh
# Examiner le script avant de l'exécuter
cat install-termux.sh
# Si satisfait, rendre exécutable et exécuter
chmod +x install-termux.sh
./install-termux.sh
```

#### Option B : Installation Rapide (Une Commande)
⚠️ **Note de Sécurité** : Cette méthode télécharge et exécute le code immédiatement. À utiliser uniquement si vous faites confiance à la source.

```bash
pkg install wget -y && wget -O - https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-termux.sh | bash
```

### 5. Exécuter ALHacking

Après la fin de l'installation :
```bash
cd ~/ALHacking
bash alhack.sh
```

## À Quoi S'Attendre

Le script d'installation va :
1. ✓ Vérifier votre environnement (Termux/NetHunter)
2. ✓ Installer les paquets requis (git, python, wget, curl)
3. ✓ Cloner le dépôt ALHacking
4. ✓ Configurer les permissions d'exécution
5. ✓ Afficher un message de succès avec les instructions d'utilisation

Temps d'installation total : ~2-5 minutes (selon la vitesse d'Internet)

## Problèmes Courants pour la Première Fois

### Problème : "Permission denied" (Permission refusée)
**Solution :**
```bash
chmod +x install-termux.sh
```

### Problème : "Command not found: wget" (Commande non trouvée : wget)
**Solution :**
```bash
pkg install wget -y
```

### Problème : "Unable to locate package" (Impossible de localiser le paquet)
**Solution :**
```bash
pkg update -y
pkg upgrade -y
```

### Problème : "Storage permission required" (Permission de stockage requise)
**Solution :**
```bash
termux-setup-storage
# Puis autoriser la permission lorsque vous y êtes invité
```

## Étapes Suivantes

Après une installation réussie :

1. **Explorer les Fonctionnalités d'ALHacking** : Exécutez `bash alhack.sh` et suivez le menu
2. **Apprendre les Outils** : Familiarisez-vous avec les options disponibles
3. **Pratiquer en Toute Sécurité** : Utilisez uniquement sur des systèmes que vous possédez ou pour lesquels vous avez l'autorisation de tester
4. **Rejoindre la Communauté** : Consultez le dépôt pour les mises à jour et les discussions communautaires

## Conseils pour une Meilleure Expérience

- 📱 Utilisez un appareil avec au moins 2 Go de RAM pour un fonctionnement fluide
- 🔋 Gardez votre appareil chargé pendant l'installation
- 📶 Utilisez un Wi-Fi stable pour des téléchargements plus rapides
- 💾 Mettez régulièrement à jour les paquets : `pkg update && pkg upgrade`
- 🔒 Assurez-vous toujours d'avoir l'autorisation appropriée avant d'utiliser des outils de sécurité

## Obtenir de l'Aide

Si vous rencontrez des problèmes :
1. Consultez le [README principal](README.fr.md) pour le dépannage
2. Examinez attentivement les messages d'erreur
3. Recherchez des problèmes similaires sur GitHub
4. Ouvrez un problème avec des informations d'erreur détaillées

## Tutoriel Vidéo (Optionnel)

Pour une présentation visuelle, vous pouvez enregistrer votre installation réussie et la partager avec la communauté !

---

**Prêt à commencer ?** Il suffit de copier et coller les commandes ci-dessus ! 🚀

---

[English](QUICKSTART.md) | **Français**
