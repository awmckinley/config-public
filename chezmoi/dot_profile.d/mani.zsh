export MANI_CONFIG="${XDG_CONFIG_HOME}/mani/hosts/${HOST}.yaml"
export MANI_USER_CONFIG="${XDG_CONFIG_HOME}/mani/config.yaml"

alias mani-status-all='mani run status --all --ignore-non-existing | grep -v "^$" | grep -v "TASK"'
