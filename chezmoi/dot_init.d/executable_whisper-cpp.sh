function pull() {
	if command -v whisper-cpp-download-ggml-model >/dev/null 2>&1; then
		model="$1"
		if ! test -f "${XDG_DATA_HOME}/whisper-cpp/ggml-${model}.bin"; then
			whisper-cpp-download-ggml-model "$model"
			mkdir -p "${XDG_DATA_HOME}/whisper-cpp"
			mv "ggml-${model}.bin" "${XDG_DATA_HOME}/whisper-cpp"
		fi
	fi
}

pull small.en
