# I have implemented personal changes to a .bash_profile file in two different ways, sometimes just adding my changes to
# the end of .bash_profile and other times putting all my changes in a separate file and calling it from .bash_profile or
# even .bashrc

function gjl {
    echo
    echo "Configured Commands"
    echo "==================="
    echo "  gjl: display this list of aliases and functions"
    echo "  powershell: this maps to pwsh which is what actually launches PowerShell Core"
    echo "  rmpwd: this will remove all files, including . files from the current directory"
    echo
}

alias powershell=pwsh
alias rmpwd='shopt -s dotglob && rm -fR ./* && shopt -u dotglob'

gjl

echo