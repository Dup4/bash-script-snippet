<img align="right" width="96px" src="./assets/1200px-Bash_Logo_Colored.svg.png">

# Bash Script Snippet
[![Shellcheck](https://github.com/Dup4/bash-script-snippet/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/Dup4/bash-script-snippet/actions/workflows/shellcheck.yml)

Commonly used bash script snippet.

## Usage

```bash
# cdn.jsdelivr.net
bash <(curl -s -L https://cdn.jsdelivr.net/gh/Dup4/bash-script-snippet@latest/${script}.sh) ${your args}

# raw.github
bash <(curl -s -L https://raw.githubusercontent.com/Dup4/bash-script-snippet/main/${script}.sh) ${your args}

# You can make a function
function bs() {
    script_name="${1}"
    bash <(curl -s -L https://raw.githubusercontent.com/Dup4/bash-script-snippet/main/${script_name}.sh) "${@:2}"
}
```

## License

[MIT](./LICENSE) License © 2021 [Dup4](https://github.com/Dup4)
