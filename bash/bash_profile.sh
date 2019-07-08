# I have implemented personal changes to a .bash_profile file in two different ways, sometimes just adding my changes to
# the end of .bash_profile and other times putting all my changes in a separate file and calling it from .bash_profile or
# even .bashrc

# clpwd - this could be improved by changing it to a function that detects if dotglob is set or not

function gjl {
	echo
	echo "Configured Commands"
	echo "==================="
	echo "  gjl: display this list of aliases and functions"
	echo
	echo "  clpwd: this will remove all files, including . files from the current directory"
	echo "  devclean: remove *.o and *.c files from ~/dev/ path"
	echo "  powershell: this maps to pwsh which is what actually launches PowerShell Core"
	echo
}

alias clpwd='shopt -s dotglob && rm -fR ./* && shopt -u dotglob'
alias devclean='find ~/dev/ -name "*.[oc]" -exec rm {}\;'
alias powershell=pwsh

gjl

echo