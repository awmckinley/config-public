#!/usr/bin/env bash

# SSH agent paths
agent_sock="${HOME}/.ssh/agent.sock"
macos_agent="${HOME}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
nixos_agent="${HOME}/.1password/agent.sock"

# link the SSH agent socket
if [ -S "${macos_agent}" ]; then
	ln -sf "${macos_agent}" "${agent_sock}"
elif [ -S "${nixos_agent}" ]; then
	ln -sf "${nixos_agent}" "${agent_sock}"
fi
