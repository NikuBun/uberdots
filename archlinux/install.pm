use File::Path qw(make_path);
print BOLD YELLOW, "[Arch Linux Modules] Common config for Arch Linux including awesomewm, fontconfig and lilyterm.\n";

# Create .config if it doesn't exist
print BLUE, "Checking directory existance, creating non-existing.\n", RESET;
make_path($homedir . "/.config", {verbose => 1});

# Symbolic Links
sym("linux/awesome",    ".config/awesome");
sym("linux/fontconfig", ".config/fontconfig");
sym("linux/lilyterm",   ".config/lilyterm");
sym("linux/gtk-3.0",    ".config/gtk-3.0");
sym("linux/fonts",      ".fonts");

print YELLOW, "To ensure the full experience, please install the following packages:\n", RESET;
print "Pacman: cantarell-fonts\n";
print "AUR: gtk-theme-numix icons-theme-numix\n";
print "\n\n";
1;