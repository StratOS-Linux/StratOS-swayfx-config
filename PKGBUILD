# Maintainer: @Slipstream8125 <slipstream8125@proton.me>
pkgname=stratos-swayfx-config
pkgver=1.0
pkgrel=8
pkgdesc="SwayFX config for StratOS"
arch=('any')
license=('GPL3')
depends=(
	'swayfx' 'kitty' 'swayosd' 'swaync' 'stratos-eww-config' 'swaylock-effects' 'vicinae-bin'
	'waybar' 'thunar' 'swww' 'stratos-swaync-config' 'stratos-kitty-config' 'stratos-fish-config' "nwg-displays" "stratos-waybar-swayfx-config"
	'xdg-desktop-portal-wlr' 'conky' 'waytator'
	)

source=()
md5sums=()

prepare() {
    cp -r "$startdir"/.config "$srcdir"/
	cp -r "$startdir"/conky "$srcdir"/
}
package() {
    install -d "$pkgdir"/etc/skel/.config
    cp -ra "$srcdir"/.config/sway/ "$pkgdir"/etc/skel/.config/
    cp -ra "$srcdir"/.config/swaylock/ "$pkgdir"/etc/skel/.config/
	cp -ra "$srcdir"/.config/vicinae/ "$pkgdir"/etc/skel/.config/
	cp "$srcdir"/conky/.conkyrc "$pkgdir"/etc/skel/.conkyrc
}
