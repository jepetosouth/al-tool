# Foire Aux Questions (FAQ)

## Questions Générales

### Qu'est-ce qu'AL-Tool ?
AL-Tool est un assistant d'installation automatisé pour la boîte à outils ALHacking, spécialement conçu pour fonctionner de manière transparente sur les environnements Termux et Kali NetHunter sur les appareils Android.

### Ai-je besoin d'un accès root ?
Non, AL-Tool fonctionne sans accès root sur Termux standard. Cependant, certaines fonctionnalités avancées de la boîte à outils ALHacking peuvent nécessiter un accès root, en particulier sur NetHunter.

### Est-ce légal ?
L'outil lui-même est légal. Cependant, la façon dont vous l'utilisez est importante :
- ✅ **Légal** : Tester vos propres systèmes, tests d'intrusion autorisés, à des fins éducatives
- ❌ **Illégal** : Accès non autorisé aux systèmes, piratage sans permission, activités malveillantes

**Obtenez toujours une autorisation appropriée avant de tester un système que vous ne possédez pas.**

### Est-ce sûr à utiliser ?
Oui, les scripts d'installation sont sûrs. Ils font uniquement :
- Installer des paquets standard (git, python, wget, curl)
- Cloner le dépôt ALHacking
- Configurer les permissions de fichiers

Cependant, examinez toujours les scripts avant de les exécuter et téléchargez uniquement depuis des sources officielles.

## Questions d'Installation

### Pourquoi devrais-je utiliser Termux de F-Droid au lieu de Google Play ?
La version Termux sur Google Play est obsolète et n'est plus maintenue. F-Droid fournit la dernière version activement maintenue avec toutes les fonctionnalités et les mises à jour de sécurité.

### De combien d'espace de stockage ai-je besoin ?
- **Minimum** : 100 Mo
- **Recommandé** : 500 Mo à 1 Go pour les mises à jour et les outils supplémentaires

### Combien de temps prend l'installation ?
Généralement 2-5 minutes, selon :
- La vitesse de la connexion Internet
- Les performances de l'appareil
- La charge du serveur

### Puis-je installer cela sur plusieurs appareils ?
Oui ! Vous pouvez installer AL-Tool sur autant d'appareils que vous le souhaitez. Chaque installation est indépendante.

### Dois-je être connecté au Wi-Fi ?
Bien que ce ne soit pas strictement obligatoire, le Wi-Fi est recommandé pour :
- Des téléchargements plus rapides
- Éviter l'utilisation de données mobiles
- Une connexion plus stable

## Questions de Compatibilité

### Quelles versions d'Android sont prises en charge ?
- **Minimum** : Android 7.0 (Nougat)
- **Recommandé** : Android 10.0 ou supérieur
- **Meilleure Expérience** : Android 11+

### Cela fonctionne-t-il sur iOS ?
Non, AL-Tool est spécialement conçu pour les appareils Android avec Termux ou NetHunter. iOS utilise une architecture différente et ne prend pas en charge ces environnements.

### Quelle est la différence entre Termux et NetHunter ?
- **Termux** : Environnement Linux de base sur Android, pas de root requis
- **NetHunter** : Environnement Kali Linux complet avec des outils de sécurité pré-installés, fonctionne mieux avec root

Les deux sont compatibles avec AL-Tool.

### Cela fonctionnera-t-il sur les tablettes ?
Oui ! AL-Tool fonctionne sur n'importe quel appareil Android pouvant exécuter Termux ou NetHunter, y compris les tablettes.

## Questions de Dépannage

### L'installation échoue avec "Permission denied" (Permission refusée)
**Solutions** :
1. Accorder la permission de stockage : `termux-setup-storage`
2. Rendre le script exécutable : `chmod +x install-termux.sh`
3. Vérifier l'espace de stockage disponible : `df -h`

### Erreurs "Command not found" (Commande non trouvée)
**Solution** : Mettez d'abord à jour les listes de paquets
```bash
pkg update -y
pkg upgrade -y
```

### Le clonage Git échoue ou expire
**Solutions** :
1. Vérifier la connexion Internet
2. Essayer de basculer entre le Wi-Fi et les données mobiles
3. Utiliser un VPN si GitHub est bloqué
4. Réessayer plus tard (le serveur peut être occupé)

### Erreur "Package not found" (Paquet non trouvé)
**Solution** : Mettre à jour la base de données des paquets
```bash
pkg update
pkg upgrade
```

### Comment désinstaller complètement ?
```bash
# Supprimer ALHacking
rm -rf ~/ALHacking

# Optionnel : supprimer les paquets installés
pkg uninstall git python wget curl
```

### L'outil ne fonctionne pas après l'installation
**Étapes de vérification** :
```bash
# Vérifier l'installation
ls -la ~/ALHacking

# Vérifier que le script existe
ls -l ~/ALHacking/alhack.sh

# Essayer d'exécuter manuellement
cd ~/ALHacking
bash alhack.sh
```

## Questions d'Utilisation

### Comment exécuter ALHacking après l'installation ?
```bash
cd ~/ALHacking
bash alhack.sh
```

Ou directement :
```bash
bash ~/ALHacking/alhack.sh
```

### Puis-je mettre à jour ALHacking ?
Oui, mettre à jour via git :
```bash
cd ~/ALHacking
git pull
```

### Où sont enregistrés les fichiers ?
Par défaut, les fichiers sont enregistrés dans :
- Installation : `~/ALHacking/`
- Dossier personnel Termux : `/data/data/com.termux/files/home/`
- Stockage partagé : `~/storage/` (après avoir exécuté `termux-setup-storage`)

### Comment accéder au stockage de mon appareil depuis Termux ?
```bash
termux-setup-storage
```
Puis accordez la permission. Votre stockage sera accessible à `~/storage/`

### Puis-je exécuter cela en arrière-plan ?
Oui, vous pouvez utiliser des multiplexeurs de terminal :
```bash
# Installer tmux
pkg install tmux -y

# Exécuter dans une session tmux
tmux
cd ~/ALHacking
bash alhack.sh
# Détacher : Ctrl+B, puis D
```

## Questions de Sécurité

### Mes données sont-elles en sécurité ?
Les scripts d'installation ne collectent ni ne transmettent de données personnelles. Cependant :
- Examinez toujours les scripts avant de les exécuter
- Téléchargez uniquement depuis des sources officielles
- Gardez votre appareil et vos applications à jour

### Cela peut-il me causer des ennuis ?
L'utilisation de l'outil lui-même n'est pas illégale, mais :
- ❌ L'accès non autorisé aux systèmes EST illégal
- ❌ L'utilisation malveillante des outils EST illégale
- ✅ Les tests autorisés et l'éducation SONT légaux

**Obtenez toujours une autorisation écrite avant de tester un système.**

### Devrais-je utiliser un VPN ?
Pour une utilisation générale :
- Installation : Non requis
- Apprentissage : Non requis
- Test de ses propres systèmes : Non requis
- Tests d'intrusion autorisés : Suivre les exigences du client

### Que faire si je cible accidentellement le mauvais système ?
- Arrêter immédiatement
- Documenter ce qui s'est passé
- Signaler au propriétaire du système si système externe
- Apprendre de l'erreur
- Toujours vérifier trois fois les cibles avant de tester

## Questions de Performance

### L'outil fonctionne lentement
**Causes courantes et solutions** :
1. **RAM faible** : Fermer les autres applications
2. **Stockage faible** : Libérer de l'espace
3. **Internet lent** : Utiliser le Wi-Fi
4. **Processus en arrière-plan** : Redémarrer l'appareil

### Puis-je accélérer l'installation ?
**Conseils** :
- Utiliser le Wi-Fi au lieu des données mobiles
- Installer pendant les heures creuses
- Garder l'appareil chargé
- Fermer les applications inutiles

### Cela épuise-t-il ma batterie ?
Le processus d'installation lui-même n'épuise pas significativement la batterie. Cependant, l'exécution d'outils de sécurité peut être gourmande en ressources.

## Questions Avancées

### Puis-je personnaliser l'emplacement d'installation ?
Oui, modifiez la variable `INSTALL_DIR` du script avant de l'exécuter :
```bash
# Éditer le script
nano install-termux.sh

# Changer cette ligne :
INSTALL_DIR="$HOME/ALHacking"
# En votre emplacement préféré :
INSTALL_DIR="$HOME/mon-emplacement-personnalise"
```

### Puis-je automatiser l'installation ?
Pour une installation non interactive, vous pouvez modifier le script pour ignorer les invites, mais ce n'est pas recommandé pour les débutants.

### Comment puis-je contribuer à AL-Tool ?
Voir [CONTRIBUTING.md](CONTRIBUTING.md) pour des directives détaillées sur :
- Signaler des bugs
- Suggérer des fonctionnalités
- Soumettre des demandes de tirage
- Directives de style de code

### Puis-je utiliser cela avec d'autres outils ?
Oui ! L'installation n'interfère pas avec d'autres outils. Vous pouvez avoir plusieurs outils de sécurité installés simultanément.

### Comment garder tout à jour ?
```bash
# Mettre à jour les paquets Termux
pkg update && pkg upgrade -y

# Mettre à jour ALHacking
cd ~/ALHacking
git pull

# Mettre à jour les scripts AL-Tool
# Retélécharger le dernier script d'installation
```

## Obtenir Plus d'Aide

### Où puis-je trouver plus d'informations ?
- **README Principal** : [README.fr.md](README.fr.md)
- **Démarrage Rapide** : [QUICKSTART.fr.md](QUICKSTART.fr.md)
- **Prérequis** : [REQUIREMENTS.md](REQUIREMENTS.md) (anglais)
- **Guide de Test** : [TESTING.md](TESTING.md) (anglais)
- **Contribution** : [CONTRIBUTING.md](CONTRIBUTING.md) (anglais)

### Comment signaler des bugs ?
1. Vérifier si le problème existe déjà
2. Rassembler les informations sur l'environnement
3. Documenter les étapes pour reproduire
4. Ouvrir un problème sur GitHub avec des détails

### Puis-je demander des fonctionnalités ?
Oui ! Ouvrez un problème avec :
- Description claire de la fonctionnalité
- Explication du cas d'utilisation
- Pourquoi ce serait bénéfique

### Où est la communauté ?
- **GitHub Issues** : Rapports de bugs et discussions
- **GitHub Discussions** : Questions générales et aide
- **Pull Requests** : Contributions de code

### J'ai une question qui n'est pas répondue ici
1. Consultez les fichiers de documentation
2. Recherchez les problèmes GitHub existants
3. Ouvrez un nouveau problème avec l'étiquette "question"
4. Soyez précis et fournissez du contexte

---

**Vous avez encore des questions ?** N'hésitez pas à ouvrir un problème sur GitHub ! 🚀

---

[English](FAQ.md) | **Français**
