# AL-Tool - Installateur ALHacking pour Termux/NetHunter

Un outil d'installation simplifié pour [ALHacking](https://github.com/4lbH4cker/ALHacking) spécialement conçu pour les environnements Termux et Kali NetHunter sur les appareils Android.

## Aperçu

AL-Tool simplifie le processus d'installation de la boîte à outils ALHacking sur les appareils Android grâce à des scripts d'installation automatisés compatibles avec les environnements Termux et Kali NetHunter.

## Fonctionnalités

- ✅ Installation automatique des dépendances
- ✅ Support de l'environnement Termux
- ✅ Compatibilité avec Kali NetHunter
- ✅ Gestion des erreurs et détection de l'environnement
- ✅ Sortie colorée conviviale
- ✅ Réinstallation sécurisée avec options de nettoyage

## Prérequis

### Pour Termux
- Appareil Android avec l'application Termux installée
- Connexion Internet active
- Au moins 100 Mo d'espace de stockage libre

### Pour Kali NetHunter
- Appareil Android avec NetHunter installé
- Accès root (recommandé pour une fonctionnalité complète)
- Connexion Internet active
- Au moins 100 Mo d'espace de stockage libre

## Installation

### Méthode 1 : Installation Automatisée (Recommandée)

#### Pour Termux :
```bash
# Télécharger et exécuter le script d'installation
pkg install wget -y
wget https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-termux.sh
chmod +x install-termux.sh
bash install-termux.sh
```

#### Pour NetHunter :
```bash
# Télécharger et exécuter le script d'installation
pkg install wget -y
wget https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-nethunter.sh
chmod +x install-nethunter.sh
bash install-nethunter.sh
```

### Méthode 2 : Installation Manuelle

Si vous préférez installer manuellement, suivez ces étapes :

#### Étape 1 : Installer les Dépendances
```bash
# Mettre à jour la liste des paquets
pkg update -y

# Installer les paquets requis
pkg install git python wget curl -y
```

#### Étape 2 : Cloner le Dépôt ALHacking
```bash
# Cloner le dépôt
git clone https://github.com/4lbH4cker/ALHacking
cd ALHacking
```

#### Étape 3 : Exécuter ALHacking
```bash
# Rendre le script exécutable
chmod +x alhack.sh

# Exécuter l'outil
bash alhack.sh
```

## Utilisation

Après une installation réussie, vous pouvez exécuter ALHacking avec :

```bash
cd ~/ALHacking
bash alhack.sh
```

Ou directement :
```bash
bash ~/ALHacking/alhack.sh
```

## Dépannage

### Problèmes de Permission de Stockage
Si vous rencontrez des erreurs de permission, accordez l'accès au stockage Termux :
```bash
termux-setup-storage
```

### Problèmes de Connexion Internet
- Assurez-vous d'avoir une connexion Internet active
- Essayez de basculer entre le Wi-Fi et les données mobiles
- Vérifiez si GitHub est accessible depuis votre réseau

### Échecs de Clonage du Dépôt
Si le clonage échoue, essayez :
```bash
# Vider le cache DNS
pkg install dnsutils -y

# Utiliser une URL GitHub alternative
git clone https://github.com/4lbH4cker/ALHacking.git
```

### Échecs d'Installation de Paquets
```bash
# Forcer la mise à jour des listes de paquets
pkg upgrade -y

# Nettoyer le cache des paquets
pkg clean
```

## Notes Spécifiques à l'Environnement

### Termux
- Termux fournit un environnement Linux sur Android sans nécessiter de root
- L'accès au stockage peut nécessiter une configuration supplémentaire via `termux-setup-storage`
- Certains outils peuvent avoir des fonctionnalités limitées sans accès root

### NetHunter
- NetHunter fournit des outils supplémentaires de sécurité et de tests d'intrusion
- L'accès root active toutes les fonctionnalités des outils
- NetHunter inclut un environnement Kali Linux avec des outils pré-installés

## Avertissement de Sécurité

⚠️ **Important** : L'outil ALHacking et cet installateur sont destinés à des fins éducatives et à des tests de sécurité autorisés uniquement. L'accès non autorisé aux systèmes informatiques est illégal. Obtenez toujours une autorisation appropriée avant de effectuer des tests de sécurité.

## Contribuer

Les contributions sont les bienvenues ! N'hésitez pas à soumettre des problèmes ou des demandes de tirage pour améliorer le processus d'installation ou ajouter de nouvelles fonctionnalités.

## Licence

Ce projet est fourni tel quel à des fins éducatives. Veuillez consulter le [dépôt ALHacking](https://github.com/4lbH4cker/ALHacking) pour les informations de licence concernant l'outil principal.

## Crédits

- Projet Original : [LiveCodes](https://livecodes.io/?x=https://github.com/jepetosouth/al-tool/tree/gh-pages/src)
- Créé par : [Jeanjj](https://github.com/jepetosouth)
- Outil ALHacking : [4lbH4cker](https://github.com/4lbH4cker/ALHacking)

## Support

Pour les problèmes liés à :
- **Scripts d'installation** : Ouvrir un problème dans ce dépôt
- **Outil ALHacking** : Visiter le [dépôt ALHacking](https://github.com/4lbH4cker/ALHacking)
- **Termux** : Consulter le [Wiki Termux](https://wiki.termux.com/)
- **NetHunter** : Visiter la [Documentation NetHunter](https://www.kali.org/docs/nethunter/)

---

[English](README.md) | **Français** | [Autres langues...](README.md#translations)
