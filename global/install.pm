use File::Path qw(make_path);
header("Global", "Misc files that should be installed on anything.");

# Symbolic Links
sym("global/mpv",    ".mpv");

print YELLOW, "To ensure the full experience, please install the following packages:\n", RESET;
print "  Pacman: mpv\n";
print "  Homebrew: mpv\n";
print "\n\n";
1;