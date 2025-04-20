# infinity_skin - Module de personnalisation RedM

Module de création et gestion avancée de l’apparence des personnages pour RedM, développé par Shepard & iiRedDev (ALTITUDE-DEV.COM). Conçu pour fonctionner en synergie avec Infinity Core.

## ✨ Fonctionnalités principales

- Création et édition complète du skin joueur (visage, morphologie, overlays, etc.)
- Interface utilisateur web moderne (ui/index.html)
- Sauvegarde et chargement du skin via base de données (oxmysql requis)
- Synchronisation serveur/client totale
- Gestion des vêtements, accessoires et overlays
- Exports pour récupération des données de skin
- Intégration native avec Infinity Core

## 📦 Installation

1. Placez ce dossier dans `resources` de votre serveur RedM.
2. Ajoutez la ressource à votre `server.cfg` :
   ```
   ensure oxmysql              # Module SQL
ensure infinity_core          # Module Framework core
   ensure infinity_skin
   ```
3. Assurez-vous que [oxmysql](https://github.com/overextended/oxmysql) est installé et lancé avant ce script.
4. Configurez les fichiers selon vos besoins.

## ⚙️ Configuration

- Scripts principaux :
  - `client/cl_main.lua` (logique client)
  - `server/sv_main.lua` (sauvegarde/chargement serveur)
  - `cloth_hash_names.lua` et `overlays.lua` (données et overlays)
- Interface utilisateur : `ui/`

## 🛠 Contribution

Toute contribution est la bienvenue !
Merci de créer une issue ou une pull request pour toute suggestion ou amélioration.

## 🤝 Support & liens

- Documentation : [https://altitude-dev.gitbook.io/doc/](https://altitude-dev.gitbook.io/doc/)
- Discord support : [https://discord.gg/ncH7GX3XJd](https://discord.gg/ncH7GX3XJd)
- Auteurs : Shepard, iiRedDev

---

> Module sous licence ALTITUDE-DEV.COM. Toute reproduction ou distribution non autorisée est interdite.
