# Maintainer: @Slipstream8125 <slipstream8125@proton.me>
pkgname=stratos-swayfx-config
pkgver=1.0
pkgrel=1
pkgdesc="SwayFX config for StratOS"
arch=('any')
license=('GPL3')
depends=(
	'swayfx' 'python-pywal' 'kitty' 'swayosd' 'swaync'
	'waybar' 'superfile' 'thunar' 'swww' 'stratos-fish-config' "nwg-displays" "stratos-waybar-config"
	)

source=()
md5sums=()

prepare() {
    cp -r "$startdir"/.config "$srcdir"/
}
package() {
    install -d "$pkgdir"/etc/skel/.config
    cp -ra "$srcdir"/.config/sway/ "$pkgdir"/etc/skel/.config/
}
