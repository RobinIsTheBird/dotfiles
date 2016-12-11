#!/usr/bin/env bash
# Intended to be sourced from .bash_profile

# Start the ssh-agent.
# It will be used by all forked child processes.
# Before using it, make sure you have a public and private key
# in ~/.ssh. If not, use ssh-keygen to create them.
# Add them to the agent with ssh-add.
# Logout and log back in again to restart the agent.
pgrep ssh-agent >/dev/null || eval $(ssh-agent -s)
