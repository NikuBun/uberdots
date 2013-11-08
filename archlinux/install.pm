use File::Path qw(make_path);
header("Arch Linux Modules", "Common config for Arch Linux including awesomewm, fontconfig and lilyterm.");

# Create .config if it doesn't exist
print BLUE, "Checking directory existance, creating non-existing.\n", RESET;
make_path($homedir . "/.config", {verbose => 1});

# Symbolic Links
sym("archlinux/awesome",    ".config/awesome");
sym("archlinux/fontconfig", ".config/fontconfig");
sym("archlinux/lilyterm",   ".config/lilyterm");
sym("archlinux/gtk-3.0",    ".config/gtk-3.0");
sym("archlinux/fonts",      ".fonts");

print YELLOW, "To ensure the full experience, please install the following packages:\n", RESET;
print "  Pacman: cantarell-fonts\n";
print "  AUR: gtk-theme-numix icons-theme-numix\n";
print "\n\n";
1;