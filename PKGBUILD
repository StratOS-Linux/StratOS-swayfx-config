# Maintainer: @Slipstream8125 <slipstream8125@proton.me>
pkgname=stratos-swayfx-config
pkgver=1.0
pkgrel=1
pkgdesc="SwayFX config for StratOS"
arch=('any')
license=('GPL3')
depends= (
	'swayfx' 'pywal' 'kitty' 'swayosd' 'swaync' 'stratvim'
	'waybar' 'superfile' 'thunar' 'swww' 'StratOS-bash-config' 'StratOS-fish-config' "nwg-displays" "StratOS-waybar-pywal"
	)

source=('.config')
md5sums=('SKIP')

package() {
	install -d "$pkgdir/etc/skel/.config"
	cp -r "$srcdir/.config/" "$pkgdir/etc/skel/.config"
	echo "Configuration files have been copied over to /etc/skel..."
	echo "Feel free to copy these files to ~/.config/ and make any changes as you wish"
}
