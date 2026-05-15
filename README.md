# iOS System Optimizer

Deletes power-hungry iOS services, telemetry, diagnostics, and bloat to improve battery life and performance.

> [!WARNING]
> **This is permanent.** Deleted files cannot be restored without restoring your device via iTunes/Finder. There is no undo.

> [!CAUTION]
> **Use at your own risk.** I am not responsible for any damage, bootloops, data loss, or broken functionality caused by running this script. You accept full responsibility by proceeding.

---

## Compatibility

- ✅ palera1n rootless — iOS 15 / 16
- ✅ Dopamine rootless — iOS 15 / 16
- ⚠️ iOS 17 / 18 — not guaranteed to work
- ⚠️ Rootful — not guaranteed to work
- ❌ FilzaEscaped, Filza via TrollStore, or any jailed file manager — **will not work**

---

## What It Does

- Disables analytics, telemetry, and diagnostics daemons via `launchctl`
- Deletes associated frameworks, bundles, and services from `/System/Library/`
- Removes Siri private learning, CoreDuet, and intelligence engine components
- Removes Apple Watch sync bundles, Exposure Notification, and Find My services
- Removes internal and demo apps, diagnostics apps, and GPU logging
- Deletes iMessage and FaceTime background services *(apps still open, background processes are removed)*

---

## How To Run (Filza)

1. Download `ios-optimizer.sh` to your device
2. Open **Filza File Manager**
3. Navigate to where the file was saved (usually `/var/mobile/Downloads`)
4. Long press `ios-optimizer.sh` → tap **Properties** → set permissions to `755` → tap **Done**
5. Tap `ios-optimizer.sh` → tap **Run as Root**
6. Wait for it to finish — errors saying `No such file or directory` are normal and can be ignored
7. **Reboot your device**

---

## How To Run (SSH)

```bash
# Copy script to device
scp ios-optimizer.sh root@<device-ip>:/var/mobile/

# SSH in (default password: alpine)
ssh root@<device-ip>

# Run it
sh /var/mobile/ios-optimizer.sh

# Reboot
reboot
```

---

## Notes

- `No such file or directory` errors are normal — it just means that file wasn't present on your device
- Reboot is required after running for full effect
- Based on the original [ios-optimizer.sh](https://github.com) script — expanded with `launchctl` daemon disabling for immediate effect and additional service removal
