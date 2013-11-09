use File::Path qw(make_path);
header("Vim", "Vim and friends!");

# Symbolic Links
sym("vim/dotvim", ".vim");
sym("vim/vimrc",  ".vimrc");


# Create .config if it doesn't exist
print BLUE, "Checking directory existance, creating non-existing.\n", RESET;
make_path($scriptroot . "/vim/dotvim/bundle", {verbose => 1});


my $vundledir = $scriptroot . "/vim/dotvim/bundle/vundle";

# Install Vundle
if (! -e $vundledir) {
	print BLUE, "Installing Vundle to $vundledir\n", RESET;
	system("git clone https://github.com/gmarik/vundle.git $vundledir");
}

# Update Vundle
print BLUE, "Updating Vundle Plugins\n", RESET;
system("vim --noplugin -u $homedir/.vim/vundles.vim -N \"+set hidden\" \"+syntax on\" +BundleClean +BundleInstall +qall");

print YELLOW, "To ensure the full experience, please install the following packages:\n", RESET;
print "  Pacman: vim\n";
print "  Homebrew: vim\n";
print "\n\n";
1;