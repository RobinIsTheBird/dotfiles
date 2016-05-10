#!/usr/bin/env bash
# Perform initial setup for a new computer
# Prefer to run this in $HOME

#TODO add a usage message,
# produced by setup_new_computer help|-help|--help|-h|-?
#TODO parameterize all the versions in sub bash scripts,
# with defaults but allow overrides and describe in usage.

# Require sudo credential cache
. ../lib/common/prime_sudo_cache.bash

. ../lib/common/systemdetect.bash
mkdir $HOME/bin

bash ./new_computer/update_etc.bash
bash ./new_computer/pkg_install.bash
bash ./new_computer/virtual_py.bash
bash ./new_computer/node_version.bash
bash ./new_computer/go_version.bash
bash ./new_computer/vim_plugins.bash
bash ./new_computer/dropbox_setup.bash

#TODO test on an ubuntu VM fresh install
#TODO setup a JRE and JDK
#TODO setup Canon with CUPS, or networked through the Mac
