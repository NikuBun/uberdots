use File::Path qw(make_path);
print BOLD BLUE, "[Linux Modules]\n";
print BOLD BLUE, "Common config for Linux including awesomewm, fontconfig and lilyterm.\n";

# Create .config if it doesn't exist
print BLUE, "Checking directory existance, creating non-existing.\n", RESET;
make_path($homedir . "/.config/fuckyou", {verbose => 1});

# Symbolic Links
sym("linux/awesome",    ".config/awesome");
sym("linux/fontconfig", ".config/fontconfig");
sym("linux/lilyterm",   ".config/lilyterm");
sym("linux/gtk-3.0",    ".config/gtk-3.0");
sym("linux/fonts",      ".fonts");


1;