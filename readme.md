# `fmv1992_cookiecutter_shell`

A template for packaging your own `.deb` files.

This is a spin-off from [shell_argument_parsing_file](https://github.com/fmv1992/shell_argument_parsing_file).

This creates a cookiecutter template out of that existing/living project (!).

## Using this repos

```
cookiecutter https://github.com/fmv1992/fmv1992_cookiecutter_shell --no-input --checkout t_234_a_shell_argument_parsing_file_to_cookiecutter_local
```

## Testing

```
cd $(mktemp -d)
cookiecutter https://github.com/fmv1992/fmv1992_cookiecutter_shell --no-input --checkout t_234_a_shell_argument_parsing_file_to_cookiecutter_local
cd ./my_project
git init . && git comm --allow-empty -m "first (empty) commit" && make down package build test
```

## Developing

### Updating this repos

1.  Get a URL of a reverse-cookiecutter template:

    ```
    clear
    cd shell_argument_parsing_file
    rm ./output/deb/*.deb
    bash -xv ./other/cookiecutter/cookiecutter_template
    # Grab the temporary folder.
    ```

1.  Test to see if everything is ok.

    ```
    cd fmv1992_cookiecutter_shell
    rm \{\{\ cookiecutter.project_name\ \}\}
    # Copy the temporary folder back again.
    # cp -rf "$(xclip -o)"/* . && make test
    cp -rf /tmp/tmp.shell_argument_parsing_file.1691876457.Fmaf7s/* . && make test
    ```
