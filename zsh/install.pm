use File::Path qw(make_path);
header("ZSH", "Sets up Prezto.");

# We are going to assume the script already updated submodules.

# Symbolic Links
sym("zsh/prezto",    ".zprezto");

my @runcoms = glob($homedir . "/.zprezto/runcoms/z*");
for my $runcom ( @runcoms ) {
	sym_any($runcom, $homedir . "/." . basename($runcom));
}

print YELLOW, "To ensure the full experience, please install the following packages:\n", RESET;
print "  Pacman: zsh\n";
print "  Homebrew: zsh\n";
print "  and change your shell to zsh\n";
print "\n\n";
1;