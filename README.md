# infinity_skin - RedM Skin Customization Module

Advanced character appearance creation and management module for RedM, developed by Shepard & iiRedDev (ALTITUDE-DEV.COM). Designed to work seamlessly with Infinity Core.

## ✨ Main Features

- Full player skin creation and editing (face, morphology, overlays, etc.)
- Modern web user interface (ui/index.html)
- Skin save/load with database (requires oxmysql)
- Full server/client synchronization
- Clothes, accessories, and overlays management
- Exports to retrieve skin data
- Native integration with Infinity Core

## 📦 Installation

1. Place this folder in your server's `resources` directory.
2. Add the resource to your `server.cfg`:
   ```
   ensure oxmysql              # Module SQL
   ensure infinity_core          # Module Framework core
   ensure infinity_skin
   ```
3. Make sure [oxmysql](https://github.com/overextended/oxmysql) is installed and started before this script.
4. Configure the files as needed.

## ⚙️ Configuration

- Main scripts:
  - `client/cl_main.lua` (client logic)
  - `server/sv_main.lua` (server save/load)
  - `cloth_hash_names.lua` and `overlays.lua` (data and overlays)
- User interface: `ui/`

## 🛠 Contribution

Contributions are welcome!
Please create an issue or pull request for any suggestion or improvement.

## 🤝 Support & Links

- Documentation: [https://altitude-dev.gitbook.io/doc/](https://altitude-dev.gitbook.io/doc/)
- Discord support: [https://discord.gg/ncH7GX3XJd](https://discord.gg/ncH7GX3XJd)
- Authors: Shepard, iiRedDev

---

> Module licensed by ALTITUDE-DEV.COM. Any unauthorized reproduction or distribution is prohibited.
