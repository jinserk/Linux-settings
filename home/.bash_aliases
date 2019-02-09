alias update='sudo apt update'
alias upgrade='sudo apt --purge dist-upgrade && sudo apt --purge autoremove && sudo apt autoclean'
alias pip_upgrade="pip list -o --format=freeze | awk -F'=' '{ print $1 }' | xargs pip install --upgrade"
