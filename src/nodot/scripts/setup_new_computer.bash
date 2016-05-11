#!/usr/bin/env bash
# Perform initial setup for a new computer
# Prefer to run this in $HOME

#TODO add a usage message,
# produced by setup_new_computer help|-help|--help|-h|-?
#TODO parameterize all the versions in sub bash scripts,
# with defaults but allow overrides and describe in usage.

# Require sudo credential cache
. $HOME/lib/common/prime_sudo_cache.bash

. $HOME/lib/common/systemdetect.bash
mkdir -p $HOME/bin

bash $HOME/scripts/new_computer/update_etc.bash
bash $HOME/scripts/new_computer/pkg_install.bash
bash $HOME/scripts/new_computer/virtual_py.bash
bash $HOME/scripts/new_computer/node_version.bash
bash $HOME/scripts/new_computer/go_version.bash
bash $HOME/scripts/new_computer/vim_plugins.bash
bash $HOME/scripts/new_computer/dropbox_setup.bash

#TODO test on an ubuntu VM fresh install
#TODO setup a JRE and JDK
#TODO setup Canon with CUPS, or networked through the Mac
